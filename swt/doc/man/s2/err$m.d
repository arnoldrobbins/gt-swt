[cc]mc |
.hd err$m "common error condition handler for math routines" 04/27/83
subroutine err$m (ptr_to_cfh)
pointer ptr_to_cfh
.sp
Library: vswtmath (Subsystem mathematical library)
.fs
The 'err$m' procedure is provided as a default  handler
for the SWT_MATH_ERROR$ condition.
It takes a single argument, a 2 word pointer as defined by the
condition mechanism, and prints information about the routine
and values which signalled the fault.  All output from the
'err$m' routine is sent to ERROUT.  Included in the output
is the name of the faulting routine, the location from which
the faulting routine was called, the value of the argument
involved, and the default return value to be used.
.sp
The Primos MKON$F routine can be used to set up this on-unit handler
in Ratfor and Fortran 66 programs.  The Primos subroutine MKON$P
can be used in Fortran 77 and PL/P programs.
.sp
The user may wish to copy and modify the source code for the 'err$m'
procedure so as to provide a more specific form of error handling.
If this is done, it would probably be a good idea to rename the
user's version to something other than 'err$m.'
.ca
print
.sa
Primos mkon$f, Primos mkon$p, Primos signl$,
.br
.ul
SWT Math Library User's Guide
[cc]mc
