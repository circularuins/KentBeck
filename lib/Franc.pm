package Franc;
use strict;
use warnings;
use utf8;
use feature 'say';

use parent "Money";

sub times {
    my $self = shift;
    my $multiplier = shift;

    return Franc->new($self->protected_get_amount() * $multiplier);
}

1;
