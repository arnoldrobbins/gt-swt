[cc]mc |
.hd del "delete files" 08/30/84
[cc]mc
.nf
del { -<opt>{<opt>} } { -n | <path> }
   <opt>    ::=   d | f | s[<depth>] | v
   <depth>  ::=   [ <positive integer> ]
.fi
.ds
'Del' is a general purpose file deleter.  When invoked with a
list of one or more pathnames as arguments, it attempts to
remove each file named.  The list of pathnames may be preceded
by zero or more control arguments, each consisting of a hyphen, followed
by one or more of the following letters:
.in +10
.ta 6
.tc \
.sp
.ti -5
[cc]mc |
-d\when specified in combination with the "s" option (see below),
[cc]mc
this option causes 'del' to delete a UFD named as an argument
after having deleted its contents.  (Normally, 'del' deletes
the UFD's contents and leaves the UFD itself intact.)
.sp
.ti -5
[cc]mc |
-f\when specified, causes 'del' to attempt to manipulate the protection
[cc]mc
attributes of each file that it is about to delete to insure that
the file is, in fact, deletable.
Note, however, that this can only be done when the file resides
[cc]mc |
in a directory that is public, owned by the user of 'del', or protected
with an acl so that the user has protect privileges (ie - can change
the acl protection on the object). For objects in password directories,
the protection bits are modified to give the user all privileges as an
owner. For ACL protected objects, the protecting object is modified
to give the user "delete", "list", and "use" privileges.
.sp
.ti -5
-s\when specified, causes 'del' to traverse the subtree of the file system
[cc]mc
descending from a UFD or segment directory named as an argument,
attempting to delete each file it finds along the way.
If a decimal number immediately follows the "s", then 'del'
will descend to no more than that many levels below the named
directory in its traversal.
This option requires at least one of the arguments <path> or "-n" be
specified (since directories must be deleted by name).
Normally, when the named directory is a UFD, the directory itself is
not deleted -- only its contents are.  But if the "d" option (see above)
is specified, the UFD too will be deleted.
Users are exhorted to USE THIS OPTION WITH UTMOST CAUTION.
.sp
.ti -5
[cc]mc |
-v\when specified, 'del' will print the pathname of each file
[cc]mc
before attempting to delete it, and will wait for a one-line response
from the user.  Only if the line begins with a "Y" or a
"y" will the file be deleted; otherwise, the file will be left intact.
.in -10
.sp
If the string "-n" appears in the place of a <path> argument,
'del' will read arguments from its first standard input port
until end-of-file is encountered.  It is assumed that each
line to be read contains a single path name, starting in column 1.
.es
del lkj
del -dfs segdir subufd
del -vs1
[cc]mc |
del -s [cd -p]
[cc]mc
files %junk | del -n
.me
.in +5
.ti -5
"Usage: del ..." for bad arguments
.ti -5
"<path>: in use" for files open by other users
.ti -5
"<path>: protected" for undeletable files
.ti -5
"<path>: not found" for non-existent files
.ti -5
[cc]mc |
"<path>: delete protected" for files with delete protection turned on
.ti -5
[cc]mc
"<path>: can't delete" for unexpected file system error
.ti -5
"<path>: can't attach" for pathnames that can't be followed
.ti -5
"<path>: directory not empty" for trying to delete a non-empty directory
.ti -5
"<path>: directories nested too deeply" when directories are nested
more deeply that 'del' can handle
.ti -5
"<path>: error reading directory" for unexpected error in reading a
segment directory
.ti -5
"<path>: bad pathname" for non-existent files
.ti -5
"delete current directory by name only" when no arguments are given
.in -5
[cc]mc |
.bu
When deleting an ACL directory with the "-d" and "-f" option, if the
top level directory cannot be deleted, the ACL protection attributes
may be left changed.
.sp
A file cannot be deleted with the force option if there is more than
one level of protection between the object to be deleted and the
object protecting it. For example, if a file is protected by a
directory which is protected by an access category then specifying
the "-f" option when attempting to delete the file will not work.
[cc]mc
.sa
[cc]mc |
cp (1), lf (1), mkdir (1), sacl (1), remove (2), create (2),
gfdata (2), sfdata (2), sprot$ (6)
[cc]mc
