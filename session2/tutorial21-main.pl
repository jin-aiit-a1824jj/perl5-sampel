use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
  my $input ='test.csv';

  unless(open(INPUT, $input)){
    die "\nCannot open $input\n";
  }

  my @data;

  while(my $line = <INPUT>){

    chomp $line;
    # print "'$line'\n";

    my ($name, $payment, $date) = split /\s*,\s*/, $line;

    my %values = (
      "Name" => $name,
      "Payment" => $payment,
      "Date" => $date,
    );

    push @data, \%values;
  }

  close INPUT;

  #print Dumper(@data);

  foreach my $data(@data) {
    print $data->{"Payment"} . "\n";
  }

  print "Descartes: ". $data[3]{"Name"};
}

main();