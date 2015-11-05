#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;



#PSEUDOCODE
# Read in a file name and regex from command line
# Create a SeqIO Object to store the fasta file info
# Create a search subroutine to search for regex inputted
# Create an output filehandle & filename based on regex (w/o word chars)
# Within search:
# * Create an array to store sequence IDs. Length will give # ids.
# * For each array entry, append a line to a new file



main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }; 
    
    my $file = shift;
    my $regex = shift;

    # Use search subroutine to locate pattern
    #search($file, $regex);

    say "OK";
}

# --------------------------------------------------
#sub search {
#    return;
#}


# --------------------------------------------------

sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Retrieve all IDs from a FASTA file matching a given pattern using regex

=head1 SEE ALSO

perl.

=head1 AUTHOR

NICHOLAS LYTAL E<lt>njlytal@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 Nick

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut