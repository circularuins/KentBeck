use strict;
use warnings;
use utf8;
use Test::More;
use Data::Dumper;

use_ok 'Money';

subtest '乗法のテスト' => sub {
    my $five = Money->dollar(5);
    ok Money->dollar(10)->equals($five->times(2)), '$5*2=$10';
    ok Money->dollar(15)->equals($five->times(3)), '$5*3=$15';
};

subtest '等価性のテスト'  => sub {
    ok Money->dollar(5)->equals(Money->dollar(5)), '$5は$5と等しい';
    ok !Money->dollar(5)->equals(Money->dollar(6)), '$5は$6と等しくない';
    ok !Money->franc(5)->equals(Money->dollar(5)), '5CHFと5$は等しくない';
};

subtest '通貨のテスト' => sub {
    is Money->dollar(1)->currency(), "USD", '文字列USDを返すこと';
    is Money->franc(1)->currency(), "CHF", '文字列CHFを返すこと';
};

subtest '加法のテスト1' => sub {
    my $five = Money->dollar(5);
    my $result = $five->plus($five);
    my $sum = $result;
    ok $five->equals($sum->{augend});
    ok $five->equals($sum->{addend});
};

subtest 'Sumオブジェクトをreduceするテスト' => sub {
    my $sum = Sum->new(Money->dollar(3), Money->dollar(4));
    my $bank = Bank->new();
    my $result = $bank->reduce($sum, "USD");
    ok Money->dollar(7)->equals($result);
};

subtest 'Moneyオブジェクトをreduceするテスト' => sub {
    my $bank = Bank->new();
    my $result = $bank->reduce(Money->dollar(1), "USD");
    ok Money->dollar(1)->equals($result);
};

done_testing;

