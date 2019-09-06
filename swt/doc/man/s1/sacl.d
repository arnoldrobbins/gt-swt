[cc]mc |
.hd sacl "set ACL attributes on an object" 09/05/84
sacl <pathname>
sacl <pathname> {<access pairs>} [-l <pathname>]
sacl <pathname> -a <access category>
.ds
'Sacl' is a command to manipulate Primos ACL's (Access Control Lists).
It may be used to change the access to an object, create an
access category, add an item to an access category, or delete
an access control list.
.sp
An access control list is a set of pairs of names and associated
access rights. Each access pair has the following syntax:
.ta 25
.sp
.nf
[tc]<name1> := <name2>
[tc][bl]     - or -
[tc]<name> <op> <rights>
.sp
.fi
Each <name> is either a user name (eg., "system" or "netman"), the
name of an accounting group (eg., ".lab" or ".system_staff"), or
the special identifier "$rest" indicating everyone not otherwise named.
The first form of ACL shown above indicates that the rights for <name1>
should be set to exactly the same rights as for <name2>.
In the second form of ACL pair, <op> is either the symbol "+=", "-=",
or "="; "+=" means to add the indicated rights, "-=" means to
remove the indicated rights, and "=" means to set the rights to the
indicated permissions.
.sp
The <rights> argument consists of either a keyword or symbol, or some
combination of letters indicating an access right. Each of the letters
and their corresponding rights is as follows:
.sp
.in +5
[bf a] -- corresponds to "add" access, that is, the right to create
a new file within a directory.  Note that once the file is created,
the user creating the file can have full read/write access until the
first time the file is closed.  At that point, the other protections
determine access.
.sp
[bf d] -- corresponds to "delete" access.  This access simply
allows the user to delete files within a directory.  "d" access
has no meaning when applied to individual files.
.sp
[bf l] -- corresponds to "list" access, which is the ability to
list the contents of a directory (as in the 'lf' command).
.sp
[bf p] -- corresponds to "protect" access, which is the ability to
set ACL's for objects within the directory.
.sp
[bf r] -- corresponds to "read" access, the ability to open a file
for reading or execute a file.
.sp
[bf u] -- corresponds to "use" access.  Use access means that a user
can 'cd' to a command or open a file inferior to the named
directory.  As example, to open the file /disk1/system/lab/foobar,
the user must have (at least) "u" access to the directories
"system" and "lab", as well as "r" and/or "w" access to the file
"foobar".
.sp
[bf w] -- corresponds to "write" access. This means that the user
has the ability to write to or truncate a file.
.sp
.in -5
Thus, to add "read" and "write" access to a file for user "waldo",
the ACL pair "waldo+=wr" could be used, as could "waldo+=rw".
.sp
Some special symbols and keywords are recognized by the 'sacl' command.
These are:
.sp
.in +5
[bf $all] -- corresponds to "adlpruw"
.sp
[bf *] -- same as "$all"; "adlpruw" rights
.sp
[bf $none] -- confers no rights whatsoever
.sp
[bf 0] -- same as "$none"
.sp
[bf $owner] -- all rights except protect: "adlruw"
.sp
[bf $read] -- "lru"
.sp
[bf $use] -- "alru"
.sp
[bf $default] -- same rights as currently belong to "$rest"
.sp
[bf $def] -- same as "$default"
.sp
[bf ?] -- same as "$default"
.sp
.in -5
Also associated with the concept of ACL is the [ul type] of the
ACL.  There are basically 5 types of ACL.  The first type is
a specific ACL which confers protection on one specific file.
The second type of ACL is the default specific ACL which is a specific
ACL set on an ancestor of the object; if an object is not protected
by a specific ACL or an acat, it is protected by a default ACL --
the same ACL which protects its parent.
.sp
The third type of ACL is the access category, or "acat". An acat is
an ACL which may protect many objects with the same access rights.
An acat appears to be a file that cannot be read or written, and its
name must end in the 5 character sequence ".acat".  An acat need not
currently protect any files or directories; its existence is
independent of other objects, unlike a specific ACL.
.sp
The fourth
type of ACL is the default acat, which is similar in nature to
the default specific ACL.
.sp
The fifth type of ACL is a priority ACL.  This is an ACL set on an entire
disk partition by the system administrator.  Rights confered by a priority
override rights confered by an ACL of any of the other four types.
Priority ACLs cannot be set with this command.
To set a priority ACL, use the Primos 'spacl' command.
.sp
"Sacl <pathname>" reverts the object to default protection; if
<pathname> is an acat, it is deleted. The "-a" option adds the
object to the named acat. The "-l" option is a "like" option;
access rights for the object are the combination of the rights
on the object specified with the "-l" option along with the given
access pairs.  In the second and third form, if <pathname>
ends in ".acat" then an access category is created with the indicated
rights.
.es
sacl text harold=$read maude:=harold .staff+=r $rest=$none
.sp
sacl comm.acat .staff+=* .hackers-=w -l =lbin=
.sp
sacl text
.me
"Usage: sacl <pathname> [<acl list>] [-l <pathname> | -a <acat>]"
for incorrect usage.
.sp
"Cannot set ACL as specified."
if the object is unreachable or the user does not have "p" access.
.sp
"Object specified after the "-a" is not an acat."
if the name of the object after the "-a" option is not a valid
acat name.
.bu
Access categories must end in ".acat". This is not consistent with
standard Subsystem naming conventions,
but is consistent with Primos standard naming conventions.
.sa
lf (1), lacl (1), sfdata (2), parsa$ (6)
[cc]mc
