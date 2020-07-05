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
  getopts('af:c', \%opts);

  if(!checkusage(\%opts)){
    usage();
  }

=pod
  perl tutorial33-parse.pl -a -f text.xml -c
  a => 1
  c => 1
  f => text.xml
=cut


  my $opts_ref = \%opts;
  
  # use has directly.
  print $opts{"f"}."\n";

  # use reference to hash;
  print $opts_ref->{"f"}."\n";
  
}

sub checkusage {

  #print Dumper(@_);

  # my %opts = @_; 
  # print Dumper(%opts);
  # print $opts{"f"};

  my $opts_ref = shift;
  print $opts_ref->{"f"} . "\n";  

  return 1;
}

sub usage {
  my $help = <<USAGE;

hello
usage: per main.pl -f <file name> -a
-f <file name>: specify XML file name to parse
-a              turn off error checking

example usage:
  perl main.pl -f text.xml -a

USAGE
  die $help;
  #exit();
}

main();