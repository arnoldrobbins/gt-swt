.hd change "look for a pattern and change it" 02/01/81
change <pattern> [ <substitution> { <string> } ]
.ds
'Change' searches text strings for a pattern,
changes each occurrence of that pattern to the specified
substitution string, and writes the result on the standard output.
The first argument specifies the pattern
to be matched; the second (optional) argument specifies the substitution
string to replace the matched string.  If the substitution string is
missing, it is assumed to be null
(i.e., the matched string is deleted).
Any additional arguments are taken as strings to be changed.
Each is interpreted as a newline-terminated string; thus, lacking
specific instances of the newline character in the <pattern> or
<substitution> strings, each additional argument will cause one
line of output to be produced.
If no <string> arguments are supplied, lines of text to be changed
are read from the standard input.
.sp
Patterns and substitution strings recognized by 'change' may take any
form allowed in the text editor's substitute command.
For a discussion of this syntax, refer to the documentation for the
Subsystem text editor, 'ed', found in the
.ul
Introduction to the Software Tools Subsystem Text Editor.
.es
lf -c | sort | change "?*" "/mfd/&" >files
file.f> change "%C" "#" >file.r
change  ".pl1$"  ".l"  [source_file]
.me
.in +5
.ti -5
"Usage: change ..."
if no arguments are supplied.
.ti -5
"illegal pattern string"
for bad pattern.
.ti -5
"illegal substitution string"
for bad substitution string.
.in -5
.sa
ed (1), find (1), tlit (1), makpat (2), maksub (2), match (2),
catsub (2)
