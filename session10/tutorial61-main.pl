use strict;
use warnings;

use File::Copy;

$|=1;

sub main {
  if(copy("Source","Destination")){
    print "One file copied. \n";
  }else {
    print "Unable to copy file.\n";
  }

  if(move("Source","Destination")){
    print "One file moved. \n";
  }else {
    print "Unable to move file.\n";
  }

  unlink("Destination");
}

main();