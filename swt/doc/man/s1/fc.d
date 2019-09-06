[cc]mc |
.hd fc "interface to Primos Fortran compiler" 08/27/84
[cc]mc
fc {-<option>[<level>]} <input file>
         [-b [<binary file>]]
         [-l [<listing file>]]
         [-z <FTN option>]
   <option> ::= d | e | f | h | i | k | m | o | p | q |
                r | s | t | u | v | w | x
.ds
'Fc' serves as the Subsystem interface to the Primos Fortran 66 compiler
(FTN).
It examines its option specifications and checks them for consistency,
provides Subsystem-compatible default file names for the listing
and binary files as needed, and then produces a
Primos FTN command and causes it to be executed.
.sp
.bf
Options
.sp
The general structure of an 'fc' option is a single letter, possibly
followed by a "level number" indicating the extent to which an option
should be employed.
The following list outlines the options and the meanings of their
various levels.
The first line of each description contains the option letter
followed by its default level enclosed in parentheses,
the range of available levels enclosed in square brackets, and a
brief description of the option's purpose.
In all cases, when an option is specified without a level number,
the maximum allowable value is assumed.
.sp
.in +5
.de op <letter> <lwb> <upb> <default> <purpose>
.sp
.ne 5
.nf
.ti -5
-[1]([4]) @@@[[2]..[3]] - [5].
.fi
.en op
.op d 0 2 0 "Debugging control"
.sp
Level 0 prevents all debugging information from being included
in the generated code.  A program so compiled may not be used with
the source level debugger.
.sp
Level 1 allows limited debugging information to be included in
the generated code, but does not interfere with optimization.
.sp
Level 2 causes complete debugging information to be included in
the generated code and inhibits optimization.
(Cannot be used when the "-o" option is specified with a level greater
than zero.)
.op e 0 1 1 "Error listing on terminal"
.sp
Level 0 inhibits the printing of compilation errors on the user's
terminal.
.sp
Level 1 causes compilation errors to be printed on the terminal.
.op f 0 1 1 "Floating point instruction restriction"
.sp
Level 0 causes the compiler to avoid generating certain
types of floating point instructions that are not available
on all Prime machines.
This level is allowed only when the "-m" option is at levels
0 or 1.
.sp
Level 1 allows the compiler to use the entire floating point
instruction set.
.op h 0 1 0 "Huge (multi-segment) arrays"
.sp
Level 0 insures that dummy arrays and array parameters will not
be treated as multi-segment arrays.
.sp
Level 1 causes references to dummy arrays and array parameters to
generate code that will work even if the arrays are larger than
one segment (64K words) in length.
This option is allowed only when the "-m" option is at level 2.
.op i 0 1 0 "Integer precision"
.sp
Level 0 causes objects declared to be of type "integer" to be
assigned to 16 bit storage locations.
.sp
Level 1 causes objects declared to be of type "integer" and all integer
constants to be assigned to 32 bit storage locations.
This is occasionally useful in transporting Fortran code written
on or for other systems.
Beware of interactions with Primos and Subsystem support routines
which normally require 16-bit parameters.
.op k 0 1 0 "Compilation statistics"
.sp
Level 0 inhibits the display of compilation statistics on the terminal.
.sp
Level 1 causes the display of compilation statistics on the terminal.
.op m 0 2 2 "Addressing mode"
.sp
Level 0 implies 32R addressing mode.
Large arrays ("-h1"), dynamic storage allocation ("-s1"),
and debugging ("-d1" or "-d2") may not be used in this mode.
.sp
Level 1 implies 64R addressing mode.
Large arrays ("-h1"), dynamic storage allocation ("-s1"),
and debugging ("-d1" or "-d2") may not be used in this mode.
.sp
Level 2 implies 64V addressing mode.
At present this is the only addressing mode fully supported under the
Subsystem.
.op o 0 2 1 "Optimization control"
.sp
Level 0 turns off all optimizations.
.sp
Level 1 turns on "safe" optimizations (strength reduction and removal
of invariants in DO-loops).
This option cannot be used with full debugging ("-d2").
.sp
Level 2 turns on "unsafe" optimizations (same as level 1, but applied
even to loops that may make use of the Fortran extended-range feature).
This option cannot be used with full debugging ("-d2").
Note:  Ratfor generates GOTO instructions to implement its internal
procedures.  If a Ratfor internal procedure is called from within
a DO loop, this option [ul cannot] be used for the program.
.op p 0 1 0 "Entry control block allocation"
.sp
Level 0 disallows mixing of procedures and entry control blocks.
.sp
Level 1 allows mixing of procedures and entry control blocks.
Selection of this option is valid only when the "-m" option is
at level 2.
.op q 0 1 0 "Quirk control"
.sp
Level 0 disallows the use of certain statements and declarations
designed for use by systems programmers.
.sp
Level 1 allows the use of these statements and declarations.
A side effect of selecting this level is that the compiler
flags undeclared variables, regardless of the level of the
"-u" option.
.op r 0 1 0 "Instruction reach control"
.sp
Level 0 causes the compiler to generate short instructions
for all variable references.
.sp
Level 1 causes the compiler to generate long-reach instructions
for all variable references.
This option is valid only when the "-m" option is at level
0 or 1.
.op s 0 1 1 "Storage allocation control"
.sp
Level 0 requires that all subprogram variables be allocated
statically (the usual case for implementations of Fortran,
although not required by the standard).
.sp
Level 1 requires that all subprogram variables not named in
SAVE declarations or DATA statements be allocated dynamically on
the run-time stack.
This permits recursion and more efficient use of memory, and is
the normal mode of usage under the Subsystem.
Dynamic allocation cannot be used unless the addressing mode is
64V (-m2).
.op t 0 1 0 "Run-time trace control"
.sp
Level 0 causes no run-time trace code to be emitted.
.sp
Level 1 causes the compiler to emit trace code that prints
statement numbers when they are encountered and records assignments
to variables.
Warning:  this option can produce reams of output!
.op u 0 1 1 "Undeclared variable checking"
.sp
Level 0 prevents the compiler from flagging undeclared variables
as errors.
.sp
Level 1 causes the compiler to report undeclared variables as
errors.
This enforces (one hopes) better programming practices and reduces
the number of hard-to-find semantic errors in programs.
.op v 0 2 1 "Listing verbosity"
.sp
Level 0 prevents the listing of source code, but allows the listing
of error messages and statements that caused them.
.sp
Level 1 generates a full source code listing.
.sp
Level 2 generates a full source code listing plus a representation
of the machine code generated for each statement.
.op w 0 1 0 "Generate floating round instructions"
.sp
Level 0 does not generate floating round (FRN) instructions.
.sp
Level 1 cause a floating round (FRN) instruction to be
generated before every floating store (FST) instruction in the
code produced by the FTN compiler.  This option
improves the accuracy of single precision floating point calculations
at some slight run-time performance expense.
.op x 0 2 1 "Cross-reference listing control"
.sp
Level 0 inhibits the generation of a cross-reference.
.sp
Level 1 causes the compiler to generate a cross-reference
listing containing all variables referenced in executable
statements and omitting those that are declared but never referenced.
.sp
Level 2 causes the compiler to generate a full cross-reference
of all variables.
.in -5
.sp
In addition to the options above, the "-z" option allows the
explicit passing of a string verbatim into the command line.
.sp
.bf
File Control
.sp
The "-b" option is used to select the name of the file to receive the
binary object code output of the compiler.
If a file name follows the option, then that file receives the object
code.
(Note that if "/dev/null" is specified as the file name, no object code
will be produced.)
If the option is not specified, or no file name follows it, a default
filename is constructed from the input filename by changing its suffix
to ".b".
For example, if the input filename is "prog.f", the binary file will be
"prog.b";
if the input filename is "foo", the binary file will be "foo.b".
.sp
The "-l" option is used to select the name of the file to receive the
listing generated by the compiler.
If a file name follows the option, then that file receives the listing.
The file name "/dev/null" may be used to inhibit the listing;
"/dev/tty" to cause it to appear on the user's terminal;
"/dev/lps" to cause it to be spooled to the line printer.
If the "-l" option is specified without a file name following it,
a default filename is constructed from the input filename by changing
its suffix to ".l".
For example, if the input filename is "gonzo.f", the listing file will
be "gonzo.l";
if the input filename is "bar", the listing file will be "bar.l".
If the "-l" option is not used, no listing is produced.
.sp
The input filename may be either a disk file name (conventionally
ending in ".f",  ".ftn", or ".df")
or the device "/dev/tty", in which case input to the
compiler is read from the user's terminal.
.sp
In summary, then, the default command line for compiling a file named
"file.f" is
.sp
.nf
     fc -d0e1f1h0i0k0m2o1p0q0r0s1t0u1v1w0x1 _
          file.f  -b file.b  -l /dev/null
