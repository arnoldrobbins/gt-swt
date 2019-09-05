[cc]mc |
.hd sprot$ "set protection attributes for a file" 07/04/83
[cc]mc
integer function sprot$ (name, attr)
character name (ARB), attr (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Sprot$' is used to set the protection attributes (read, write, truncate)
for a given file.
Both owner and nonowner attributes, specified in convenient notation,
may be set on a single call.
.sp
The first argument is the full pathname of the file whose protection
attributes are to be changed.
The name must be in the usual Subsystem format in an EOS-terminated
string.
.sp
The second argument is a protection attribute specification string.
Each attribute (read, write, truncate) is represented by a single
letter ("r", "w", and "t", respectively).
In addition, the letter "a" indicates all attributes;
it is equivalent to "twr".
In the specification string, owner protection attributes appear
first, followed by a slash and nonowner protection attributes.
[cc]mc |
If no permissions are to be confered to nonowners, the slash
[cc]mc
may be omitted.
If all attributes are omitted, neither owners nor nonowners may
access the named file in any way.
Examples: "a/r" confers all permissions for owners, read-only for
nonowners; "rw/rw" confers read/write permission for everyone,
"/w" confers write permission for nonowners and no permission
for owners.
.sp
The function return is OK if the attempt to set protection attributes
succeeded, ERR otherwise.
The error condition is returned if (1) the 'attr' string contains an
illegal protection key; (2) the named file could not be reached;
(3) Primos returns an error code during the attempt to set the
file's attributes.
.im
Protection keys in the form of two three-bit strings in the
UFD entry for a file are maintained by the Primos routine
SATR$$.
'Sprot$' first scans the protection attributes string, building
a bit-string representation of the attributes as it goes.
A call to 'getto' then sets the current directory to the parent
of the named file.
SATR$$ is then invoked to set the file's protection attributes.
[cc]mc |
Finally, the Primos routine AT$HOM is used to attach back
[cc]mc
to the home directory.
.ca
[cc]mc |
getto, index, Primos at$hom, Primos satr$$
[cc]mc
.sa
follow (2), getto (2), chat (1), lf (1)
