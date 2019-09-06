[cc]mc |
.hd ffind "look for a string (kmp style)" 08/27/84
ffind <string> { -{<option>} } { <file_spec> }
   <option> ::=  c | i | l | o[<occurrences>] | v | x
   <file_spec> ::= <filename> | -[<stdin_number>] |
                     -n(<stdin_number>|<filename>)
.ds
'Ffind is a filter that selects lines matching a given string from
the named files (or standard input if no files are specified) and copies
them to standard output. Unlike 'find', 'ffind' cannot match
the standard Subsystem patterns but will match only a [ul literal]
string. The algorithm used (Knuth, Morris, and Pratt) is very fast
and is typically four to fives times faster than 'find'.
.sp
The available options are:
.in +10
.ta 6
.tc \
.sp
.ti -5
-c\If the "c" option is used, only a count of the lines that
matched (differed) is printed.
.sp
.ti -5
-i\If the "i" option is used, the case of the string and the
text of the search file(s) is ignored.
.sp
.ti -5
-l\If the "l" option is used, each line
printed is preceded by its relative line number within the file from
which it was read.
.sp
.ti -5
-o\If the "o" option is used, 'ffind'
will quit searching the current file after
<occurrences> matching (differing)
lines have been found in it, and will continue with the next file.
If "o" is specified but <occurrences> is omitted, only the first
occurrence is found.
.sp
.ti -5
-v\If the "v" option is specified, each line of output is labelled with
the name of the input file from which the line was read.
.sp
.ti -5
-x\If the "x" option is used, only lines that do not match the
string are printed.
.in -10
.ta
.tc
.sp
The remaining command line arguments are taken as names of files
to be searched for the string.
The full syntax of the <file_spec> argument is described in the
entry for 'cat' (1).
.es
lf -c | ffind .r
guide -p sh | ffind the -ci
.me
.in +5
.ti -5
"Usage: ffind ..." for bad arguments.
.ti -5
"file: can't open" for unreadable files.
.in -5
.sa
cat (1), change (1), find (1)
.sp
Knuth, D.E., J.H. Morris, Jr., and V.R. Pratt (1977).
"Fast pattern matching in strings." SIAM Journal on Computing 6
(No. 2): 240-267.
[cc]mc
