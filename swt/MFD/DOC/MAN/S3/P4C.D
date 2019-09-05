.hd p4c "Pascal 4 Compiler" 07/07/82
p4c
.ds
'P4c' is the third release of the Georgia Tech Pascal compiler
for the Prime 400.  The present version takes Pascal source
code from its first standard input and produces a listing on its
first standard output, and an equivalent Fortran program on its
second standard output.
.sp
The Pascal language is fully described in
[ul Pascal Users Manual and Report] , Second Edition, by
.sb
K. Jensen and N. Wirth,
.xb
Springer-Verlag, 1976.  Most error diagnostic numbers produced by
the compiler conform to those listed in the book.  The remainder
of this description covers the important differences between
the language described in the Report and the one implemented at
Georgia Tech.
.sp 2
.in +5
.ti -5
.bf
Options
.sp
The behavior of the Pascal compiler is controlled through the use of
special comments of the form:
.sp
     (*$<option sequence>   any comment *)
.sp
An option sequence consists of a series of option settings separated
by commas with no embedded blanks.  Available options include:
.sp
.ta 6
.tc \
.in +5
.ti -5
B+\Turn on code generation.  (Generated Fortran code is written
to standard output port two.)
.ti -5
B-\Turn off code generation.
.ti -5
L+\Turn on source listing.  (The listing is written to standard
output port one.)
.ti -5
L-\Turn off source listing.
.ti -5
P+\Include pointer validity checks in the generated code.
.ti -5
P-\Do not include pointer validity checks.
.ti -5
R2\Include full range and subscript checks  in the generated code.
.ti -5
R1\Include optimized range and subscript checks
(assume subrange variables contain valid values).
.ti -5
R0\Do not include any range or subscript checks.
.in -5
.sp 1
Default values for these options are equivalent to an occurence of
"(*$B+,L+,P+,R1*)" at the beginning of a program.
.sp
Any number of option setting comments may appear in a program.
Note, however, that turning off code generation for any portion
of a program may render the generated code generally unreliable.
.sp 2
.ti -5
.bf
Identifiers
.sp
The identifiers in a program may be of arbitrary length and
may include the underscore character ("_") and upper and
lower case letters (no distinction is made between upper and
lower case).  However, only the first eight characters of an
identifier are significant.
.sp 2
.ti -5
.bf
Keywords
.sp
Keywords are recognized in any mixture of upper and lower case.
.sp 2
.ti -5
.bf
Packing
.sp
The 'packed' attribute that may be applied to arrays and records
is not implemented, with the single exception of character strings.
A quoted character string has the type
.sp
      packed array [1..<length of string>] of char
.sp
This is the only type of character array that may appear
in an output procedure call (e.g. write, writeln).
.sp
In addition, the standard procedures 'pack' and 'unpack' are not
implemented and cause the compiler to issue a diagnostic.
.sp
The 'packed' keyword may be used freely without error in
the declaration of types and variables; however, it currently
has no effect except as described in the case of character arrays.
.sp 2
.ti -5
.bf
Files
.sp
The use of user defined files has been implemented.  Currently,
the only restriction is that fields within a record may not be
defined as files.  Remember that a Pascal file must be passed as an
argument in the program heading if it is to exist after the program
terminates execution.  This is especially important when using
pathnames, since a file must be permanent to be linked to a pathname.
.sp
The use of pathnames has been implemented by an extension of the
RESET and REWRITE procedures.  To use a pathname, a file of the correct
type must be defined within the program and this file must be an
parameter in the 'program' heading.  Therefore, the complete syntax
for RESET or REWRITE is :
.sp
        RESET(<filename>{,"<pathname>"});
