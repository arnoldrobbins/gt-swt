[cc]mc |
.hd link "build Ratfor linkage declaration" 08/27/84
[cc]mc
link [-{f | m}] {-n<filename> | <filename>}
.ds
'Link' creates a [bf linkage] statement for the files specified as
arguments in the command line.
An identifier needs to be in a [bf linkage] statement if it is longer
than six characters and it meets one of the following conditions:
.sp
      1) The identifier is in an external statement.
      2) The identifier is the name of a named common block.
      3) The identifier is a  subroutine name.
      4) The identifier is a function name.
.sp
The [bf linkage] statement produced by 'link' includes all identifiers
which are of one of the four types above, regardless of the number
of characters in the identifier.  Because of this, 'link' creates
a list of all external symbols for the modules of a given program
as well as a [bf linkage] statement.
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.sp
.ti -5
f\Suppress automatic inclusion of standard definitions file.
Macro definitions for the manifest constants used throughout
the Subsystem reside in the file "=incl=/swt_def.r.i".
'Rp' will process these definitions automatically, unless the
"-f" option is specified.
.sp
.ti -5
m\Map all identifiers to lower case.
When this option is selected, 'link' considers the upper case letters
equivalent to the corresponding lower case letters,
except inside quoted strings.
.sp
.ti -5
n\Read file names from an input file until EOF is reached.
'link' observes the convention that a "-n" argument implies that
file names are to be read from an input file until EOF is reached,
rather than simply from the argument list.
"-n" implies the standard port STDIN, "-n2" implies STDIN2,
"-n3" implies STDIN3, and "-nfilename" implies the named file.
.in -10
.sp
The remainder of the command line is used to specify filenames
which are part of the program for which the [bf linkage] statement is
being created.
.es
link -nrpfiles
link xref.r xref.sort xref.out
.fl
=temp=/tm?* for internal temporaries
.br
=incl=/swt_def.r.i for standard Subsystem macro definitions
.me
See the
.ul
[cc]mc |
User's Guide for the Ratfor Preprocessor
[cc]mc
for more information on linkage statements.
.sa
rp (1), sep (1), gfnarg (2)
