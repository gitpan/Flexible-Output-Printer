use 5.016002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Flexible::Output::Printer',
    VERSION_FROM      => 'lib/Printer.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT       => 'Flexible::Output::Printer permits users to print output in a way that is remiscent of other programming languages such as UNIX Shell, Ruby, and Lua. (Working on adding support for more languages.)', # retrieve abstract from module
       AUTHOR         => 'Alexej G. Magura <agm2819@gmail.com>') : ()),
    LICENSE	      => 'BSD'
);
