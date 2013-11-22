package Money;
use strict;
use warnings;
use utf8;
use feature 'say';
use Data::Dumper;
use Bank;
use Sum;

sub new {
    my ($class, $amount, $currency)  = @_;

    bless {
        protected_amount => $amount,
        protected_currency => $currency,
    }, $class;
}

sub protected_get_amount {
    my $self = shift;
    return $self->{protected_amount};
}

sub equals {
    my $self = shift;
    my $money = shift;
    return $self->{protected_amount} == $money->{protected_amount}
        && $self->currency() eq $money->currency();
}

sub dollar {
    my $self = shift;
    my $amount = shift;

    return Money->new($amount, "USD");
}

sub franc {
    my $self = shift;
    my $amount = shift;

    return Money->new($amount, "CHF");
}

sub currency {
    my $self = shift;

    return $self->{protected_currency};
}

sub times {
    my $self = shift;
    my $multiplier = shift;

    return Money->new($self->{protected_amount} * $multiplier, $self->{protected_currency});
}

sub plus {
    my $self = shift;
    my $addend = shift;

    return Sum->new($self, $addend);
}

sub reduce {
    my $self = shift;
    my ($bank, $to) = @_;

    my $rate = $bank->rate($self->{protected_currency}, $to);
    return Money->new($self->{protected_amount} / $rate, $to);
}

1;
