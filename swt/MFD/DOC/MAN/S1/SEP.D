[cc]mc |
.hd sep "separate compilation facility for Ratfor programs" 08/27/84
[cc]mc
sep <prog> ( <module> { <module> }
           | -all | -cat | -stacc | -xref | -names | -link
           | -mklink     | -print [ <spool options> ]
           )
.ds
'Sep' is a shell program that assists in maintaining large Ratfor
programs with modules stored in separate files.
'Sep' insists on a number of file naming conventions  so that it
can locate all the files for a given program.
First, all files must be stored in the same directory, and that
directory must be the current directory when 'sep' is invoked.
The program name <prog> is part of each source file name and is
the name of the executable file produced.
A module name <module> is an arbitrarily selected name for a
group of routines contained in the same file.  A module is the
smallest unit that can be compiled separately.  There may be an
arbitrary number of modules.
.sp
'Sep' requires a number of files to be able to successfully compile
a program.  All definitions global to the program must be placed
in the file "<prog>_def.i";  they are included each time a
module is preprocessed.  Even if there are no definitions for a
particular program, this file must be present.
A linkage statement naming all subroutine,
function, and common block names must be present in the file
"<prog>_link.i". (If you choose, 'sep' will build the
file containing the linkage statement for you; see the "-mklink"
option.)
Finally, the main program (and other routines,
if desired) must be present in a file named "<prog>.r".
.sp
There are a number of other files that can be present and
will be used by 'sep' in compiling a program.  Files containing
groups of subprograms should be named "<prog>_<module>.r".  Files
of this type define the separately compiled "modules".   A
Stacc parser may be present in the file "<prog>.stacc";  it is
converted to the Ratfor module "<prog>_stacc.r" on command.
The definitions generated from the Stacc code are placed
in the file "<prog>_def.stacc.i"; there must be an include
statement for this file in "<prog>_def.i".
If the program has an include file for common blocks, it must
be named "<prog>_com.i" or "<prog>_com.r.i", but 'sep' does not
automatically include it during compilation.
.sp
Other files that may be present are "<prog>.ldproc" which
should contain an 'ld' command for linking the binary files;
if this file is not present, 'sep' links all the binary files
in the directory with names beginning with "<prog>".
The file "<prog>.rpopts" may also be present; it contains command line options
such as "-t" to be added to all calls to 'rp'.
The file "<prog>.fcopts" contains command line options
to be presented to 'fc'.
If the file "<prog>.ldopts" is present and
'sep' generates the 'ld' statement itself, the contents of
this file are added to the end of the 'ld' command line.
Usually this file contains the string "-t -m" so that a load
map is produced.
.sp
'Sep' performs a number of different operations, depending
on the arguments given to it.
.in +5

.ti -5
sep <prog> <module> { <module> }
.br
Each named module are preprocessed and compiled.
The main program can be named with an argument containing the
null string (i.e. "").
All the program's binary modules are then linked together.

.ti -5
sep <prog> -all
.br
If a Stacc parser is present, it is converted to Ratfor.
All the program's Ratfor modules are preprocessed and compiled,
and then all the program's binary modules are linked together.

.ti -5
sep <prog> -stacc
.br
The Stacc parser is converted to Ratfor.

.ti -5
sep <prog> -link
.br
All the program's binary modules are linked together.  If a
file named "<prog>.ldproc" exists, it is used to perform the
linking.  Otherwise, all binary files in the directory with names
beginning with "<prog>" are linked together.  The text in the
file "<prog>.ldopts", if present, is placed at the end of the
generated 'ld' command.

.ti -5
sep <prog> -mklink
.br
Call 'link' to
build a Ratfor linkage statement for the program
in the file "<prog>_link.i"

.ti -5
sep <prog> -cat
.br
All the source code files area printed on standard output.  No
file is printed more than once.

.ti -5
sep <prog> -print [ <spool options> ]
.br
All the source code files for the program
are printed on the line printer
using 'pr'.
No file is included more than once.
<Spool options> are used to determine the disposition of the
output; they are any options acceptable to 'pr'.

.ti -5
sep <prog> -names
.br
The names of all source code files are printed on standard output.
No file name is printed more than once.

.ti -5
sep <prog> -xref
.br
All Ratfor source modules is run through 'xref'.  The listing
from 'xref' appears on standard output.

.in -5
.es
sep rp -stacc
sep rp bool init other stacc
sep xref -all
sep fmt "" fill
sep nfmt -print
.fl
.in +5
.ti -5
"<prog>.r" for file containing main program.
.ti -5
"<prog>_def.i" for file containing global definitions.
.ti -5
"<prog>_link.i" for file containing the "linkage" statement.
.ti -5
"<prog>_<module>.r" for file containing the Ratfor source
code for the module named <module>.
.ti -5
"<prog>.ldopts" for file containing program's link options
(optional).
.ti -5
"<prog>.rpopts" for file containing program's Ratfor options
(optional).
.ti -5
"<prog>.fcopts" for file containing program's Fortran options
(optional).
.in -5
.me
.in +5
.ti -5
"Usage: sep <prog> <options>" for missing program or options.
.in -5
.bu
Currently undergoing development.  The user interface will
probably be changed in the future.

Cannot handle more than about 50 modules in a program.

When presented with errors, it displays the lack of
robustness of a typical shell file.
.sa
[cc]mc |
fc (1), stacc (1), ld (1), link (1), pr (1), xref (1), bind (3)
[cc]mc
