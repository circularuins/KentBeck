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

sub private_get_amount {
    my $self = shift;
    return $self->{amount};
}

sub times {
    my $self = shift;
    my $multiplier = shift;

    return Dollar->new($self->private_get_amount() * $multiplier);
}

sub equals {
    my $self = shift;
    my $arg = shift;
    return $self->private_get_amount() == $arg->private_get_amount();
}

1;
