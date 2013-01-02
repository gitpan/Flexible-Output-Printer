#!/usr/bin/env perl
use warnings;
use Test::More tests => 3;

use_ok("Flexible::Output::Printer");

ok(lncount("Makefile.PL"));
is(lncount("Makefile.PL"), "20");

