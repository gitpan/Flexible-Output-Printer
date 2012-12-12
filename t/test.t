#!/usr/bin/env perl
use warnings;
use Test::More tests => 1;
BEGIN { use_ok('Printer') };

Flexible::Output::Printer::putc('h');

Flexible::Output::Printer::puts('Hello', ' World!');


 
