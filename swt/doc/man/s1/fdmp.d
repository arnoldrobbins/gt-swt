[cc]mc |
.hd fdmp "produce formatted dump of a disk file" 08/27/84
[cc]mc
.nf
fdmp  { -<opt>{<opt>}   |
        +<start>        |
        -<end> }  [ <pathname> ]
   <opt> ::= b | c | d | h | o
.fi
.ds
'Fdmp' writes on standard output a dump of the named file
(standard input if the file name is omitted) in one or more
of five formats as specified by the <opt> arguments.  The formats
are:
.sp
.in +10
.ta 6
.tc \
.ti -5
[cc]mc |
-b\The file is interpreted as a sequence of octal bytes.
.sp
.ti -5
-c\The file is interpreted as a sequence of ASCII characters.
[cc]mc
Non-printable characters are represented by a control sequence
consisting of a caret ("^") followed by the corresponding
printable character.  Thus, an ETX (ctrl-c) would be represented
by "^c".  The single exception is DEL which is represented as
"^ ".
.sp
.ti -5
[cc]mc |
-d\The file is interpreted as a sequence of signed decimal integers.
.sp
.ti -5
-h\The file is interpreted as a sequence of hexadecimal integers.
.sp
.ti -5
-o\The file is interpreted as a sequence of octal integers.
[cc]mc
.sp
.in -10
In the absence of any other specification, "-o" (octal) is
assumed.
.sp
For each mode requested, one line of output is produced for
each group of eight words in the file.  The file offset,
in octal, of the first word in the group is prepended to the first
line of output for each group.
.sp
The portion of the file that is dumped may be controlled
with the "+<start>" and "-<end>" arguments.  <start> and <end>
represent the decimal addresses of the first and last
words of the file to be dumped.  (The first word has an address
of zero.)  The two arguments may be used in any combination.
If the start address is unspecified, word zero is assumed.
Likewise, if no ending address is given, the dump proceeds
until end of file is encountered.
.sp
If no file name is specified as an argument, standard input one
is read, allowing 'fdmp' to be used in a pipeline.
.es
fdmp -bc -127 textfile
weird_program | fdmp
.me
"Usage: fdmp ..." for incorrect arguments.
