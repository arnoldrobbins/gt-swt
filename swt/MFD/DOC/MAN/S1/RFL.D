.hd rfl "command file to rp, fc, and ld a Ratfor program" 01/16/83
rfl [<file.r> [<ld_args>] [/ [<rp_args>] [/ [<fc_args>]]]]
.ds
'Rfl' is a shell program that causes the specified Ratfor program
to be preprocessed, compiled and loaded.
The source file is expected to be named <program>.r
and the output object code is named <program>.
A check is made to verify the existence of the source program;
if it is not present, processing is discontinued.
.sp
A few examples may clarify the (somewhat obscure) command syntax.
.sp
'Rfl' shares the shell variable 'f' with the shell program 'e';
thus one may compile the last program edited simply by typing
"rfl" with no arguments.
If the source file is to be named explicitly, it follows the "rfl"
(e.g. "rfl file.r").
The ".r" suffix on the source file name is not required, although
'rfl' requires that the source code reside in a file named with
a ".r" suffix; thus one may write "rfl file" to compile the
contents of "file.r".
.sp
Options for 'ld' (names of libraries, for example) may follow
the name of the source file, e.g. "rfl prog -l vthlib".
Special options for 'rp' may be placed after the 'ld' options,
as long as they are separated by an argument consisting only
of a slash; for example, "rfl prog -l vthlib / -c".
Finally, options for 'fc' may be placed after the 'rp'
options, as long as the two groups are separated by a slash.
Example:  "rfl prog -l vthlib / -c / -t".
.es
rfl      # ratfor, fortran, and load the last file edited
.sp
rfl profile
rfl profile.r
.sp
rfl sol -l vthlib
.sp
rfl rsa -l vswtml / -t / -t -l rsa.list
.me
"<source_file>:  can't open" for missing ".r" file
.br
"no source file" for missing file name and no 'f' variable
.sa
rp (1), fc (1), fcl (1), ld (1)
