.hd ldseg$ "load a SEG runfile into memory " 01/06/83
subroutine ldseg$ (rvec, name, len, code)
integer rvec (9), name (ARB), len, code
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ldseg$' first attempts to open the file 'name' in the current
directory, using 'len' as the length of the name.  If the
open is successful, and the file is a SEG run file of
recent (Primos revision 17 or later) origin, 'ldseg$' loads
the private segments of the file into memory and sets 'rvec'
to the initial save vector of the program.
If the load
is successful, 'ldseg$' returns a code of 0; otherwise, the
Primos error code E$BPAR is returned.
.im
'Ldseg$' first opens the segment directory and file 0 in
the directory.  Using calls to the Primos routine PRWF$$,
'ldseg$' reads and
checks the revision flag, segment map, segment bit map,
save vector, time vector, and symbol table.
Using this information, 'ldseg$' traverses the symbol
table, loading initialized chunks of segments with
calls to 'chunk$' and zeroing uninitialized segments with
calls to 'zmem$'.  Completely uninitialized segments
remain unmodified.  After loading is complete, 'ldseg$'
sets the values in 'rvec' and returns with a code of 0.
.am
rvec, code
.ca
chunk$, print, zmem$, Primos errpr$, Primos srch$$, Primos prwf$$
.sa
call$$ (6)
