#!/usr/bin/env perl
use warnings;

use Test::More test => 1;

BEGIN { use_ok('Printer') };
    
    Flexible::Output::Printer::println("\e[1;33mHello, World!\e[0m");
    
    Flexible::Output::Printer::echo("-n", "Hello, World!");

    Flexible::Output::Printer::putc('h');

    Flexible::Output::Printer::puts('Hello', ' World!');



