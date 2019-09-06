.hd bnames "print entry point names in object files" "01/03/83"
bnames {<object file>}
.ds
'Bnames' is a program which will open each of the files, if any,
named as its arguments and print the names of the routines
encountered on standard output.  This program is useful for
examining library files to see if the correct subroutines have
been included.
.sp
The following are the possible types of output[bl]:
.sp
.in +5
.nf
.ul
type              meaning
<name>            name of a subprogram entry point
.main             main program entry point
.data             Fortran block data module
.rfl              a reset "force load" loader group
.sfl              a set "force load" loader group
.fi
.in -5
.es
bnames ave.b ave_lib.b
bnames [files .b$] | find "%." -x >routine_names
.me
.in +5
.ne 2
.ti -5
"<name>:[bl]bad object file..." for an ill-formatted object code
file.
.ne 2
.ti -5
"block size (<integer>) exceeds buffer space" for files whose
block size exceeds the program input buffer size.
.ne 2
.ti -5
"<name>:[bl]extraneous END block" for superfluous END blocks in
the object code file.
.in -5
.bu
If a module has multiple entry points, only the first one is recognized.
.sa
bmerge (5), brefs (5), ld (1), lorder (1)
