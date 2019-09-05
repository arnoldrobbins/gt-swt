.hd uniq "eliminate successive identical lines" 02/22/82
uniq [-n]
.ds
'Uniq' is used to strip adjacent duplicate lines from its standard input.
The resulting text is copied to standard output.  'Uniq' is usually used
to eliminate redundant lines from a sorted file.
.sp
If the "-n" option is specified, 'uniq' counts the number of occurrences
of each line.  The count is placed right justified in the first five
columns of the output, suitable for sorting or further manipulation with
'change', 'find', or 'field'.
.es
words> sort | uniq -n
.me
"Usage: uniq ..." for invalid argument syntax.
.bu
Does not handle lines of length greater than MAXLINE.
.sa
sort (1), speling (1)
