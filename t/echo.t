#!/usr/bin/env perl
use warnings;
#use Test::More tests => 3;
use Test::Most tests => 3;
BEGIN { use_ok('Flexible::Output::Printer') };

ok(Flexible::Output::Printer::echo('-n', "h", "\n"));

BEGIN { ok(Flexible::Output::Printer::echo('h')) };

