use strict;
use warnings;
use Data::Dumper;

#https://stackoverflow.com/questions/185114/how-do-i-use-a-perl-module-in-a-directory-not-in-inc
use lib '.';
use Speak qw(test greet);
# use Speak;

$|=1;

sub main {
  # Speak::test();

  test();
  greet();
  # my @dogs = qw(retriever labrador alsatina);
  # print Dumper(@dogs);
}

main();