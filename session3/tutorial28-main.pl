use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;

$|=1;

sub main {
  my $response = HTTP::Tiny->new->get("http://www.gutenberg.org/");

  unless($response->{success}){
    die "Unreachable url\n";
  }

  my $content = $response->{content};

  my @classes = $content =~ m|class="([^"']*?)"|ig;

  if(@classes == 0) {
    print "No matches\n";
  } else {
    foreach my $class(@classes){
      print "$class\n";
    }
  }

}

main();