package Money;
use strict;
use warnings;
use utf8;
use feature 'say';
use Data::Dumper;

sub new {
    my $class  = shift;
    my $amount = shift;

    bless {
        amount => $amount,
    }, $class;
}

sub protected_get_amount {
    my $self = shift;
    return $self->{amount};
}

sub equals {
    my $self = shift;
    my $money = shift;
    return $self->protected_get_amount() == $money->protected_get_amount()
        && ref $self eq ref $money; #同一クラスの比較の場合のみ真
}

1;



