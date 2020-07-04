use strict;
use warnings;

$|=1;

sub main {
=pod 
  my $output = '/home/pbl/udemy-perl5-tutorial/session1/output.txt';
  open(OUTPUT, '>'.$output) or die "Can't create: $output \n";
  print OUTPUT "Hello\n";
  close(OUTPUT);
=cut

  my $input = '/home/pbl/udemy-perl5-tutorial/session1/mymanjeeves.txt';
  open(INPUT, $input) or die "Input file $input not found.";

  my $output = '/home/pbl/udemy-perl5-tutorial/session1/output.txt';
  open(OUTPUT, '>'.$output) or die "Can't create: $output \n";

  while(my $line = <INPUT>) {
    if($line =~ /\begg\b/){
      # $line =~ s/you/YOU/ig;
      $line =~ s/hen/dinosaur/ig;
      print OUTPUT $line;
    }
  }

  close(INPUT);
  close(OUTPUT);

}

main();