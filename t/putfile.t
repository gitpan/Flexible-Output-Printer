#!/usr/bin/env perl
use strict;
use warnings;
#use Test::More tests => 2;
use Test::Most tests => 2;

use_ok("Flexible::Output::Printer");

ok(Flexible::Output::Printer::putfile("MANIFEST"));

