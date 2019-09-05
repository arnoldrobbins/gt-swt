.hd files "list file names matching a pattern" 03/20/80
files [ <pattern> { <'lf'_argument> } ]
.ds
'Files' is a shell file that invokes the 'lf' command and
filters its output through 'find' to select the names that
match the specified pattern. The pattern may be any expression
that is acceptable (as a pattern) to 'find'. By default, the files
in the current working directory are the ones whose names are
examined; however, an alternate directory may be specified
as a second argument. If no arguments are specified, files
produces the same results as an "lf -c" command.
.es
del -v [files ".b$"]
.sp
pr [files ".r$"]
.sp
files .r$ =src=/lib/swt/src | change .r$ |$
   files .d$ =doc=/man/s2 | change .d$ | common -1
.me
Various messages may be produced by 'lf' and 'find'.
.sa
find (1), lf (1), amatch (2), makpat (2)
