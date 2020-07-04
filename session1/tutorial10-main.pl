use strict;
use warnings;

$|=1;

sub main {
 
  # \d digit
  # \s space
  # \S non-space
  # \w alphanumeric

  my $text = 'I am     117 years old tomorrow.';

  if($text =~ /(am\s*\d+)/){
    print "Matched: '$1'\n";
  }

  if($text =~ /(y\S*)/){
    print "Matched: '$1'\n";
  }

  $text = 'Iam117yearsold_tomorrow.';
  if($text =~ /(\w*)/){
    print "Matched: '$1'\n";
  }
}

main();