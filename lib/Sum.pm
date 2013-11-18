package Sum;
use strict;
use warnings;
use utf8;
use feature 'say';

sub new {
    my $class = shift;
    my ($augend, $addend) = @_;
    
    bless {
        augend => $augend,
        addend => $addend,
    }, $class;
}

sub reduce {
    my $self = shift;
    my $to = shift;

    my $amount = $self->{augend}->{protected_amount} + $self->{addend}->{protected_amount};
    return Money->new($amount, $to);
}

1;
