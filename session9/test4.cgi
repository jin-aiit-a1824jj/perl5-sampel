#!/usr/bin/perl

use strict;
use warnings;

use CGI;

my $CGI = new CGI();

sub main {
  print $CGI->header();

  #my $query = $CGI->param("query");
  
  my @query = $CGI->param();
  #@query = map("badger", @query);
  @query = map($_ . ": " . $CGI->param($_), @query);
  my $query = join(', ', @query);



print<<HTML;
    <html>
    <form action="test4.cgi" method="post">
    <input type="text" name="query" />
    <input type="hidden" name="go" value="true" />
    <input type="submit" name="submit" value="Go" />
    </form>

    <p>Last submitted: $query</p>

    </html>
HTML

}

main();
