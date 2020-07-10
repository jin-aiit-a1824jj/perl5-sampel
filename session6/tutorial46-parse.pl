use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use XML::Simple;

use DBI;

$|=1;

=pod
  this is acme xml parse version 1.0
  use with care
=cut

sub main {
	my %opts;
	
	# Get command line options
	getopts('d:r', \%opts);
	
	if(!checkusage(\%opts)) {
		usage();
		exit();
	} 
	
	my $input_dir = $opts{"d"};

	my @files = get_files($input_dir);
	
	my @data = process_files(\@files, $input_dir);

	add_to_database(\@data);

  # print Dumper(@data);

}

sub add_to_database {
	my $data = shift;

	my $dbh = DBI->connect("dbi:mysql:Bands", "mybanddb", "password");

  unless(defined($dbh)) {
    die "Cannot connect to database.\n";
  }

  print "Connected to database.\n";

	my $sth_bands = $dbh->prepare('insert into Bands (name) value (?)');
	my $sth_albums = $dbh->prepare('insert into Albums (name, position, band_id) value (?, ?, ?)');

	unless($sth_bands){
		die "Error preparing band insert SQL\n";
	}

	unless($sth_albums){
		die "Error preparing album insert SQL\n";
	}

	$dbh->do('delete from Albums') or die "Can't clean bands tables.\n";
	$dbh->do('delete from Bands') or die "Can't clean bands tables.\n";
	
	foreach my $data(@$data) {
		my $band_name = $data->{"name"};
		my $albums = $data->{"albums"};

		print "Inserting $band_name into database ...\n";

		unless($sth_bands->execute($band_name)){
			die "Error executing SQL\n";
		}

		my $band_id = $sth_bands->{'mysql_insertid'};

		foreach my $album(@$albums){
			my $album_name = $album->{"name"};
			my $album_position = $album->{"position"};

			print "$album_name, $album_position\n";
			unless($sth_albums->execute($album_name, $album_position, $band_id)){
				die "Unlable to execute albums insert.\n";
			}

		}
		
	}

	$sth_bands->finish();
	$sth_albums->finish();

  $dbh->disconnect();

	print "Completed.\n";
}

sub process_files {
	my ($files, $input_dir) = @_;
	
	my @data;

	foreach my $file(@$files){
		push @data, process_file($file, $input_dir);
	}

  return @data;
}

sub process_file {
	my ($file, $input_dir) = @_;
	print "Processing $file is $input_dir ...\n";

	my $filepath = "$input_dir/$file";
	open(INPUTFILE, $filepath) or die "Unable to open $filepath\n";
  
	undef $/;
	
	my $content = <INPUTFILE>;

	close(INPUTFILE);

	#print $content;

	my $parser = new XML::Simple;

	my $dom = $parser->XMLin($content, ForceArray => 1);

	# print Dumper($dom);

	my @output;

	foreach my $band(@{$dom->{"entry"}}){
		my $band_name = $band->{"band"}->[0];

		print "\n\n$band_name\n";
		print "==============\n";

		my $albums = $band->{"album"};
		my @albums;

		foreach my $album(@$albums){
			my $album_name = $album->{"name"}->[0];
			my $chartposition = $album->{"chartposition"}->[0];

			print "$album_name: $chartposition\n";

			push @albums, {
				"name" => $album_name,
				"position" => $chartposition
			};
		}

		push @output, {
			"name" => $band_name,
			"albums" => \@albums
		};
	} # foreach band

	# print Dumper(\@output);
	return @output;
}

sub get_files {
  	
  my $input_dir = shift;
	
	unless(opendir(INPUTDIR, $input_dir)) {
		die "\nUnable to open directory '$input_dir'\n";
	}
	
	my @files = readdir(INPUTDIR);
	
	closedir(INPUTDIR);
	
	@files = grep(/\.xml$/i, @files);
	
	return @files;
}

sub checkusage {
	my $opts = shift;
	
	my $r = $opts->{"r"};
	my $d = $opts->{"d"};
	
	# Image a is optional; don't really need to refer to it here at all.
	
	# r is optional
	# d is mandatory.
	
	unless(defined($d)) {
		return 0;
	}
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-d <directory>	specify directory in which to find XML files.
	-r run the program; process the files

example usage:
	# Process files in currect directory.
	perl main.pl -d . -r
	
USAGE
}

main();