.sp
Note that the pathname is enclosed within
.ul
double
quotes.  The pathname may be up to 100 characters in length and may
contain any ASCII character.  Two consecutive double quotes act as a
[cc]mc |
single double quote.  All references to the pathname (in read, write,
[cc]mc
etc) are made through <filename>.
.sp
There are also four predefined text
files, two for input and two for output, that the programmer has
access to.  For input, the files 'input' and 'keyboard' are available
and correspond to Subsystem standard input ports one and two,
respectively.  For output, the files 'output' and 'prr' are available
and correspond to Subsystem standard output ports one and two,
respectively.
.sp
Newly added is the predefined file 'keyboard' (in the place of prd).  This
file is used for reading from the terminal.  (note that the name 'keyboard'
was taken from the UCSD PASCAL compiler).  This file differs from
standard Pascal files in that it does not incorporate a lookahead
buffer.  Since input does incorporate a lookahead buffer, the program will
expect a character before it will start to execute if 'input' is used.
To make these files accessable within a program, it is only necessary
to include their names as formal parameters in the 'program'
declaration.  For example
.sp
     program test (input, output, keyboard, prr)
.sp
would make all four files available within the program.
.sp 2
The standard procedure PAGE has been implemented.  This procedure prints
a form feed in the specified file (as opposed to a '1' is column 1 as
described in the standard).  This allows the user to insert form feeds
as needed in a file of type TEXT (file of char).  If the file specified
as an argument is not of type TEXT, an error will be issued.
.sp 2
Remember:  There are essentially two types of files in PASCAL;
local files, those that are local to the program or a particular
procedure or function, and external files, which are files that
exist before and/or after the program is executed.  In order that
a file be external, it must be passed as a parameter to the
'program' in the program heading.  If pathnames are used, the file
that the pathname is linked to must also be in the 'program' heading
(NOT the pathname itself!).
.sp 2
.ti -5
.bf
The Heap
.sp
Two standard procedures, 'mark' and 'release' are provided
for rudimentary management of the heap.  Each takes a single
parameter whose type must be of the form
.sp
     ^<any type>
.sp
'Mark' copies the current value of the heap pointer into the
argument; 'release' does the opposite: it copies the contents
of the argument into the heap pointer.  This scheme is only
effective in an environment where storage is allocated and
released in a (more or less) last-in-first-out manner (which
is exactly the situation in a recursive descent compiler).
.sp 2
.ti -5
.bf
Procedures/Functions as Parameters
.sp
Neither procedures nor functions may be passed as parameters
to other procedures or functions.
.sp 2
.ti -5
.bf
Non-local Gotos
.sp
'Goto' statements whose target label is not within the scope of the
current procedure are not supported.
.sp 2
.ti -5
.bf
Procedures Time and Date
.sp
Two new (non-standard) procedures have been implemented.  These
are the procedures time and date.  Both procedures take a
single argument which must be an (unpacked) array of 8 characters.
The variable into which the corresponding value is to be
returned must not be subscripted in the procedure call.  An example is:
.sp
        Time (thetime);
.sp
  where the variable thetime is defined as:
.br
        thetime: array [1..8] of char;
.sp
returns the current time in variable thetime.
Procedure DATE works the same way.  The time returned is in HH:MM:SS
24-hour format and the date is in MM/DD/YY format.
.sp 2
.ti -5
.bf
Execution of Pascal Programs
.sp
The full journey from Pascal source code to executable program
involves three stages: compilation by 'p4c', a trek through the
Fortran compiler, and linking/loading by 'ld'. The following
sequence of commands illustrates a possible scenario:
.sp
     copy.p> p4c >copy.l >copy.f
     fc copy.f
     ld copy.b -l p4clib -o copy
.sp
Special notice should be taken of the "-l p4clib" argument
sequence in the 'ld' command;  it is mandatory for the
completion of linking.
.sp
This procedure may be abbreviated to a single command through
the use of the 'p4cl' command.  Detailed information on its usage
is available from 'help'.
.in -5
.es
prog.p> p4c >prog.l >prog.f
xref.p> p4c 2>xref.f | sp -f
.me
Numbered error diagnostics for syntactic or semantic errors.
Messages corresponding to the numbers are given in the User's
Manual.
.bu
Produces code that is too huge and too slow to be considered
useful by anybody.
.sp
Locally supported.
.sa
p4cl (3),
.ul
Pascal User's Manual and Report
