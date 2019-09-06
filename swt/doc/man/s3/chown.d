[cc]mc |
.hd chown "change directory ownership" 08/28/84
[cc]mc
chown [-s[<depth>]] <owner> { <pathname> }
.ds
'Chown' is used to change the owner password of one or more
directories (UFDs) in the file system.
<owner> may consist of up to six characters;
shorter strings are padded with blanks, and lower-case letters
are converted to upper-case.
.sp
In order to use
this command successfully, one must be able to attach to
the named directories with owner privileges.  In a standard
Primos environment, this means the current owner password
must be included in the pathname for each specified directory.
In a Ga. Tech Primos environment, this means that the user must
currently own the specified directories, or they must be public.
.sp
The "-s" option, if specified, causes 'chown' to traverse the
file system subtree rooted in the named directory, changing
the owner password of each directory it encounters.  The depth
of this traversal may be limited by appending a positive integer
to the "-s" (e.g., "-s3").
.sp
Specifying no <pathname> arguments is the same as specifying
the pathname of the current directory.
.es
chown "" =mail=
chown ""
chown system =src= =src=/lib
chown -s system =aux=
.me
.in +5
.ti -5
"Usage: chown ..." for bad argument syntax.
.ti -5
"owner name too long" for illegal <owner>.
.ti -5
"<pathname>: can't change owner" for not being owner of <pathname>.
.ti -5
"<pathname>: bad pathname" for not being able to access the directory
containing <pathname>.
.in -5
.bu
In a standard Primos environment, 'chown' sets the
non-owner password to zeros when it changes the owner password.
.sa
[cc]mc |
cd (1), chat (1), lacl (1), sacl (1), passwd (3), Primos spas$$
[cc]mc
