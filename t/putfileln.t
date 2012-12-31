#!/usr/bin/env perl
use warnings;
# t/putfileln.t
# 12/27/12 - 04:17:38 am
#use Test::More tests => 2;
use Test::Most tests => 2;

use_ok("Flexible::Output::Printer");

ok(Flexible::Output::Printer::putfileln("Makefile.PL", "4"));

