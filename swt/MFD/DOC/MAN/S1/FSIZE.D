.hd fsize "size any file system structure" 01/16/83
fsize  { -<option>{<option>} } { <pathname> | -n }
       <option> ::=  f | r | v | w
.ds
'Fsize' prints the amount of disk space consumed by the
file system objects specified as arguments.
Any type of file system object may be specified (ordinary file,
ufd, or segment directory); in the case of a ufd or segment
directory, the entire file system subtree thereunder is considered
in the size.
'Fsize' will determine the amount of space used not only for
data but also for internal purposes (such as
direct access indices).
.sp
If "-n" appears in place of a pathname, pathnames are read from
the standard input.
For more information on this syntax, see the entry for 'cat' (1).
.sp
The following options are available:
.in +7
.ta 6
.sp
.tc \
.ti -5
[cc]mc |
-f\Force any object that can't be read to be readable by manipulating
[cc]mc
its protection bits and concurrent access lock.
After the object has been sized, the original attributes are
restored.
The user must have owner status in the object's parent directory
for this option to work.
.ul 100
.bf
WARNING:
This option should not be used on objects whose protection and
concurrency attributes are assumed by some running program
to have a particular setting.
.ul 0
In particular, certain of the files used by Prime's database
management system must not have their concurrency locks changed
while the DBMS is active.
.sp
.ti -5
[cc]mc |
-r\Print the size as a number of disk records (default).
.sp
.ti -5
-v\Print the name of the object along with the size of the object.
[cc]mc
This is especially useful when pathnames are being read from
the standard input.
.sp
.ti -5
[cc]mc |
-w\Print the size as a number of 16 bit words.
[cc]mc
.in -7
.sp
If the "-n" idiom is not used and no pathnames are given on the command
line, the program will size the current directory by default.
.es
fsize
lf -c | fsize -f -n | stats -tashln
fsize -wv  //extra //lib //src
.me
.in +5
.ti -5
"Usage: fsize ..." for incorrect argument syntax.
.ti -5
"-r and -w are mutually exclusive" for requesting both "r" and "w".
.ti -5
"<pathname>: can't get record size" if the record size of the disk
partition containing the specified object can't be determined.
.ti -5
"<pathname>: can't determine size" if the specified object can't be
opened for reading.
.ti -5
"<pathname>: can't size directory contents" if the specified ufd
can't be attached to.
.in -5
.bu
Gives inaccurate results for very large DAM files and DAM
segment directories (those with multi-level indices).
.sp
Will not work if the MFD of the disk containing an object
cannot be attached to with a password of "XXXXXX".
The MFD must be read to determine the record size for the disk.
.sa
lf (1), hd (1)
