.hd basename "select part of a pathname" 02/22/82
basename [-(b | f | s | d | g)] { <pathname> }
.ds
'Basename' is the function that knows about the
syntax of pathnames and can select various portions
of the name based on its arguments.  It obtains input
pathnames from its argument list, or from standard input
if no arguments are specified, and prints the selected
components on standard output.  Options control the
portion of the file name selected as follows:
.sp
.nf
.ul
      Option                 Selects

   -b or none        the base file name only
       -s            the file suffix only
       -d            the directory path only
       -f            the directory path and file name
       -g            the file name and suffix only
.fi
.me
"Usage: basename ..." for bogus arguments.
.es
basename -s myprog.plg
cd [basename -d [file]]; [basename -g [file]]
ld [basename [file]].b -o [basename [file]]
.sa
take (1), drop (1), rot (1)
