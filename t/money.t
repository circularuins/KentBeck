use strict;
use warnings;
use utf8;
use Test::More;

use_ok 'Dollar';

subtest '乗法のテスト' => sub {
    my $five = Dollar->new(5);
    my $product = $five->times(2);
    is $product->get_amount(), 10, "合計は10";
    $product = $five->times(3);
    is $product->get_amount(), 15, "合計は15";
};

done_testing;
