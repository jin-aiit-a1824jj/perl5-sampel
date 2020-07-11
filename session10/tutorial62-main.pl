use strict;
use warnings;

$|=1;

sub main {

  my $command = 'cd ..; ls -al';
  my @output = `$command`;

  print join('', @output);
}

main();