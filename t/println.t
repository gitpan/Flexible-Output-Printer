#!/usr/bin/env perl
use strict;
use warnings;
#use Test::More tests => 5;
use Test::Most tests => 5;

use_ok('Flexible::Output::Printer');

my $number = 1+1+1+1;
ok(println(is($number, 4)));
TODO: {
    local $TODO = 'println(num+num) not yet implemented.';
    is(println($number+2+3+4+4), 18);
    is(println($number*2), 8);
}

