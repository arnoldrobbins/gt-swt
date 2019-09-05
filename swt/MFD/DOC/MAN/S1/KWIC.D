.hd kwic "produce key-word-in-context index" 02/22/82
kwic [ -d [ <discard list> ] ]
.ds
'Kwic' is the key-word-in-context program from [ul Software Tools].
It is a filter,
taking lines of text from its standard input,
rotating them so that each word
in the sentence appears at the beginning of a line,
and marking the original
position of the NEWLINE with a "fold character"
(currently a grave accent with zero parity bit).
.sp
If the "-d" option is used,
'kwic' will read a sorted list of words, either from the file
specified by <discard list>, or from standard input two if
the file name is omitted.  If the first word in a rotated line
is found in the list, the line will not be written out.
The discard file
should contain one word per line, in lower case.  (Before searching
the list, 'kwic' converts the search key to lower case.)
.sp
The output from 'kwic' is typically sorted with 'sort' then "un-rotated"
with 'unrot' to produce the finished key-word-in-context index.
.es
text> kwic | sort | unrot >index
headers> kwic -d discard_list >headers.k
headers> discard_list> kwic -d >headers.k
.me
.in +5
.ti -5
"<file>: cannot open" if discard list cannot be read.
.ti -5
"<word>: discard list too long" if there are too many words in
the discard list.
.in -5
.sa
sort (1), unrot (1),
.ul
Software Tools
