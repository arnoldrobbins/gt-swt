.hd passwd "change directory non-owner password" 01/15/83
passwd [-s[<depth>]] <non-owner pwd> { <pathname> }
.ds
'Passwd' is used to change the non-owner password of one or more
directories (UFDs) in the file system.
<Non-owner pwd> may consist of up to six characters;
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
The "-s" option, if specified, causes 'passwd' to traverse the
file system subtree rooted in the named directory, changing
the non-owner password of each directory it encounters.  The depth
of this traversal may be limited by appending a positive integer
to the "-s" (e.g., "-s3").
.sp
Specifying no <pathname> arguments is the same as specifying
the pathname of the current directory.
.es
passwd "" =mail=
passwd ""
passwd secret =src= =src=/lib
passwd -s xyzzy =aux=
.me
.in +5
.ti -5
"Usage: passwd ..." for bad argument syntax.
.ti -5
"password too long" for illegal <non-owner pwd>.
.ti -5
"<pathname>: can't change password" for not being owner of <pathname>.
.ti -5
"<pathname>: bad pathname" for not being able to access the directory
containing <pathname>.
.in -5
.bu
In a standard Primos environment, 'passwd' sets the
owner password to spaces when it changes the non-owner password.
.sa
[cc]mc |
cd (1), chat (1), sacl (1), chown (3), Primos spas$$
[cc]mc
