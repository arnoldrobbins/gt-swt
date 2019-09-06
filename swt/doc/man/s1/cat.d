[cc]mc |
.hd cat "concatenate and print files" 08/24/84
cat { <file_spec> | -h | -s }
[cc]mc
.sp
<file_spec> ::= <filename> | -[<stdin_number>] |
.ti +16
-n(<stdin_number>|<filename>)
.ds
'Cat' concatenates the contents of the files specified in its argument
list and writes the result on its first standard output.
Files to be concatenated
may be specified in any of several ways:
.sp
.in +20
.ta 21
.tc %
.ti -20
<filename>%an ordinary Subsystem pathname.
.sp
.ti -20
-<stdin_number>%a dash followed by a decimal number, 'n', designates
the 'n'th standard input. 'n' must be a legal standard input number.
.sp
.ti -20
-%this is the same as specifying "-1" (i.e. standard input 1).
.sp
.ti -20
-n<stdin_number>%"-n" followed by a decimal number 'n' indicates
that the names of the files to be concatenated are to be read from
the 'n'th standard input.
.sp
.ti -20
-n%this is the same as "-n1".
.sp
.ti -20
-n<filename>%the names of the files to be concatenated are to be
read from the named file.
.tc
.in -20
.sp
If no arguments appear, the first standard input file is copied
to standard output until end-of-file.
.sp
If the "-h" argument is given, 'cat' precedes the contents of each
file copied with a header line consisting of twenty equals-signs
("=") followed by a blank, the name of the file, another blank,
and twenty more equals signs.
[cc]mc |
.sp
If the "-s" argument is given, 'cat' will be "silent".  In other words,
if it cannot open a file, it will not complain.
This is mainly for the benefit of shell scripts like 'sep',
and the Subsystem 'build' procedures.
[cc]mc
.es
cat time_sheet
cat >junk
print_file> cat
prog | cat -2 - >two_and_one
files .r$ | cat -n
cat -h -nnamelist >/dev/lps
.me
[cc]mc |
"<file>: can't open" if it can't open the named file,
and the "-s" option was not specified.
[cc]mc
.sa
copy (1), cp (1), print (1), pr (1), tee (1), gfnarg (2)
