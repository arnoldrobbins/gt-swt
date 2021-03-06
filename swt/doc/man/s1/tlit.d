.hd tlit "transliterate characters" 02/22/82
tlit <from set> [ <to set> { <string> } ]
.ds
'Tlit' is the character transliteration program from
.ul
Software Tools.
Character strings are read from the command line arguments, or from
standard input, transliterated according to instructions provided
in the command line arguments, and the results written to standard output.
The <from set> and <to set>
arguments are sets of characters, with some special shorthand notation.
Each set may have any number of the following components:
.in +10
.rm -5
.lt +5
.sp
.ti -5
<character>
.br
The character specified becomes part of the set.
.sp
.ti -5
<letter>-<letter>
.br
The letters specified, and all letters between them alphabetically,
become part of the set.  (Note that letters of a given case are
contiguous; A-Z means all upper case letters.)
.sp
.ti -5
<digit>-<digit>
.br
The digits specified, and all digits between them in numerical order,
become part of the set.
.sp
.ti -5
@@n,@@t
.br
A NEWLINE (if the first form is used) or a TAB (if the second form is used)
becomes part of the set.
.sp
.in -10
.rm +5
In addition, if the <from set> is preceded by a tilde (~),
the complement of the set
is used.  For example, "~A-Z" means all characters except upper case
letters.
.sp
For each character read that is a member of the <from set>,
the corresponding member of the <to set> is substituted.
If the <to set> is shorter than the <from set>,
each string of contiguous characters that are in the <from set>
but have no corresponding element in the <to set> is
replaced by a single occurrence of the last member of the <to set>.
If the <to set> is empty
or only a single argument is supplied,
such character strings are deleted.
.sp
When strings are read from the argument list, each separate
argument is treated as a NEWLINE-terminated string.
Thus, lacking specific transliteration of NEWLINE characters,
each separate argument string will result in one line of output.
.es
file> tlit a-z A-Z >uc_file
file> tlit A-Z a-z | tlit ~a-z @@n >words
tlit a-z A-Z "output one line"
tlit a-z A-Z output three lines
.me
.in +5
.ti -5
"Usage: tlit ..."
if no arguments are supplied.
.ti -5
"<from> set too large"
if <from set> cannot be contained in the internal buffer.
.ti -5
"<to> set too large"
if <to set> cannot be contained in the internal buffer.
.in -5
.sa
change (1), ed (1),
.ul
Software Tools
