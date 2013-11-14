use strict;
use warnings;
use utf8;
use Test::More;

use_ok 'Dollar';

subtest 'ドルの乗法のテスト' => sub {
    my $five = Dollar->new(5);
    ok Dollar->new(10)->equals($five->times(2)), "合計は10";
    ok Dollar->new(15)->equals($five->times(3)), "合計は15";
};

subtest 'ドルの等価性のテスト'  => sub {
    ok Dollar->new(5)->equals(Dollar->new(5)), "＄5は＄5と等しい";
    ok !Dollar->new(5)->equals(Dollar->new(6)), "＄5は＄6と等しくない";
};

use_ok 'Franc';

subtest 'フランの乗法のテスト' => sub {
    my $five = Franc->new(5);
    ok Franc->new(10)->equals($five->times(2)), "合計は10";
    ok Franc->new(15)->equals($five->times(3)), "合計は15";
};

subtest 'フランの等価性のテスト'  => sub {
    ok Franc->new(5)->equals(Franc->new(5)), "5CHFは5CHFと等しい";
    ok !Franc->new(5)->equals(Franc->new(6)), "5CHF6CHFと等しくない";
};

subtest 'フランとドルの等価性のテスト' => sub {
    ok !Franc->new(5)->equals(Dollar->new(5)), '5CHFと5$は等しくない';
};

done_testing;
