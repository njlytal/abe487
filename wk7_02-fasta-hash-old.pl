#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 2

if(!@ARGV){
    @ARGV = "Perl_V.genesAndSeq.txt";
}

my $file = shift @ARGV;


open my $fh,'<', $file;

my %hash;

my $seq;
my $counter;
my $header;


while (my $line = <$fh>){
    chomp $line;

    # If it's a header with ">"
    if($line  =~ /^>(.*)/){
        if($seq) {
            $hash{$header}=$seq;
        }

        $header = $1;
        $counter++;
        
        #Sequence resets
        $seq = '';
    }
    else{
        $seq.=$line;
    }
}

$hash{$header}=$seq;

# say Dumper(\%hash);

my @sortkeys = sort{ length($hash{$a}) <=> length($hash{$b}) } keys %hash;

foreach my $label (@sortkeys){
    print "\n";
    say "$label: ", length($hash{$label});
}

