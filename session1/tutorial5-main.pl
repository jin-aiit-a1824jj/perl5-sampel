use strict;
use warnings;

$|=1;

sub main {
  my $file = '/home/pbl/udemy-perl5-tutorial/session1/mymanjeeves.txt';
  
  open(INPUT, $file) or die "Input file $file not found.";

  while(my $line = <INPUT>) {
    # print $line;
    if($line =~ / egg /){
      print $line;
    }
  }

  close(INPUT);
}

main();