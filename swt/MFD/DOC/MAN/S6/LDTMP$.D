.hd ldtmp$ "load the per-user template area" 01/22/82
subroutine ldtmp$
.sp
Library:  vswtlb (standard Subsystem library)
.fs
Using the public template "=utemplate=" to locate the
user's private template file, 'ldtmp$' reloads the hash table
in the Subsystem common area that contains the private templates.
.im
'Ldtmp$' first zeroes the private template area, so the reference
to "=utemplate=" will be to the public template.  It then
opens "=utemplate=", parses the lines with 'gtemp' and fills
in the hash table.
.ca
close, getlin, gtemp, open, Primos break$, length, print, seterr, scopy
.sa
expand (2)
