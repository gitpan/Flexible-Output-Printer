#!/usr/bin/env perl
=begin LICENSE
+--------------------------------------------------------------------------------------+
| BSD-3 OSI License                                                                    |
+--------------------------------------------------------------------------------------+
| Copyright (c) 2012, Alexej G. Magura                                                 |
| All rights reserved.                                                                 |
|                                                                                      |
| Redistribution and use in source and binary forms, with or without                   |
| modification, `are permitted provided that the following conditions are met:         |
|                                                                                      |
| Redistributions of source code must retain the above copyright notice, this          |
| list of conditions and the following disclaimer.                                     |
|                                                                                      |
| Redistributions in binary form must reproduce the above copyright notice,            |
| this list of conditions and the following disclaimer in the documentation            |
| and/or other materials provided with the distribution.                               |
|                                                                                      |
| Neither the name of the owner nor the names of its contributors may                  |
| be used to endorse or promote products derived from this software without            |
| specific prior written permission.                                                   |
|                                                                                      |
| THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"          |
| AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE            |
| IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE           |
| ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE            |
| LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR                  |
| CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF                 |
| SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS             |
| INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN              |
| CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)              |
| ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE           |
| POSSIBILITY OF SUCH DAMAGE.                                                          |
+--------------------------------------------------------------------------------------+
=end LICENSE  
=cut

package Flexible::Output::Printer;
use strict;
use warnings;

use Exporter;
use vars qw(@ISA @EXPORT);

our $VERSION = '0.4.4';
@ISA = qw(Exporter);
@EXPORT = qw(puts putc);


sub puts
{
    while ( @_ )
    {
	print "$_[0]";
	shift @_;
    }
    return bless {};
}

sub putc
{
    if ( @_ )
    {
       chomp( my $size = length($_[0]));
       if ( $size == 1 ) 
       {
	   print $_[0];
       }
       else
       {
	   return;
       }
   }
   return bless {};
}

sub println
{
    if ( $_[0] )
    {
	printf "@_\n";
    }
    return bless {};
}

sub echo
{
    if ( $_[0] )
    {
	if ( $_[0] eq '-n' )
	{
	    print "@_";
	}
	else
	{
	    print "@_\n";
	}


    }
    return bless {};
}






=head1 NAME

Flexible::Output::Printer - print output in whatever way feels most natural to you.  

=head1 SYNOPSIS 

    use Flexible::Output::Printer;

    putc('char'); # print a single character.  
    
    puts('string'); # print (a) string(s).

    echo('-n', "Hello, World!"); # echo is just like the echo in Bash, or at least, that's my goal.
    
    println("stuff"); # print 'stuff' followed by a newline--also works with escape sequences like '\e[1;31m' for the color red.  

=head1 REQUIRES

Perl5, Exporter

=head1 EXPORTS

not sure yet... 

=head1 DESCRIPTION

Flexible::Output::Printer permits users to print output in a way that is remiscent of other programming languages like Unix Shell, Ruby, and/or Lua.  

=head1 METHODS

=head1 AUTHOR

Alexej G. Magura

=cut
