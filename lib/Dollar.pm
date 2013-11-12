package Dollar;
use strict;
use warnings;
use utf8;
use feature 'say';

sub new {
    my $class  = shift;
    my $amount = shift;

    bless {
        amount => $amount,
    }, $class;
}

sub get_amount {
    my $self = shift;
    return $self->{amount};
}

sub times {
    my $self = shift;
    my $multiplier = shift;

    return Dollar->new($self->{amount} * $multiplier);
}

1;
