use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$|=1;

=pod
  this is acme xml parse version 1.0
  use with care
=cut

sub main {
  my %opts;
  getopts('af:c', \%opts);

  if(!checkusage()){
    usage();
  }
}

sub checkusage {
  return 0;
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