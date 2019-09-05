[cc]mc |
.hd rp "extended Ratfor preprocessor" 08/27/84
[cc]mc
rp [-{a | b | c | d | f | g | h | l | m | p | s | t | v | y}]
   [-o <output_file>] {<input_file>} [-x <translation file>]
.ds
'Rp' is the Georgia Tech extended Ratfor preprocessor.
It replaces the original Kernighan/Plauger Ratfor preprocessor,
locally supported under the name 'rf' at Version 7.
.sp
A full description of the Ratfor language is quite beyond the scope
of this document.
For complete information, please see the
.ul
[cc]mc |
User's Guide for the Ratfor Preprocessor
[cc]mc
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
[cc]mc |
-a\Abort all active shell programs if any errors were encountered
[cc]mc
during preprocessing.
This option is useful in shell programs like 'rfl' that wish to
inhibit compilation and loading if preprocessing failed.
By default, this option is not selected;
that is, errors in preprocessing do not terminate active
shell programs.
.sp
.ti -5
[cc]mc |
-b\Do not map long identifiers or identifiers containing upper case
[cc]mc
letters into unique six character Fortran identifiers.
This option is useful if your Fortran compiler will accept names
longer than six characters.
.sp
.ti -5
[cc]mc |
-c\Include statement-count profiling code in the generated Fortran.
[cc]mc
When this option is selected, calls to the library routines
'c$init', 'c$incr', and 'c$end' will be placed (unobtrusively)
in the output code.
When the preprocessed program is run, it will generate a file named
"_st_count" containing execution frequencies for each line of
source code.
The utility program 'st_profile' may then be used to combine
source code and statement counts to form a readable report.
.sp
.ti -5
[cc]mc |
-d\Inhibit generation of the long-name dictionary.
[cc]mc
Normally, a dictionary listing all long names used in the
Ratfor program along with their equivalent short forms is placed
at the end of the generated Fortran as a series of comment
statements.
This option prevents its generation.
.sp
.ti -5
[cc]mc |
-f\Suppress automatic inclusion of standard definitions file.
[cc]mc
Macro definitions for the manifest constants used throughout
the Subsystem reside in the file "=incl=/swt_def.r.i".
'Rp' will process these definitions automatically, unless the
"-f" option is specified.
.sp
.ti -5
[cc]mc |
-g\Make a second pass over the code and remove GOTOs to GOTOs
[cc]mc
generated in Ratfor control structures.  Use of this option
lengthens preprocessing time significantly, but can result
(sometimes) in a 2-5% speedup of the object program.
.sp
.ti -5
[cc]mc |
-h\Produce Hollerith-format string constants rather than quoted
[cc]mc
string constants. This option useful in producing character
strings in the proper format needed by your Fortran compiler.
.sp
.ti -5
[cc]mc |
-l\Include Ratfor line numbers in the sequence number field of the
[cc]mc
Fortran output.
This may be useful in tracking down the Ratfor statement that caused
a Fortran syntax error.
By default, no sequence field is generated.
.sp
.ti -5
[cc]mc |
-m\Map all identifiers to lower case.
[cc]mc
When this option is selected, 'rp' considers the upper case letters
equivalent to the corresponding lower case letters,
except inside quoted strings.
.sp
.ti -5
[cc]mc |
-p\Emit subroutine profiling code.
[cc]mc
When this option is selected, 'rp' places calls to the library
routines 't$entr', 't$exit', and 't$clup' in the Fortran output,
and creates a text file named "timer_dictionary" containing the
names of all subprograms seen by the preprocessor.
When the profiled program is run, a file named "_profile" is
created that contains timing measurements for each subprogram.
The utility program 'profile' may then be used to print a report
summarizing the number of times each subprogram was called and
the total time spent in each.
.sp
.ti -5
[cc]mc |
-s\Short-circuit all logical conditions.
[cc]mc
The order of evaluation of logical operands in Fortran is unspecified;
that is, in the expression "a&b" there is no guarantee that "a" will
be evaluated before "b".
Occasionally this creates inconveniences; one would like to say
something like "if(i>1&array(i)~=0)...".
'Rp' supplies the short-circuit logical operators "&&" and "||"
(read "andif" and "orif") for these occasions.
Both operators evaluate their left operands; if the value of
the logical expression is predictable solely on the basis of
the value of the left operand, then the right operand remains
unevaluated and the correct expression value is yielded.
Otherwise the right operand is evaluated and the proper expression
value is determined.
The "-s" option may be used to automatically convert all
"logical and" operators in a program to "andifs," and all "logical
or" operators to "orifs."
In addition to improving program portability, this option may also
reduce execution time.
By default, however, this option is not in effect.
.sp
.ti -5
[cc]mc |
-t\Trace subprograms.
[cc]mc
When a program preprocessed with the "-t" option is run,
an indented trace of the subprograms encountered will be printed
on ERROUT.
This trace output is generated by calls to the library routine
't$trac' that are inserted automatically by 'rp'.
.sp
.ti -5
[cc]mc |
-v\Output "standard" Fortran. This option causes 'rp' to generate only
[cc]mc
standard Fortran constructs (as far as we know).  This option
does not detect non-standard Fortran usage in Ratfor source code;
it only prevents 'rp' from generating non-standard constructs in
implementing its data and control structures.
Programs preprocessed with this option
are slightly larger and slower; the intermediate Fortran and binary
files are approximately 10% larger.
.sp
.ti -5
[cc]mc |
-x\Translate character codes.  'Rp' uses the character correspondences
[cc]mc
in the <translation[bl]file> to convert characters into integers
when it builds Fortran DATA statements containing EOS-terminated
or PL/I strings.  If the option is not specified, 'rp' converts
the characters using the native Prime character set.
The format of the translation file is documented below.
.sp
.ti -5
[cc]mc |
-y\Do not output "call[bl]swt".  This option keeps
[cc]mc
'rp' from generating "call swt" in place of all "stop" statements.
.sp
.in -10
The remainder of the command line is used to specify the names
of the Ratfor input file(s) and the Fortran output file.
If the "-o" option, followed by a filename, is selected, then
the named file is used for Fortran output.
Any remaining filenames are considered Ratfor source files.
If no other file names are specified, standard input is read.
If the "-o" option is not specified, then the output filename
is constructed from the first input filename by changing a
".r" suffix (if present) to ".f".
If the ".r" suffix is not present, the output filename is
the input filename followed by the suffix ".f".
.sp
The format of the translation file used with the "-x" option
is as follows.
Each line contains descriptions of two characters:
the Prime native character to be replaced, and the character value
to replace it.
These descriptions may be any one of the following:  a single
non-blank Prime ASCII character, a number in a format
acceptable to 'gctoi' (must be more than one digit),
or an ASCII mnemonic acceptable to 'mntoc'.
In addition, the character to be replaced may also
be the mnemonic "EOS" to indicate that the value of the end-of-string
indicator is to be changed.  For example, here is a portion of
the table for converting the EBCDIC character set:
.sp
.in +5
.nf
A 16rc1
B 16rc2
...
Z 16re9
0 16rf0
...
9 16rf9
SP 16r40
.fi
.sp
.in -5
.es
rp file.r
rp -scp slow_prog.r
rp -o all.f part1.r part2.r part3.r
cat [files .r] | rp >junk.f
.fl
=temp=/tm?* for various internal temporaries
.br
=incl=/swt_def.r.i for standard Subsystem macro definitions
.me
See the
.ul
[cc]mc |
User's Guide for the Ratfor Preprocessor
[cc]mc
.sa
profile (1), st_profile (1),
c$init (6), c$incr (6), c$end (6),
t$entr (6), t$exit (6), t$clup (6), t$time (6),
t$trac (6),
[cc]mc |
.ul 100
[cc]mc
Software Tools,
[cc]mc *
[cc]mc
Software Tools Subsystem Tutorial,
[cc]mc |
User's Guide for the Ratfor Preprocessor
.ul 0
[cc]mc
