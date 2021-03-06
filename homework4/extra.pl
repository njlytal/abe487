#!/use/bin/env perl

use strict;
use warnings;
use autodie;

@ARGV or die 'No input';

my $in  = shift @ARGV;
my $out = 'myresult.txt';

open my $in_fh,  '<', $in;
open my $out_fh, '>', $out;

my $fact  = 0;    # Stores a factorial for computation
my $count = 0;    # Counts down numbers for factorial

while (my $line = <$in_fh>) {
    chomp($line);
    if ($line % 2 == 0) {    # Check Divisible by 2
        if ($line < 24) {
            print $line, "\n";
        }
    }
    else {
        $fact  = $line;
        $count = $line;
        while ($count > 1) {
            $count--;
            $fact *= $count;
        }
        print $out_fh $fact, "\n";
    }
}

__END__

I think you copy/pasted the open in/out code as you're opening out for 
append again?
