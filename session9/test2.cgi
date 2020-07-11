#!/usr/bin/perl

use strict;
use warnings;

use CGI;

my $CGI = new CGI();

sub main {
  print $CGI->header();

print<<HTML;
    <html>
    <b>Hello world</b>
    </html>
HTML

}

main();