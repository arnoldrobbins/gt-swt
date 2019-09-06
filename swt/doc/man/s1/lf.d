[cc]mc |
.hd lf "list files" 08/27/84
[cc]mc
lf { -<option>{<option>} } { <pathname> }
   <option> ::=  a | c | d | f | k | l | n
                 | o | q | r | t | u | v
                 | <sort>m | <sort>p | <sort>w | s<depth>
   <sort>   ::=  [ \ | / ]
   <depth>  ::=  [ <positive integer> ]
.ds
'Lf' prints information about files. Its primary function is to list
the names of all files within specified directories; however, other
information is also available under control of the options. Each option
is specified by a single letter, as follows:
.in +7
.tc &
.ta 6
.de op
.sp
.ti -5
[1]@[tc]
.en op
.op a
[cc]mc |
list files whose names begin with the character '.'.
[cc]mc
These files are occasionally used for long-term storage of data,
[cc]mc |
and many people prefer that they not appear in directory listings,
so they are not listed by default.
[cc]mc
.op c
force all output to be left justified
in a single column at the left margin.
This option is generally used for producing output that is to be
processed further by other programs.
.op d
treat the directories named in the argument list as ordinary files.
'Lf' normally prints information about the contents of named
directories; this option causes it to print information about
the directories themselves.
.op f
print full pathname (or as much of it as is known)
for each file name printed.
This option is frequently used when
the output of 'lf' is to be processed by
other programs, since it makes the output filenames
independent of the current position
in the file system.
.op k
print the value of the read/write lock associated with the file.
This lock
is used to control concurrent access to the file by multiple users.
Possible values are:
.in +7
.op sys
system default value is used.  At most installations this is
equivalent to "n-1" (see below).
.op n-1
allow multiple readers or one writer.
.op n+1
allow multiple readers and one writer.
.op n+n
allow multiple readers and multiple writers.
.in -7
.op l
select options k, m, o, p, t, u, and w.
See below for details on these options.
.op m
print time and date of last modification for each file listed.
.op n
inhibit sorting of output.  See below for a discussion of sorting.
.op o
print the owner password for each file listed.  Note that the
only files that have passwords are directories; a field of blanks
is printed for non-directory files.
.op p
print the protection mode of each file listed.  The protection mode
is represented as a string consisting of two fields separated by
a "/".  The characters to the left of the "/" indicate the mode
that applies to users with owner access to the file, while those
to the right indicate the mode that applies to users with non-owner
access to the file.
The three types of access are "truncate" (or "delete"), "write"
and "read", represented by the characters "t", "w" and "r"
respectively. The presence of any of these characters in the
protection mode string indicates that the associated type of access
is allowed.  If all three types of access are allowed, the
character "a" appears instead of "twr".
.op q
print the non-owner password for each file listed.  Note that the
only files that have passwords are directories; a field of blanks
is printed for non-directory files.
.op r
reverse sort.  The direction of sorting is reversed. Thus, an
ascending sort becomes descending, and vice versa.  See below for
a discussion of sorting.
.op s
print information about an entire subtree of the file system.
When this option is used, 'lf' interprets each <pathname> argument
as the name of the root node of a subtree of the file system.  Each
file in the named directory is listed;
when a subdirectory is encountered,
'lf' descends into it and recursively lists its contents.  This process
is repeated until all files and directories
in the subtree have been listed.
The depth to which 'lf' will descend in traversing the subtree may be
limited by appending a positive integer to the "s"; 'lf' will then
descend no more than that many levels below the named directory.
The other options may be used to select the information printed for
each file.  The current level of descent
is indicated by indentation; 'lf'
indents three spaces each time it
descends into a subdirectory.  Indentation
may be suppressed by specifying the "c" option.
.op t
print the file type of each file listed.
The file type is a three character string with possible values as
follows:
.in +7
.op sam
the file is organized according to the Sequential Access Method.
.op dam
the file is organized according to the Direct Access Method.
.op sgs
the file is a segment directory organized as a "sam" file.
.op sgd
the file is a segment directory organized as a "dam" file.
.op ufd
the file is a (user file) directory.
.op spc
the file is a "special" file, such as the master file directory
(mfd), the disk record availability table (dskrat), the system
boot file (boot) or the bad-record file (badspt).
.op ???
the file type cannot be ascertained.
.in -7
.op u
print the status of the "dumped" and "modified" flags associated
with each file listed.
The "dumped" flag may be set by a program such as a file archiver
to indicate that a backup copy of the file exists.  The "modified" flag
is set by Prime's single user operating system (DOS) whenever
the file is modified to indicate that the modification date is
inaccurate. (DOS doesn't maintain modification dates.)  Primos
automatically resets both flags whenever the file is modified.
The "dumped" flag is represented by a "d" and the "modified" flag
by an "m".  If a flag is on, its associated character is
printed; otherwise, a blank is displayed.
.op v
for each directory named in the argument list, print a header
containing the directory's pathname before listing its contents.
.op w
print the file size (in 16-bit words) for each file listed.
The number printed is the number of data words contained in the file;
it does not include, for example, the cumulative sizes of files
contained within segment directories or UFDs.
.sp
.in -7
If no <pathname> arguments are given, 'lf' assumes you want a listing
of the contents of the current working directory.
.sp
The default listing format without the "s" option
is multi-column sorted alphabetically
by name across columns; if, however, the "n" option is selected, no
sorting takes place.
With the "s" option, sorting is never done and the default format is
one file per line with incremental indentation based on nesting
level.  In all cases, the "c" option forces one file per line, starting
in column 1.
.sp
When neither the "n" nor "s" option is used,
'lf' may be asked to sort the output on any of three fields other
than the file name: date of last modification ("m" option), protection
mode ("p" option), or file size ("w" option).  To request one of these,
a slash ("/") or backslash ("\") may be prepended to the appropriate
option letter; slash causes an ascending sort, backslash, a descending
one.  Thus, to sort the output in order of most recent modification,
one might use
.sp
          lf -\m
.sp
.es
lf -/wp
lf -m =nbin=
lf -l //allen //dan //perry
lf -s =src=
lf -csf /0 /1 /2 /3 /4 /5 | find pascal
.me
.in +5
.ti -5
"<pathname>: not found" if specified file or directory doesn't exist.
.in -5
.bu
Sorting is performed on at most one field.  The ability to sort
by protection mode is not very useful.
.sa
[cc]mc |
chat (1), lacl (1), tscan$ (6)
[cc]mc
