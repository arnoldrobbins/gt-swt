.hd filcpy "copy a file and its attributes" 03/06/82
integer function filcpy (from, to)
character from (ARB), to (ARB)
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Filcpy' is used to copy a file from one place to another,
insuring that the copy possesses the same attributes
(protection keys, time of last modification, read/write lock,
and dumped/modified bits) as the original.
.sp
The 'from' argument is the pathname of the source file;
the 'to' argument is the pathname of the destination.
The function return is OK if the copy succeeded, ERR otherwise.
.im
'Filcpy' obtains the 'from' files attributes with a call to the
[cc]mc |
Primos routine ENT$RD and then opens it with a call to the Primos
[cc]mc
routine SRCH$$.
An attempt is then made to open the 'to' file with the same type.
If the attempt fails, the 'to' file is removed and an error exit
occurs.
If the destination file is a non-empty segment directory, it is
then cleaned out with 'rmseg$'.
.sp
The file is copied by 'cpfil$' or 'cpseg$', if it is an ordinary
file or a segment directory, respectively.
If it is ordinary, it is truncated after the copy to insure
that no old data remains.
.sp
Several calls to the Primos routine SATR$$ are then made to set the
destination file's attributes.
.ca
[cc]mc |
getto, Primos srch$$, Primos ent$rd, ptoc, remove, rmseg$,
[cc]mc
cpseg$, cpfil$, Primos prwf$$, Primos satr$$
.sa
fcopy (2), cp (1)
