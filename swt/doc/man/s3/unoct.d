.hd unoct "convert UNIX 'od' output to binary" 03/23/80
unoct  [ <filename> ]
.ds
'Unoct' will read the ASCII output of the UNIX program 'od'
(octal dump) present on the named file, convert it to binary,
and write the result in sixbit code suitable for loading on
the GT40 graphics terminal.
(If the filename is omitted, standard input is assumed.)
.sp
At present, 'unoct' is necessary for loading such programs
as FOCAL-GT.
.es
unoct focal
.me
"<filename>: can't open" for obvious problems.
.bu
'Unoct' is kind of an ad hoc solution to the object code porting
problem that will hopefully become unnecessary in the near future.
It is also somewhat peculiar to the environs of Georgia Tech.
.sp
Locally supported.
.sa
scroll (3), information in GT40 directory (//gt40).
