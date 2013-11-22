package Bank;
use strict;
use warnings;
use utf8;
use feature 'say';
use Data::Dumper;

sub new {
    my $class = shift;
    my $rate_table;

    bless {
        rate_table => $rate_table,
    }, $class;
}

sub reduce {
    my $self = shift;
    my ($source, $to) = @_;

    return $source->reduce($self, $to);
}

sub rate {
    my $self = shift;
    my ($from, $to) = @_;

    return $self->{rate_table}{$from}{$to}
        ? $self->{rate_table}{$from}{$to}
        : 1;
}

sub addrate {
    my $self = shift;
    my ($from, $to, $rate) = @_;

    #レート記録用のハッシュにデータ追加
    $self->{rate_table}{$from}{$to} = $rate;
}
1;
