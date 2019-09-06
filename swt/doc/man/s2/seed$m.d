[cc]mc |
.hd seed$m "set the seed for the rand$m random number generator" 04/27/83
subroutine seed$m (u)
untyped u
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'seed$m' procedure is used to reset the pseudo-random number
generator to a known state.  It is called with any 4 byte value
which is not equal to 32 bits of zero.  The seed can therefore
be 4 characters, a long pointer, a long integer, or a real number.
If the input is identical to zero then the SWT_MATH_ERROR$
condition is signalled.
The condition SWT_MATH_ERROR$ is signalled if there is an argument error.
An on-unit can be established to deal with this error; the SWT Math
Library contains a default handler named 'err$m' which the user may
utilize.
'Seed$m' does not return a value.
.im
Based on the structure of the 'rand$m' routine; see the source
for specific details.
.ca
Primos signl$
.sa
err$m (2), rand$m (2),
.br
.ul
SWT Math Library User's Guide
[cc]mc
