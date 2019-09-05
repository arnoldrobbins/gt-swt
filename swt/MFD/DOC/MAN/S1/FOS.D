.hd fos "format, overstrike, and spool a document" 12/16/81
fos [ <pathname> { <spool options> } ]
.ds
The shell program 'fos' executes the proper pipeline to produce
a formatted document on the line printer.  If called with any
arguments, the first argument must be the file to be formatted,
possibly followed by spooler options.  If no arguments are supplied,
then 'fos' will attempt to use the 'f' variable that is set by
'e' (if declared).  If the 'f' variable is not declared, then an
error message is printed.
The spool options are any options acceptable to 'sp'.
.sp
'Fos' can take only one <pathname>, while 'fmt' can take many.  To make
'fos' accept several names, one can type:
.sp
     fos "file1 file2 file3"
.es
fos report
fos book -c 1000
.me
.in +5
.ti -5
"Usage ..." for missing pathname argument and no 'f' variable
.in -5
.sa
e (1), sp (1), fmt (1), os (1)