.sp
which corresponds to the FTN command
.sp
     ftn -i *>file.f -b *>file.b -l no -64v -dcl -dynm -opt
.sp
.fi
.es
fc file.f
fc -i -u0 dmach.f
fc -x dmach.f -b b_dmach -l l_dmach
fc -m1 r_mode_prog.f -z"-debase -nofp"
.me
.in +5
.ti -5
"Usage: fc ..." for invalid option syntax.
.ti -5
"level numbers for -<option> are <lower[bl]bound> to <upper[bl]bound>" if
an out-of-range level number is specified.
.ti -5
"missing input file name" if no input filename could be found.
.ti -5
"<name>: unreasonable input file name" if an attempt was made to read
from the null device or the line printer spooler.
.ti -5
"<name>: unreasonable binary file name" if an attempt was made to
produce object code on the terminal or line printer spooler.
.ti -5
"inconsistency in internal tables" if the tables used to process
the options are incorrectly constructed.  This message indicates
a serious error in the operation of 'fc' that should be reported
to your system administrator.
.in -5
.sp
Numerous other self-explanatory messages may be generated to diagnose
conflicts between selected options.
.bu
'Fc' pays no attention to standard ports.
.sa
[cc]mc |
fcl (1), ld (1), rfl (1), init$f (2), bind (3)
[cc]mc
