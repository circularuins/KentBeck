use strict;
use warnings;
use utf8;
use Test::More;

use_ok 'Dollar';

subtest '乗法のテスト' => sub {
    my $five = Dollar->new(5);
    ok Dollar->new(10)->equals($five->times(2)), "合計は10";
    ok Dollar->new(15)->equals($five->times(3)), "合計は15";
};

subtest '等価性のテスト'  => sub {
    ok Dollar->new(5)->equals(Dollar->new(5)), "＄5は＄5と等しい";
    ok !Dollar->new(5)->equals(Dollar->new(6)), "＄5は＄6と等しくない";
};

done_testing;
