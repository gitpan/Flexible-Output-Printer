#!/usr/bin/env perl
use warnings;
use Test::More tests => 1;
BEGIN { use_ok('Printer') };

Ez::Printer::putc('h');

Ez::Printer::puts('Hello', ' World!');


 
