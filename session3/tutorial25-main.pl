use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;

$|=1;

sub main {
  my $content = HTTP::Tiny->new->get("http://www.caveofprogramming.com/");

  unless($content->{success}){
    die "Unreachable url\n";
  }

  # print Dumper($content);

  if($content->{"content"} =~ m'<a class="mainlink" href=".+?">(.+?)</a>'i){
    #print $0;
    my $title = $1;
    print "Title: $title\n";
  }else{
    print "\nTitle not found\n";
  }

}

main();