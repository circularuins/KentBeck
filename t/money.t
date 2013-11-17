use strict;
use warnings;
use utf8;
use Test::More;

use_ok 'Money';

subtest 'ドルの乗法のテスト' => sub {
    my $five = Money->dollar(5);
    ok Money->dollar(10)->equals($five->times(2)), "合計は10";
    ok Money->dollar(15)->equals($five->times(3)), "合計は15";
};

subtest 'ドルの等価性のテスト'  => sub {
    ok Money->dollar(5)->equals(Money->dollar(5)), "＄5は＄5と等しい";
    ok !Money->dollar(5)->equals(Money->dollar(6)), "＄5は＄6と等しくない";
};

subtest 'フランの乗法のテスト' => sub {
    my $five = Money->franc(5);
    ok Money->franc(10)->equals($five->times(2)), "合計は10";
    ok Money->franc(15)->equals($five->times(3)), "合計は15";
};

subtest 'フランの等価性のテスト'  => sub {
    ok Money->franc(5)->equals(Money->franc(5)), "5CHFは5CHFと等しい";
    ok !Money->franc(5)->equals(Money->franc(6)), "5CHF6CHFと等しくない";
};

subtest 'フランとドルの等価性のテスト' => sub {
    ok !Money->franc(5)->equals(Money->dollar(5)), '5CHFと5$は等しくない';
};

subtest '通貨のテスト' => sub {
    is Money->dollar(1)->currency(), "USD", "文字列USDを返すこと";
    is Money->franc(1)->currency(), "CHF", "文字列CHFを返すこと";
};

done_testing;
