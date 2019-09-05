[cc]mc |
.hd find "look for a pattern" 08/27/84
find <pattern> { -{<option>} } { <file_spec> }
   <option> ::=  c | i | l | o[<occurrences>] | v | x
   <file_spec> ::= <filename> | -[<stdin_number>] |
                     -n(<stdin_number>|<filename>)
[cc]mc
.ds
'Find' is a filter that selects lines matching a given pattern from
the named files (or standard input if no files are specified)
and copies them to standard output.  The pattern supplied as the
first argument is a regular expression with the full set of
options found in the editor.
(See [ul Introduction to the Software Tools Text Editor] in the
[ul Software Tools Subsystem User's Guide] for details.)
.sp
[cc]mc |
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
-i\If the "i" option is used, the case of the pattern and the
text of the search file(s) is ignored.
.sp
.ti -5
-l\If the "l" option is used, each line
printed is preceded by its relative line number within the file from
which it was read.
.sp
.ti -5
-o\If the "o" option is used, find
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
-x\If the "x" option is used, or if the first character of the pattern
is a tilde ("~"), only lines that do not match the pattern are
printed.
.in -10
.ta
.tc
.sp
The remaining command line arguments are taken as names of files
to be searched for the pattern.
The full syntax of the <file_spec> argument is described in the
entry for 'cat' (1).
Most frequently, it will take the form of a Subsystem pathname.
[cc]mc
.sp
'Find' is frequently used for processing output from 'lf' before performing
some operation on a number of files,
and for stripping out "uninteresting" lines from data to be further
processed by other tools.
.es
lf -c | find .r$
lf -c | find .r$ | find call -lv -n
find CALL -lv [lf -c | find .f$]
find "format" -c rf.r ed.r
.me
.in +5
.ti -5
"Usage: find ..." for bad arguments.
.ti -5
"illegal pattern" for bad pattern syntax.
.ti -5
"file: can't open" for unreadable files.
.in -5
.sa
[cc]mc |
cat (1),
change (1), ffind (1), files (1), se (1), makpat (2), amatch (2),
match (2),
[cc]mc
[ul Introduction to the Software Tools Text Editor]
