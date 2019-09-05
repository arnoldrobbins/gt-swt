[cc]mc |
.hd chat "change file attributes" 08/27/84
[cc]mc
.nf
chat { { <option> } { <pathname> } }
   <option>  ::=  -k <lock> | -m <date> <time> |
                  -p <protect> | -s [<depth>] | -u
   <lock>    ::=  sys | n-1 | n+1 | n+n
   <date>    ::=  mm/dd/yy
   <time>    ::=  hh:mm:ss
   <protect> ::=  {t | w | r | a}[/{t | w | r | a}]
   <depth>   ::=  <positive integer>
.fi
.ds
'Chat' allows a user to change the attributes
associated with a file or a group of files. Arguments to 'chat' are
generally of the form:
.sp
     <attributes> <files> { <attributes> <files> }
.sp
where <attributes> consists of a series of one or more options, and
<files> is a list of files to which the specified attributes should
be applied.  Options consist of an option flag ("-" followed by a
single character) usually followed by a string specifying the
value of the attribute to be set.  In most cases, this value string
may either be a separate argument from the option flag, or appended
to the option flag itself.  The exceptions to this rule are the
"-u" option which takes no value string, and the "-m" option
which requires two value strings, each of which must be a separate
argument.
.sp
The following options are available:
.sp
.tc &
.ta 6
.de op
.sp
.ti -5
[1]@[tc]
.en op
.in +7
.op -k
the lock that governs concurrent access to a
given file by multiple users is set for each
named file according to the value string
which may be any of the following:
.in +7
.op sys
the default system value is used;
at most installations this is equivalent to "n-1".
.op n-1
multiple readers or one writer.
.op n+1
multiple readers and one writer.
.op n+n
multiple readers and writers.
.in -7
.op -m
the date and time of last modification is set
for each of the named files according to
the two value strings that follow. The first string
specifies a date, and the second a time in military (24 hour) format.
.op -p
the protection mode associated with the named
files is set according to the value string
which is composed of two fields separated
by a "/".  The characters to the left of the "/" specify the
types of access to be allowed to users with "owner" status,
and those to the right specify the types of access to be
given to users with "non-owner" status.
The possible types of access are "truncate" (or "delete"), "write" and
"read", represented by the characters "t", "w" and "r" respectively.
If all three types of access are to be allowed, the character "a"
may be used instead of "twr".
If nonowners are to receive no access whatsoever, the slash may be
omitted.
.op -s
the named files are assumed to be directories
and the specified attributes are applied to
all files in the subtree rooted in those directories.
If a value string is specified, it must be a positive integer
that indicates the maximum number of levels below the named directories
to which 'chat' is to descend.
For example, if "-s1" is specified,
only the files immediately contained in the named directory
will have their attributes set.
.op -u
turn on the "dumped" flag associated with each
named file. Primos turns off the "dumped"
flag associated with a given file each time
the file is modified. When the file system is periodically
dumped to tape, only those files whose "dumped" flags
are off (i.e. that have been changed since the last backup)
are actually copied to the tape.  The "dumped" flags of those
files are then turned on to indicate that the files have been
backed up.
.sp
.in -7
If no options
(other than "-s") are specified, the attributes "-p a/r" are assumed.
If the "-s" option is used and no <pathname> arguments are given,
a pathname equivalent to that of the current directory is assumed.
.sp
To find the attribute values currently held by a file, use the 'lf'
command.
.es
chat -s
chat -u junkfile
chat -p wr/r f1 f2  -p a/wr f3
chat -s1 //src
.me
.in +5
.ti -5
"Usage: chat ..." for unrecognizable options.
.ti -5
"<pathname>: bad pathname" if a specified pathname refers to a
non-existent file.
.ti -5
"<pathname>: not a directory" if the "-s" option is used on a
non-directory file.
.sp
.in -5
The following messages occur when a specified attribute cannot
be set:
.sp
.in +5
.ti -5
"<pathname>: can't set protection"
.ti -5
"<pathname>: can't set modification date/time"
.ti -5
"<pathname>: can't set dumped bit"
.ti -5
"<pathname>: can't set read/write lock"
.sp
.in -5
The following messages occur when specific argument syntax errors
are detected:
.sp
.in +5
.ti -5
"<arg>: bad date"
.ti -5
"<arg>: bad time"
.ti -5
"<arg>: bad protection mode"
.ti -5
"<arg>: bad lock specification"
.in -5
.sa
[cc]mc |
lf (1), sacl (1), tscan$ (6), sprot$ (6)
[cc]mc
