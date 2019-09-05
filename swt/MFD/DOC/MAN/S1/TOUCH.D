[cc]mc |
.hd touch "set file date/time modification fields" 08/21/84
touch [-d <date>] [-t <time>] {<pathname>}
.ds
Every file system object has a field indicating the date and time
(to within 4 seconds) it was last modified.
This command will set the date/time modified field of file system
objects.
.sp
The "-d" option may be used to specify a date as recognized by
the 'parsdt' routine; if no date is specified then the current date is used.
The "-t" option may be used to specify a time as recognized by
the 'parstm' routine; if no time is specified then the current time is used.
.sp
The remaining command line arguments are taken as names of files
for which to set the modification time.
If "-n" appears in place of a pathname, pathnames are read from
the standard input.
For more information on this syntax, see the entry for 'cat' (1).
.es
lf -c | touch -n
touch -t 1124 foo.r bar.r
.me
"Usage: touch ..." for invalid arguments.
.br
"invalid format in date argument" or
"invalid format in time argument" for improper arguments.
.br
"<pathname>: can't "touch"" for protected or non-existant files.
.sa
cat (1), lf (1), gfdata (2), parsdt (2), parstm (2), sfdata (2)
[cc]mc
