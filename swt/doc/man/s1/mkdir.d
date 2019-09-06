.hd mkdir "make a directory" 03/25/82
mkdir <pathname> [-o <owner>] [-n <non_owner>]
.ds
'Mkdir' is used to create a new directory.  The pathname given as the first
argument is the pathname of the directory; all nodes but the last must
exist prior to the invocation of 'mkdir'.
The "-o" and "-n" keyword arguments may be used to specify the
owner and non-owner passwords to be given to the new directory.
If they are omitted, default values are assumed as follows:
at installations running the Georgia Tech version of Primos,
the user's login name is used for the owner password and the
non-owner password is set to zero; at installations running unmodified
Primos, the owner password is set to blanks and the non-owner
password is set to zero.
.es
mkdir subsys
mkdir subdir -o allen
mkdir //may-78/twob -n secret
.me
.in +5
.ti -5
"Usage: mkdir ..." for missing directory name or bad arguments
.ti -5
"<pathname>: can't create" if directory already exists or
the path to it cannot be followed
.br
.in -5
.sa
lf (1), passwd (3), del (1)
