use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$|=1;

=pod
  this is acme xml parse version 1.0
  use with care
=cut

# perl tutorial33-parse.pl -a -f text.xml -c

sub main {
  my %opts;
  getopts('af:r', \%opts);

  if(!checkusage(\%opts)){
    usage();
  }

=pod
  perl tutorial33-parse.pl -a -f text.xml -r
  a => 1
  r => 1
  f => text.xml
=cut
  
}

sub checkusage {
  my $opts = shift;
  
  my $a = $opts->{"a"};
  my $r = $opts->{"r"};
  my $f = $opts->{"f"};

  # Image a is optional; don't really need to refer to it here at all
  # r is mandatory: it meas "run the program"
  # f is mandatory.

  unless(defined($r) and defined($f)){
    return 0;
  }

  unless($f =~ /\.xml$/i){
    print "file must have the extention .xml\n";
    return 0;
  }

  return 1;
}

sub usage {
  my $help = <<USAGE;

hello
usage: per main.pl -f <file name> -a
-f <file name>: specify XML file name to parse
-a              turn off error checking
-r run the program

example usage:
  perl main.pl -r -f text.xml -a

USAGE
  die $help;
  #exit();
}

main();