[cc]mc |
.hd f77c "interface to Primos Fortran 77 compiler" 08/27/84
[cc]mc
f77c {-<option>[<level>]} <input file>
         [-b [<binary file>]]
         [-l [<listing file>]]
         [-z <F77 option>]
   <option> ::= c | d | e | f | g | h | i | k | m |
                o | q | r | s | t | u | v | w | x
.ds
'F77c' serves as the Subsystem interface to
the Primos Fortran 77 compiler (F77).
It examines its option specifications and checks them for consistency,
provides Subsystem-compatible default file names for the listing
and binary files as needed, and then produces a
Primos F77 command and causes it to be executed.
.sp
.bf
Options
.sp
The general structure of an 'f77c' option is a single letter, possibly
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
.op c 0 1 0 Case mapping
.sp
Level 0 forces case to be insignificant in identifiers.  Upper
case identifiers are considered the same as lower case identifiers.
.sp
Level 1 cause case to significant in identifiers.  Upper case
identifiers are considered different from lower case identifiers.
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
This option cannot be used with full optimization (-o3).
.op e 0 1 1 "Error listing on terminal"
.sp
Level 0 inhibits the printing of compilation errors on the user's
terminal.
.sp
Level 1 causes compilation errors to be printed on the terminal.
.op f 0 1 0 "Offset map"
.sp
Level 0 inhibits the generation of a storage offset map.
.sp
Level 1 cause the generation of a map listing the storage offset
of each program variable.
.op g 0 1 0 "Logical precision"
.sp
Level 0 causes the compiler to allocate 16 bits (1 word) for
each logical variable or constant.
.sp
Level 1 causes the compiler to allocate 32 bits (2 words) for
each logical variable or constant.
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
Level 0 causes the compiler to assign 16 bits (1 word) to each
integer variable or constant.
.sp
Level 1 causes the compiler to assign 32 bits (2 words) to each
integer variable or constant.
.op k 0 1 0 "Compilation statistics"
.sp
Level 0 inhibits the display of compilation statistics on the terminal.
.sp
Level 1 causes the display of compilation statistics on the terminal.
.op m 2 3 2 "Addressing mode"
.sp
Level 2 implies 64V addressing mode.
At present this is the only addressing mode fully supported under the
Subsystem.
.sp
Level 3 implies 32I addressing mode.
Code in this addressing mode will not execute on a Prime 400.
.op o 0 3 2 "Optimization control"
.sp
Level 0 turns off all optimizations.
.sp
Level 1 turns on pattern replacement optimizations.
.sp
Level 2 turns on pattern replacement and strength reduction optimizations.
.sp
Level 3 turns on all optimizations (pattern replacement, strength
reduction, and removal of invariants in DO-loops).
This option cannot be used with full debugging (-d2).
.op q 0 1 1 "Suppress warning messages"
.sp
Level 0 inhibits the display of compiler warning messages.
.sp
Level 1 allows the display of compiler warning messages.
.op r 0 1 0 "Range checking"
.sp
Level 0 inhibits run-time checking of subscripts and substrings.
.sp
Level 1 causes the compiler to insert code for the run-time
checking of subscripts and substrings.
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
.op t 0 1 0 "DO-loop trip control"
.sp
Level 0 causes all DO loops to be of the zero or more iteration
(Fortran 77 standard) type.
.sp
Level 1 causes all DO loops to be of the one or more iteration
(Fortran 66 standard) type.
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
code produced by the F77 compiler.  This option
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
For example, if the input filename is "prog.f77", the binary file will be
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
For example, if the input filename is "gonzo.f77", the listing file will
be "gonzo.l";
if the input filename is "bar", the listing file will be "bar.l".
If the "-l" option is not used, no listing is produced.
.sp
The input filename may be either a disk file name (conventionally
ending in ".f77", ".f" or ".df")
or the device "/dev/tty", in which case input to the
compiler is read from the user's terminal.
.sp
In summary, then, the default command line for compiling a file named
"file.f77" is
.sp
.nf
     f77c -c0d0e1f0g0h0i0k0m2o2q1r0s1t0u1v1w1x1 _
          file.f77  -b file.b  -l /dev/null
.sp
which corresponds to the F77 command
.sp
     f77 -i *>file.f77 -b *>file.b -l no -ints -logs
.sp
.fi
.es
f77c file.f77
f77c -ig dmach.f77
f77c -x dmach.f77 -b b_dmach -l l_dmach
f77c -m3 i_mode_prog.f77 -z"-newopt"
.me
.in +5
.ti -5
"Usage: f77c ..." for invalid option syntax.
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
a serious error in the operation of 'f77c' that should be reported
to your system administrator.
.in -5
.sp
Numerous other self-explanatory messages may be generated to diagnose
conflicts between selected options.
.bu
'F77c' pays no attention to standard ports.
.sa
[cc]mc |
f77cl (1), ld (1), init$f (2), bind (3)
[cc]mc
