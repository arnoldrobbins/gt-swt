[cc]mc |
.hd splc "interface to Primos SPL compiler" 08/27/84
[cc]mc
splc {-<option>[<level>]} <input file>
         [-b [<binary file>]]
         [-l [<listing file>]]
         [-z <SPL option>]
   <option> ::= c | d | e | f | h | k | m | n |
                o | p | q | r | s | v | w | x
.ds
'Splc' serves as the Subsystem interface to the Primos SPL compiler
(SPL).
It examines its option specifications and checks them for consistency,
provides Subsystem-compatible default file names for the listing
and binary files as needed, and then produces a
Primos SPL command and causes it to be executed.
.sp
.bf
Options
.sp
The general structure of an 'splc' option is a single letter, possibly
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
.op c 0 1 0 "Case mapping"
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
(Cannot be used when the "-o" option is specified with a level greater
than zero.)
.op e 0 1 1 "Error listing on terminal"
.sp
Level 0 inhibits the printing of compilation errors on the user's
terminal.
.sp
Level 1 causes compilation errors to be printed on the terminal.
.op f 0 3 2 "Symbol table map and offset map control"
.sp
Level 0 inhibits the generation of either a symbol table map or
a storage offset map.
(Cannot be used when the "-x" option is specified with a level
greater than zero.)
.sp
Level 1 causes the generation of a map listing the storage offset
of each program variable, but still inhibits the generation of a
a symbol table map.
(Cannot be used when the "-x" option is specified with a level
greater than zero.)
.sp
Level 2 causes the generation of a map listing the symbol names
appearing in the program, but inhibits the generation of a storage
offset map.
.sp
Level 3 causes the generation of both the symbol table and storage
offset maps.
.op h 0 1 0 "Huge (multi-segment) arrays"
.sp
Level 0 insures that dummy arrays and array parameters will not
be treated as multi-segment arrays.
.sp
Level 1 causes references to dummy arrays and array parameters to
generate code that will work even if the arrays are larger than
one segment (64K words) in length.
.op k 0 1 0 "Compilation statistics"
.sp
Level 0 inhibits the display of compilation statistics on the terminal.
.sp
Level 1 causes the display of compilation statistics on the terminal.
.op m 2 2 2 "Addressing mode"
.sp
Level 2 implies 64V addressing mode.
At present this is the only addressing mode fully supported under the
Subsystem.
.op n 0 1 1 "Nesting level indicator"
.sp
Level 0 inhibits the printing of the nesting level of each statement
on the listing.
.sp
Level 1 causes the printing of the nesting level of each statement.
.op o 0 1 1 "Optimization control"
.sp
Level 0 turns off all optimizations.
.sp
Level 1 turns on optimizations.
This option cannot be used with full debugging (-d2).
.op p 0 1 0 "Quick call of internal subroutines"
.sp
Level 0 causes all internal subroutines to be called with the normal
procedure call (PCL) mechanism.
.sp
Level 1 causes internal subroutines to be "quick called" (shortcalled)
whenever possible.
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
.op s 0 1 1 "Constant copying for subroutine calls"
.sp
Level 0 inhibits the copying of constants into temporary variables
for passing as subroutine parameters.
.sp
Level 1 causes the compiler to copy constants into temporary variables
before calling subroutines.
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
code produced by the SPL compiler.  This option
improves the accuracy of single precision floating point calculations
at some slight run-time performance expense.
.op x 0 1 1 "Cross-reference listing control"
.sp
Level 0 inhibits the generation of a cross-reference.
.sp
Level 1 causes the compiler to generate a cross-reference
listing.
(Cannot be used when the "-f" option is specified with a level
less than two.)
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
For example, if the input filename is "prog.spl", the binary file will be
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
For example, if the input filename is "gonzo.spl", the listing file will
be "gonzo.l";
if the input filename is "bar", the listing file will be "bar.l".
If the "-l" option is not used, no listing is produced.
.sp
The input filename may be either a disk file name (conventionally
ending in ".spl").
or the device "/dev/tty", in which case input to the
compiler is read from the user's terminal.
.sp
In summary, then, the default command line for compiling a file named
"file.spl" is
.sp
.nf
     splc -c0d0e1f2h0k0m2n1o1p0q1r0s1v1w0x1 _
          file.spl  -b file.b  -l /dev/null
.sp
which corresponds to the SPL command
.sp
     spl -i *>file.spl -b *>file.b -l no
.sp
.fi
.es
splc file.spl
splc -kf dmach.spl
splc -x dmach.spl -b b_dmach -l l_dmach
splc -m2 v_mode_prog.spl -z"-newopt"
.me
.in +5
.ti -5
"Usage: splc ..." for invalid option syntax.
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
a serious error in the operation of 'splc' that should be reported
to your system administrator.
.in -5
.sp
Numerous other self-explanatory messages may be generated to diagnose
conflicts between selected options.
.bu
'Splc' pays no attention to standard ports.
.sa
[cc]mc |
ld (1), splcl (1), bind (3)
[cc]mc
