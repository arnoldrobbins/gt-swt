[cc]mc |
.hd shar "put text files into a 'shell archive'" 06/21/84
shar <file_spec> { <file_spec> ... }
.ds
'Shar' ([bf Sh]ell [bf Ar]chiver) is an alternative method of arranging
for long term storage of files that need to be kept together for
some purpose, or files that will not be frequently accessed.
.sp
'Shar' reads the files named on the command line, and writes the
"shell archive" on its first standard output port.
A shell archive is a file containing shell commands and text, that
when executed as a command by the Software Tools Subsystem shell,
will reproduce the files used to create the archive.
.sp
See the help on 'cat' for a full description of <file_spec>.
.sp
'Shar' can even be used to archive other shell archives, as long
the component archives do not contain a file by the same name as
the archive.
.sp
To extract the files, simply execute the archive file as a command.
As each file is extracted, its name is written out to the terminal.
.es
shar @[files .r$] @[files .d$] >prog.shar   # to create an archive
.br
prog.shar       # to extract the files in the archive
.me
"<file>:[bl]can't[bl]open"[tc]when it can't open a file.
.sp
"usage:[bl]shar[bl]..." if called improperly.
.bu
May do bizarre things with non-text files.
.sp
Can't recursively archive sub-directories.
.sa
ar (1), cto (1), cat (1)
[cc]mc
