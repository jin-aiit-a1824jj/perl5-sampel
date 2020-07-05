use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$|=1;

# https://www.caveofprogramming.com/perl-tutorial/perl-command-line-options.html

sub main {

 # print Dumper(@ARGV);
 # print $ARGV[0];

  #perl tutorial29-main.pl -f text.xml
  my %opts;
  getopts('f:', \%opts);

  print Dumper(%opts);

  my $file = $opts{'f'};
  print "File: $file\n";
}

main();