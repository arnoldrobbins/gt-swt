.hd show "print a file showing control characters" 01/15/83
show [-m | -o] { <file spec> }
     <file spec> ::= <pathname> | -[<stdin_number>]
                   | -n(<stdin number> | <pathname>)
.ds
'Show' concatenates the contents of the files specified in its
argument list, replacing any imbedded non-printing characters
with printable representations, and writes the result on its first
standard output.
Normally, the non-printing characters are displayed as digraphs
consisting of a caret ("^") followed by an uppercase letter or
punctuation character.
However, if the "-m" option is specified, non-printing characters
are represented as their ASCII mnemonics enclosed in angle brackets
(e.g., a NEWLINE would be represented as "<LF>").  If the "-o"
option is specified, the characters are displayed as a caret
followed by three octal digits.
.sp
Input files may be specified in any of several ways:
.sp
.in +20
.ta 21
.tc %
.ti -20
<pathname>%an ordinary Subsystem pathname.
.sp
.ti -20
-<stdin number>%a dash followed by a decimal number, 'n', designates
the 'n'th standard input. 'n' must be a legal standard input number.
.sp
.ti -20
-%this is the same as specifying "-1" (i.e., standard input 1).
.sp
.ti -20
-n<stdin number>%"-n" followed by a decimal number 'n' indicates
that the names of the files to be concatenated are to be read from
the 'n'th standard input.
.sp
.ti -20
-n%this is the same as "-n1".
.sp
.ti -20
-n<pathname>%the names of the files to be concatenated are to be
read from the named file.
.tc
.in -20
.sp
If no arguments appear, input is read from the first standard
input port.
.sp
.es
show weird_file
files .r$ | show -m -n
.me
.in +5
.ti -5
"Usage: show ..." for invalid argument syntax.
.ti -5
"<pathname>: can't open" if a specified file can't be opened for
reading.
.in -5
.sa
cat (1), copy (1), print (1), pr (1), tee (1)
