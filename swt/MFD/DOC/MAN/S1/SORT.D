.hd sort "sort ASCII-encoded records" 02/22/82
sort {-d | -r} { <pathname> }
.ds
'Sort' is a rather straightforward program that sorts the contents
of the files named in its argument list and writes the result on its
first standard output port. By default, lines are sorted in ascending
order on the basis
of ASCII collating sequence, using the entire line as a key.  If
the
"-d"
option is specified, dictionary collating sequence (upper and
lower case are equivalent, punctuation
and special characters are ignored) is used.  If the
"-r"
option is specified, lines are sorted in descending order.
.sp
If no pathname arguments are given, or if the pathname "-" appears
as an argument, standard input one is used for input. Thus, 'sort'
may be used as a filter.
.sp
'Sort' uses a combination of 'quicksort' and merge; it is taken
directly from
.ul
Software Tools.
.es
lf -c | sort | cat -n
sort -d wordlist dictionary >new_dictionary
files .r$ | sort -r | print -n
.fl
=temp=/st$?* for sort temporary files
.me
.in +5
.ti -5
"<file>: can't open" for unreadable files.
.ti -5
"<file>: can't create" if temporary file can't be created.
.in -5
.sa
.ul
Software Tools
