[cc]mc |
.hd sfdata "set characteristics for a file" 09/04/84
integer function sfdata (key, pathname, infbuf, attach, aux)
integer key, attach
untyped infbuf, aux
character pathname (ARB)
.sp
Library: vswtlb (standard Subsystem library)
.fs
This functions sets information for a file system entry according to
the value of the parameter 'key'. There are currently nine declarations
for the values of 'key' in the standard SWT definitions. Their names
and actions are:
.sp
.in +6
.ti -4
FILE_UFDQUOTA -- This key sets quota information on a given directory.
The object named in 'pathname' must be a directory. 'Infbuf' is a
long integer value that is the maximum number of records that may
be used under the given directory. If there already exist more records
under the directory than this value, the quota is still set but no more
may be used until enough records to reduce the number below this value
are deleted. 'Aux' is not used.
.sp
.ti -4
FILE_DMBITS -- This key sets the dumped bit on the specified file
object. 'Aux' is not used.
.sp
.ti -4
FILE_RWLOCK -- This key sets the read/write lock according to the
string in 'infbuf'. 'Aux' is not used.
Legal values for 'infbuf' are:
.sp
.in +5
.nf
"n-1" - The lock is set to N readers or 1 writer.
"n+1" - The lock is set to N readers and 1 writer.
"n+n" - The lock is set to N readers and N writers.
"sys" - The lock is set to the current system default.
.fi
.in -5
.sp
.ti -4
FILE_TIMMOD -- This key sets the modification date and time according
to the values in 'infbuf'. 'Infbuf' is an array of 6 integers
containing the year, month, day, hours, minutes, and seconds,
respectively, to which to set the file modification date and time.
.sp
.ti -4
FILE_ACL -- This key sets the ACL attributes for the given file object.
The attributes are set according to the strings contained in 'infbuf'
and 'aux', which are the same format as used in 'sacl' and 'lacl'.
If 'infbuf' and 'aux' are both empty (i.e. - contain only an EOS),
'pathname' is default protected if it is a normal file object or deleted
if it is an access category. If 'infbuf' is empty and 'aux' is an
existing file object, 'pathname' will be protected like 'aux' if 'aux'
is a normal file object and protected by 'aux' if 'aux' is an access
category. If 'aux' is empty then 'pathname's protections will be
modified according to 'infbuf'. If 'aux' and 'infbuf' are specified,
the protections for the file 'aux' will be obtained and altered by
the specifications in 'infbuf' and placed on the file 'pathname'.
The file protections for 'aux' are not modified.
.sp
.ti -4
FILE_PRIORITYACL -- This key sets the priority ACL attributes for the
partition named in 'infbuf'. If 'aux' is empty, the current priority
ACL is deleted, otherwise the acl is set to the contents of 'aux'.
.sp
.ti -4
FILE_DELSWITCH -- This key controls the setting of the delete protect
switch on the file 'pathname'. 'Infbuf' is an integer that contains
YES to set the protection switch, or NO to turn it off.
.sp
.ti -4
FILE_PROTECTION -- This key controls the setting of the password
protection bits according to the string in 'infbuf'. Protection
bits are read, write, and truncate, represented by the characters
'r', 'w', and 't', respectively. In addition, the letter 'a'
represents the string "trw" or all permissions. 'Infbuf' contains
a string of owner permissions followed by a '/' and a string of
non-owner permissions. The '/' may be omitted if no non-owner
permissions are to be granted.
.sp
.ti -4
FILE_PASSWORDS -- This key sets the owner and non-owner passwords
of the directory 'pathname' to the value of 'infbuf' and 'aux',
respectively.
.in -6
.sp
'Pathname' is any standard EOS-terminated pathname, and may contain
templates. The function value is OK if the subroutine was successful
and ERR otherwise. ERR may indicate the file does not exist, the
caller does not have the necessary permissions, or any of the numerous
file system errors possible.
.sp
The "attach" key is the same as in the 'getto' function; it indicates
if the directory attach point had to be changed to get to the file entry
being examined.
.im
The function resets the subsystem error code and expands the templates.
If the directory attach point needs to be changed, 'getto' is called
and the attach switch is saved. Then the information is setup and the
appropriate Primos subroutines are called to make the file system
changes.
.am
attach
.ca
ctoc (2), ctop (2), ctov (2), equal (2), expand (2), follow (2),
gtacl$ (6), index (2), mktr$ (2), mapstr (2), parsa$ (6),
Primos ac$cat, Primos ac$dft, Primos ac$lik, Primos ac$set,
Primos at$hom, Primos cat$dl, Primos pa$del, Primos pa$set,
Primos q$set, Primos satr$$
.sa
chat (1), lacl (1), lf (1), sacl (1), gfdata (2)
[cc]mc
