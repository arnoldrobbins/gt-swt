.hd brefs "print caller-callee pairs in an object file" 01/03/83
brefs { <object file> | -n }
.ds
'Brefs' prints the precedence relationships between the entry points
that are defined and/or referenced within the named object files.
Each output line contains two entry point names; the first is the
name of the calling routine ($MAIN for Fortran main programs or
unnamed assembly language routines), and the second is the name of
an external object referenced by that routine.
The output from 'brefs' is suitable for piping into 'tsort' to
determine the proper ordering for routines in a library.
.sp
If the "-n" argument appears in the place of an object file name,
'brefs' will obtain names of object files from its standard input.
For more information on this syntax, see the entry for 'cat' (1).
.es
brefs ave.b ave_lib.b
brefs lib.b | tsort | bmerge lib.b >lib
.me
.in +5
.ti -5
"<object file>: can't open" if a non-existent or inaccessible
file is specified.
.ti -5
"<object file>: bad object file" if something other than an
object file is specified.
.ti -5
"block size exceeds buffer space" if the object file is badly
formatted.
.in -5
.bu
If a module has multiple entry points, only the last entry point
is recognized.
.sa
bmerge (5), bnames (5), ld (1), lorder (1), tsort (1)
