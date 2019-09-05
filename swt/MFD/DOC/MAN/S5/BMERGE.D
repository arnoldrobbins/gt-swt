.hd bmerge "merge object code files into one file" 01/03/83
bmerge {<object file>}
.ds
'Bmerge' is a program which will take the object code files given
as arguments, if any, and create a new object code file that is
written to standard output.  If you build your programs as
separately compiled modules, with each module containing many
subroutines/functions, you can use 'bmerge' to combine those modules
into one object code file for building a library.
.sp
'Bmerge' accepts directives from standard input to indicate the
order and type of subprograms to be included in the resulting
object code file; by default, no subprograms will be included
if there is no input.
.sp
The following may be included in the input stream to direct
the creation of the object code file[bl]:
.sp
.in +5
.nf
.ul
input item         meaning
<name>             include the named subprogram at the
                   current point in the object code
.rfl               reset the "forced load" flag at this
                   point
.sfl               set the "forced load" flag at this
                   point
.fi
.in -5
.sp
A sample input stream would be[bl]:
.sp
.in +5
.nf
ave
.sfl
add
sub
mul
.rfl
div
.fi
.in -5
.sp
If the files specified in the argument list contain more than
one occurrence of an entry point name (i.e., possibly different
versions of the same subprogram), then the version which gets
included depends on the order in which the files were specified
in the command invocation.  Multiple occurrences of an entry point
name in the input to 'bmerge' causes inclusion of more than one
version of the named subprogram, with the inclusion order being
the reverse of the order of occurrence (last-in, first-out basis).
.es
entry_names> bmerge ave.b ave_lib.b >new_ave.b
files .b$ | change .b$ | bmerge [files .b$] >all_object.b
.me
.in +5
.ne 2
.ti -5
"<name>:[bl]too many object files" when trying to merge too many
object code files at the same time.
.ne 2
.ti -5
"<name>:[bl]not found in object files" when trying to include a
nonexistant routine.
.ti -5
"bad object file..." for an ill-formatted object code file.
.ne 3
.ti -5
"<name>:[bl]error copying object module" if the length of the
routine in the resulting object code file is not of the same
length as in the source file.
.ne 3
.ti -5
"block size (<size>) exceeds buffer space" if the next block to
be read from the input object code file is larger than the program's
file buffer.
.ne 2
.ti -5
"<name>:[bl]extraneous END block" for object code files which
have too many END blocks.
.sp
.ti -5
various error messages from the dynamic storage routines
.in -5
.bu
Binary output is used to generate the resulting object code file.  If
standard output is the terminal, unpredictable results may be
obtained because of the irrational behavior of binary I/O to the
terminal.
.sp
Internal procedures (procedures/functions within procedures/functions)
in PL/1, Pascal, or PL/P modules if specified by name,
will not be merged correctly.
.sp
If a module has multiple entry points, only the first one is recognized.
.sa
bnames (5), brefs (5), ld (1), lorder (1)
