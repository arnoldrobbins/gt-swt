[cc]mc |
.hd compile "compile and load mixed language programs" 10/10/84
compile {<input_files>} [-c] [-m <language>] [-C<'cc' options>]
        [-R<'rp' options>] [-F<'fc' options>] [-S<'pmac' options>]
        [-P<'pc' options>] [{-l <library>}] [-o <output_file>]
.ds
'Compile' is a general purpose interlude for calling the various
compilers available.  The choice of compiler is determined
by the suffix of the file name.
.sp
'Compile' compiles and loads the pathnames specified.
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
-c\Compile only.  The various source files will be compiled,
but the loader will not be called.
.sp
.ti -5
-m\<language>
.br
Specify a "main" language.  If the "main" language requires
a special library and/or start-off routine, then 'compile' will
arrange to load it.
The <language> should be one of the suffix letters listed below.
By default, no special libraries (besides the regular "vswtlb")
will be loaded.
.sp
.ti -5
-l\<library>
.br
Load <library>.
.sp
.ti -5
-o\<output file>
.br
Place executable file in <output file>.
.in -10
.sp
'Compile' recognizes the following file naming conventions and will
utilize the appropriate preprocessor and/or compiler:
.sp
.in +5
.nf
.c -- C source file
.s -- Pma source file
.r -- Ratfor source file
.f -- Fortran 66 source file
.p -- Pascal source file
.fi
.in -5
.sp
Therefore, if  your current directory contains
the files "f1.s", "f2.c", "f3.r", "f4.f", and "f5.p" and you execute
the command "compile f1.s f2.c f3.r f4.f f5.p", 'compile' will call the
appropriate language processors for each file and load the
resulting binary versions
together.
Note that even though there are both C and Pascal files listed,
their special libraries would [ul not] be loaded.
.sp
Every path name that you specify [ul must] include its associated
suffix.  Otherwise, 'compile' will decide that it is not a file,
but an argument to pass on to the loader.
.sp
The following options will be used by the indicated compiler
when it processes those pathnames having the corresponding name
extensions.
Options to be passed on to the compilers should be enclosed in
quotes, so that they will stay grouped together.  For instance:
.sp
.in +10
compile -m c junk.c -C'-a -Dindex=strchr' stuff.r -R'-a -g' -o junk
.in -10
.sp
Otherwise, the shell will split them up, and most of the options
will go to the loader, and do something unexpected, instead of
to the intended compiler.
.in +10
.ti -5
.sp
-C\<'cc' options>
.br
Use the 'cc' options specified when compiling
C modules.
.ti -5
.sp
-R\<'rp' options>
.br
Use the 'rp' options specified when preprocessing
any Ratfor modules.
.sp
.ti -5
-F\<'fc' options>
.br
Use the 'fc' options specified when compiling
Fortran modules.
These options will affect Ratfor programs as well.
.sp
.ti -5
-S\<'pmac' options>
.br
Use the 'pmac' options specified when assembling
PMA modules.
These options will [ul not]
affect C programs, since the C compiler no longer
uses PMA to compile its programs.
.sp
.ti -5
-P\<'pc' options>
.br
Use the 'pc' options specified when compiling Pascal modules.
.in -10
.sp
The options should not occur more than once; if they do,
the last one will be used.
Unrecognized options will be passed on to the loader.
.me
"Usage: compile ..." for an invalid option to the '-m' flag,
if no arguments are given, or no files are listed (only
options).
.es
compile -m c sort.c stuff.p
compile prog1.r prog2.p low_level.s -l vswtmath -o prog
.bu
Does no sanity checking on the arguments passed to the
individual compilers, nor on what is passed on to the loader.
.sp
Cannot
.# currently
be used to call 'bind'.
.sp
.bf 100
This program is only available to licensees of Version 2.0
of the Georgia Tech C Compiler.
.bf 0
.sa
cc (1), rp (1), fc (1), pc (1), pmac (1), ld (1), ucc (1), bind (3),
.ul
User's Guide for the Georgia Tech C Compiler
[cc]mc
