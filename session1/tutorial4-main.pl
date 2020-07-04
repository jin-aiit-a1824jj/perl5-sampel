use strict;
use warnings;

$|=1;

sub main {
=pod
  my $file = '/home/pbl/udemy-perl5-tutorial/session1/HelloWorld.pl';

  if ( -f $file) {
    print "Found file: $file\n";
  } else {
    print "Found not file: $file\n";
  }
=cut

  my @files = (
    '/home/pbl/udemy-perl5-tutorial/session1/HelloWorld.pl',
    '/home/pbl/udemy-perl5-tutorial/session1/tutorial3-main.pl',
    '/home/pbl/udemy-perl5-tutorial/session1/noExistFile.pl',
  );

  foreach my $file (@files){
    if ( -f $file) {
      print "Found file: $file\n";
    } else {
      print "Found not file: $file\n";
    }
  }

}

main();