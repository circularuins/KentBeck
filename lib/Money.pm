package Money;
use strict;
use warnings;
use utf8;
use feature 'say';
use Dollar;
use Franc;
use Data::Dumper;

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
        && ref $self eq ref $money; #同一クラスの比較の場合のみ真
}

sub dollar {
    my $self = shift;
    my $amount = shift;

    return Dollar->new($amount, "USD");
}

sub franc {
    my $self = shift;
    my $amount = shift;

    return Franc->new($amount, "CHF");
}

sub currency {
    my $self = shift;

    return $self->{protected_currency};
}

1;
