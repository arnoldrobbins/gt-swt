[cc]mc |
.hd at$swt "Subsystem interlude to Primos ATCH$$" 08/30/84
[cc]mc
subroutine at$swt (name, namel, ldisk, passwd, key, code)
character name (MAXPATH)
packed_char passwd (3)
integer namel, ldisk, key, code
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'At$swt' is the Subsystem interlude to the Primos ATCH$$ subroutine.
It allows the program to attach to another directory, and takes
the same arguments as ATCH$$.  If there is an error in trying
to reach the directory, 'at$swt' returns E$BPAS in 'code', instead of
leaving the user in Primos.
.sp
'Name' is the name of the directory to attach to, 'namel' is the
length of 'name', 'ldisk' is the number of the logical disk to
be searched to find the given directory, 'passwd' is the password
of the directory (the characters are packed two per word),
'key' is the composition of the 'REFERENCE' and
'SETHOME' subkeys (see the [ul Primos Subroutines Reference Guide],
PDR3621), and
'code' is an integer variable which contains the return code.
.im
'At$swt' first sets up an on-unit for the "BAD_PASSWORD$" condition
before it tries to call the Primos ATCH$$ routine.  It calls
that Primos routine with all of its arguments (which are not
processed in any way), and returns normally if there was no error
in attaching to the directory.  Any errors cause an error message
to be issued and control is returned to the calling procedure.
.am
code
.ca
Primos atch$$, Primos mkonu$, Primos pl1$nl
[cc]mc |
.bu
Should be converted to use the new Primos 'at$?*' routines.
[cc]mc
.sa
follow (2), getto (2), tscan$ (6), Primos atch$$
