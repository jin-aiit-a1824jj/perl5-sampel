use strict;
use warnings;

# use LWP::Simple;
# use LWP::UserAgent;
use HTTP::Tiny;

sub main {
  print "Downloading ...\n";
  
  # my $res = get("http://spycedconcepts.uk/");
  # die "Couldn't get it!" if(! defined $res);
  # print "$res";

  # print get("http://www.example.com/");
  # getstore("http://www.caveofprogramming.com", "home.html");
  # my $code = getstore('http://www.caveofprogramming.com/wp-content/themes/squiffy/images/logo.png', 'logo.png');

  # my $ua = LWP::UserAgent->new();
  # print $ua->get("http://www.example.com")->decoded_content;

  my $response = HTTP::Tiny->new->get('http://www.example.com/');
  #die "Failed!\n" unless $response->{success}; 
  if(!$response->{success}){
    print "$response\n";
    die "Failed!\n";
  }
  print "$response->{status} $response->{reason}\n";
 
  while (my ($k, $v) = each %{$response->{headers}}) {
      for (ref $v eq 'ARRAY' ? @$v : $v) {
          print "$k: $_\n";
      }
  }
 
  print $response->{content} if length $response->{content};

  print "Finished ...\n";
}

main();