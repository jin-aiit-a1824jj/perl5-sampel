use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;

$|=1;

sub main {
  my $response = HTTP::Tiny->new->get("http://example.com");

  unless($response->{success}){
    die "Unreachable url\n";
  }

  my $content = $response->{content};

  # <a herf="http://news.bbc.co.uk">BBC News</a>
  # []
  while($content =~ m|<\s*a\s+[^>]*href\s*=\s*['"]([^>"']+)['"][^>]*>\s*([^<>]*)\s*</|sig){
    print "$2: $1\n"
  }

}

main();