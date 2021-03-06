#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

# PROBLEM 3


# Create two hashes, one for each txt file

#if(scalar(@ARGV) != 2){

unless (@ARGV == 2) {
    die "Please provide two files.\n";
}

my ($file1, $file2) = @ARGV;
#my $file1 = shift @ARGV;
#my $file2 = shift @ARGV;

open my $fh1, '<', $file1;
open my $fh2, '<', $file2;


my (%hash1, %hash2);

while (my $line = <$fh1>) {
    chomp($line);
    for my $word (split /\s+/, $line) {
        $word =~ s/[^A-Za-z0-9]//g;
        $hash1{lc($word)} = 1;  # Standardize to lowercase
    }
}

while(my $line = <$fh2>){
    chomp($line);
    my @words = split /\s+/, $line;
    for my $word (@words){
        $word =~ s/[^A-Za-z0-9]//g;
        $hash2{lc($word)} = 1; # Standardize to lowercase
    }
}

# CHECK CONTENTS
#say "HASH 1: ";
#say Dumper(\%hash1);
#say "HASH 2: ";
#say Dumper(\%hash2);

# Define array of common words
my $i = 0;
for my $key (sort keys %hash1) {
    if (exists $hash2{$key}) {
        say $key;
        $i++;
    }
}

say "Found $i words in common.";

#say Dumper(\@common);
