package Bank;
use strict;
use warnings;
use utf8;
use feature 'say';

sub new {
    my $class = shift;
    bless {}, $class;
}

sub reduce {
    my $self = shift;
    my ($source, $to) = @_;

    my $sum = $source;
    return $sum->reduce($to);
}

1;
