use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
  my $input ='test.csv';

  unless(open(INPUT, $input)){
    die "\nCannot open $input\n";
  }

  my @lines;
  # my $count = 0;

  while(my $line = <INPUT>){

    chomp $line;
    # print "'$line'\n";

    my @values = split /\s,*\s*/, $line;

    # print join '|', @values;
    # print Dumper(@values);
    
    # $lines[$count] = $line;
    # $count++;

    push @lines, \@values;
  }

  close INPUT;

  print $lines[3][1] . "\n";

  foreach my $line(@lines){
    print Dumper($line);
    print "Name ", $line->[0] . "\n";
  }
}

main();