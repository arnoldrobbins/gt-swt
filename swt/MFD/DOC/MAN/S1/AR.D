.hd ar "archive file maintainer" 01/16/83
ar -(a[d] | d | p | t | u[d] | x)[v] <archive> {<file_spec>}
   <file_spec> ::= <pathname> | -n[<pathname>|<stdin_number>]
.ds
'Ar' is a program designed to manipulate files that have been
grouped together into a single "archive" file.
Its principal
utility is in keeping permanent backup copies of important files.
Significant savings in disk space usage may also be realized
by maintaining files in archives, resulting from the reduction
of internal disk fragmentation.
.sp
Arguments to 'ar' consist of one of six directives, discussed below,
followed by the name of the archive file, optionally followed by
one or more <file_spec>s.
The <file_spec>s, if present, designate names of files or archive
members and are interpreted
according to the specified directive.
(For a full discussion of the syntax of <file_spec>, see the entry
for 'cat' in section 1.)
.sp
The possible directives are:
.in +5
.ta 6
.tc \
.sp
.ti -5
-a\Append.
The named files are added to the end of the archive;
if the archive did not previously exist, it is created.
If any of the files is already contained in the archive,
a diagnostic message is printed and the archive is not altered.
If the "d" flag is specified and no errors are encountered
in appending the new files, the files are deleted from the
file system.
.sp
.ti -5
-d\Delete.
The named members are deleted from the archive.
.sp
.ti -5
-p\Print.
The named members are copied to standard output 1, one after
another.
Files are not necessarily printed in the order specified in the
argument list; rather, they are printed in the order in which they
appear in the archive.
If no names are given, all members of the archive are printed.
.sp
.ti -5
-t\Table.
A table of contents of the archive file is printed
on standard output 1.
If file names are specified, information for only those members
is printed.
.sp
.ti -5
-u\Update.
The named members of the archive are updated from the file system;
if no names are specified, all members of the archive are updated.
Any files named in the argument list that have no corresponding
members in the archive are added to the end of the archive;
a new archive may be created in this manner.
If the "d" flag is specified and no errors are encountered,
all the files named in the argument list are deleted from the
file system.
.sp
.ti -5
-x\Extract.
This directive is similar to the "-p" directive, except that the
named members are written to individual files.
Again, if no names are specified in the argument list, all archive
members are extracted.
The archive is not modified.
.in -5
.tc
.sp
Any of these directives may be accompanied by the "v" flag, which
causes 'ar' to print on standard output 1 the name of each archive
member that it operates on.
In the case of the "-t" directive, the "v" flag causes more information
about each member to be printed.
In the case of the "-p" directive, the name of the member is written
out immediately before the contents of the member.
.es
ar -tv arch.a
ar -x old_progs.a gamma.r gamma.b
ar -d backup.a rf.r
ar -ud archive.a ar.r ar.d
ar -pv archive.a ar.r >archive.r
lf -fc =src=/std.r | ar -u src.a -n
.me
.in +5
.ti -5
"Usage: ar ..."
for incorrect argument syntax.
.ti -5
"archive not altered"
when fatal errors occur and the original archive is left intact.
.ti -5
"<file>: can't add"
when a file to be put in the archive can't be opened for reading.
.ti -5
"can't replace archive with <temp>"
with the "-u" directive when the old archive can't be replaced
with the newly created one.
The new archive is left in the file <temp>.
.ti -5
"<member>: already in archive"
with the "-a" directive when a named file is already in the
archive.
.ti -5
"delete by name only"
with the "-d" directive when no member names are specified.
.ti -5
"<file>: can't create"
with the "-x" directive when a file can't be opened for writing
to receive the extracted archive member, or with the "-a" and "-u"
directives when a new archive file can't be created.
.ti -5
"can't handle more than <max> file names"
when more than <max> names are specified in the argument list.
.ti -5
"<file>: duplicate file name"
when the same name appears more than once in the argument list.
.ti -5
"archive not in proper format"
when 'ar' is used on something other than an archive.
.ti -5
"<member>: not in archive"
with the "-d", "-p", "-t" and "-x" directives when a member named
in the argument list is not in the archive.
.ti -5
"<file>: can't remove"
with the "-a" and "-u" directives when a file can't be deleted from
the file system.
.ti -5
"premature EOF" with the "-d", "-p", "-u" and "-x" directives
when end of file is encountered on the archive during the copying
of a member.
.in -5
.bu
There is no way to change the name of an archive member.
.sp
It takes a little longer than usual to extract archive members with
the "-p" option when standard output is connected directly to the
terminal.
.sa
cat (1),
.ul
Software Tools
