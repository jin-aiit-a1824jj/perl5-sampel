use strict;
use warnings;
use Data::Dumper;

#https://stackoverflow.com/questions/185114/how-do-i-use-a-perl-module-in-a-directory-not-in-inc
use lib '.';
use Communication::Speak qw(test greet);

$|=1;

sub main {
  test();
  greet();
}

main();