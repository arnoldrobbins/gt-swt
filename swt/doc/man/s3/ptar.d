[cc]mc |
.hd ptar "decode Unix tar format tapes" 05/17/84
ptar [-xvt] [-f <file>]
.ds
'Ptar' reads input in the form produced by the Unix 'tar'
([bf t]ape [bf ar]chiver) program, and rebuilds the directory
subtree(s) encoded on the tape, if possible.
'Ptar' [ul must] have write permission in the current directory
in order to create the files and directories it is dumping
from the tape.
.sp
'Ptar' knows about the Unix "." (current directory)
and ".." (parent directory) directory structures.
In the first case, the leading "./" is simply stripped off the file
name which is currently being recreated.
Multiple occurrences of "./", [ul at the beginning of a file name],
are allowed, and will be stripped off.
In the second case, the leading "../" is replaced with a "\".
Each occurrence of "../" at the beginning of a file name is replaced
with a "\".
Absolute path names (names that start with a "/"), have another
"/" prepended, in the hope that there will be an appropriate directory
out in the file system somewhere.
File names beginning with a digit have an "_" prepended to them,
since the Primos file system will not allow file names to start
with a digit.
In general, it is best if one's 'tar' tape contains only relative
path names.
'Ptar' checks first for leading "./"s, and then for "../", so if
you have file name that starts with ".././", 'ptar' will be fooled.
Also, one should not have occurrences of either "./" or "../" in
the middle of one's file names.
.sp
'Ptar' assumes that you are dumping [ul text] files.
Therefore it always sets the parity bit, to conform to Prime's
convention of using mark parity.
Unix binaries would be of limited use on a prime anyway.
.sp
When 'Ptar' finishes, it leaves a file in the current directory,
called "_detab.tar.files".  This is a command file which will
remove tabs from the files just dumped.
Tabs are replaced by eight blanks, which is the Unix default.
"_detab.tar.files" turns on shell tracing, so that you can
make it sure it is transforming the files properly.
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
-t\Table of contents.  This option reads through the 'tar'
tape, printing out the file names and their sizes in bytes,
but does not dump the files.
.sp
.ti -5
-v\Verbose.  This option will print file names and sizes as they
are being dumped.  It is wise to use this option.
.sp
.ti -5
-x\Extract.  This is the default behavior.
In fact, putting this option on the command line has absolutely
no effect at all.
Use the "-t" option if you just wish to see what is on the tape.
.sp
.ti -5
-f\Use the given file as input.
When this option is given, the next argument is used for input.
A file name of "-" is taken to mean the standard input.
If no files are given, 'ptar' will issue an error diagnostic and die.
.in -10
.es
x as mt0; mt -r -cb -b512 | ptar -xv; x un mt0
tarfile> ptar -t
ptar -xvf tafile
.fl
_detab.tar.files  to replace tabs with blanks in the newly extracted files.
.me
Various self-explanatory messages if it can't create directories or files.
.bu
Will overwrite "_detab.tar.files" each time.
.sp
Cannot take more than one file on the command line for
the "-f" option.
.sp
Cannot dump Prime directory trees into a 'tar' format tape.
.sa
mt(1),
tar(1) in the [ul UNIX Programmer's Manual].
[cc]mc
