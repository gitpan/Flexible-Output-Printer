#/usr/bin/env perl
=begin LICENSE
+--------------------------------------------------------------------------------------+
| BSD-3 OSI License                                                                    |
+--------------------------------------------------------------------------------------+
| Copyright (c) 2012, Alexej G. Magura                                                 |
| All rights reserved.                                                                 |
|                                                                                      |
| Redistribution and use in source and binary forms, with or without                   |
| modification, are permitted provided that the following conditions are met:          |
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

our $VERSION = '0.68.2a'; 
# (major).(minor)(revision).(beta)b(alpha)a -- my version scheme 
@ISA = qw(Exporter);
@EXPORT = qw(puts putc println echo putfile putfileln printpp lncount );

# put a specified string onto the terminal -- putstring
sub puts
{
    while ( @_ )
    {
	print "$_[0]";
	shift @_;
    }
    return bless {}; # return self so that this module is Object Oriented.  
}
# put a line from a specified file -- putfileline
sub putfileln
{
    if ( $_[0] eq '-wl' || $_[0] eq '--with-line' )
    {
	shift @_;
    
	while ( @_ ) # maybe this should be an if statement instead, so that it will only be able to do one operation before exiting.  
	{ 
	    # as long as there are args, do the following: 
	    my $file = "$_[0]"; # set a local var to arg0, the name of the file desired.  
	    use Carp; # allows me to use croak--like die, but better for modules.  
	    open File0, "<", "$_[0]" or croak("Cannot locate or open file\n$!\n"); # open file for reading or croak.  
	    my @lines = <File0>; # set the lines array so that any line may be accessed, but not all lines all at once.  
	    printf "@lines[$_[1]]\n"; # print the line, with a newline
	    shift @_; shift @_; # shift args twice so that the new args can be received.  
	}
    }
    else
    {
	if ( @_ ) # maybe this should be an if statement instead, so that it will only be able to do one operation before exiting.  
	{ 
	    # as long as there are args, do the following: 
	    my $file = "$_[0]"; # set a local var to arg0, the name of the file desired.  
	    use Carp; # allows me to use croak--like die, but better for modules.  
	    open File0, "<", "$_[0]" or croak("Cannot locate or open file\n$!\n"); # open file for reading or croak.  
	    my @lines = <File0>; # set the lines array so that any line may be accessed, but not all lines all at once.  
	    printf "@lines[$_[1]]"; # print the line, w/o a newline 
#	    shift @_; shift @_; # shift the args so that the next file/line can be received.  
	}
    }
	
	close(File0) and return 1; # close file and return true. 

       return bless {};	
}
sub putfile
{
    if ( @_ )
    {
	my $file = "$_[0]";
	use Carp; # use carp, it is better than die for modules.  
	open File0, "<", "$_[0]" or croak("Cannot locate or open file\n$!\n"); # open file or croak--that is, die.  
	while ( <File0> )
	{
	    chomp; # get rid of the newline at the end of each line in File0--perhaps this is unnecessary since I am just readding the newlines anyway... I dunno, though.  
	    print "$_\n"; # and print the file contents adding a newline.
	}
	close(File0); # close the file
    }
      return bless {};
}

sub lncount
{
    my $aindex = 0;
    if ( @_ )
    {
	my $file = "$_[0]";
	use Carp; # use carp, it is better than die for modules.  
	open File0, "<", "$_[0]" or croak("Cannot locate or open file\n$!\n"); # open file or croak--that is, die.  
	while ( <File0> )
	{
	    $aindex += 1;
	}
	close(File0); # close the file
    }
#	print "$aindex\n";
#	print "$aindex\n"; 
	return $aindex; # return only.  
	return bless {};
}
    


sub putc
{
    if ( @_ ) # if there are args
    {
       chomp( my $size = length($_[0])); # get the length of the arg(s)
       if ( $size == 1 ) # if that length is no greater than 1
       {
	   print $_[0]; # print arg(s)
       }
       else # or if the length of args is greater than 1 
       {
	   return; # fail--return a non-zero exit status.
       }
   }
   return bless {};
}

# print without a newline -- print++ (print plus plus)
sub printpp
{
    if ( $_[0] )
    {
	printf "@_";
    }
}

# print with a newline -- printline
sub println
{
    if ( $_[0] )
    {
	printf "@_\n";
    }
    return bless {};
}
# same as bash's echo
sub echo 
{
    if ( @_ )
    {
	#print $_[0];
	if ( $_[0] eq '-n' ) # no newline, print args without newline.  
	{
	    shift @_;
	    print "@_";
	}
	elsif ( $_[0] eq '-e' )  # interpret escape sequences.  
	{
	    shift @_;
	    printf "@_\n";
	}
	elsif ( $_[0] eq '-E' ) # do not interpret escape sequences
	{
	    shift @_;
	    print "@_\n";
	}
	else # default.  
	{
	    print "@_\n";
	}

    }
    return bless {};
}

# find, if arg1 == arg2 return true.  
sub match
{
    if ( @_ )
    {
	if ( $_[0] =~ m/$_[1]/ )
	{
	    print "\nT\n\n";
	}
	else
	{
	    print "\nF\n\n";
	}
    }
    
}
=find 
# I want to start working on a new function which will open a specified file, search that file for a specified regex, and then return true and the line number if it finds it.  Based on MSDOS's file, which searches files for a given string.  
#
#
#
#
#
#
#
#
=end find
=cut 

1;
__END__

# Not sure why this isn't working.  
=pod 

=head1 NAME

Flexible::Output::Printer - print output in a natural way, plus more.    

=head1 SYNOPSIS 

    use Flexible::Output::Printer;

    putc('char'); # print a single character.  
    
    puts('string'); # print (a) string(s).

    echo('-n', "Hello, World!"); # echo is just like the echo in Bash, or at least, that's my goal.
    
    println("stuff"); # print 'stuff' followed by a newline--also works with escape sequences like '\e[1;31m' for the color red.  

=head1 DESCRIPTION

Flexible::Output::Printer permits users to print output in a way that is remiscent of other programming languages like Unix Shell, Ruby, and/or Lua.  

=head1 REQUIRES

Perl5, Exporter

=head1 EXPORTS

not sure yet... 

=head1 SEE ALSO

=head1 METHODS

=head1 AUTHOR

Alexej G. Magura

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2013, Alexej G. Magura
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    Neither the name of the owner nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=cut
