.hd geta$f "fetch arguments for a Fortran program" 02/24/82
integer function geta$f (ap, str, len)
integer ap, len
character str (*)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Geta$f' fetches an argument from the Subsystem command
line in a format useable by a Fortran program.
The arguments are analogous to those used by 'getarg'.
'Ap' is the number of the argument to be fetched:
0 for the command name, 1 for the first argument, 2 for
the second, etc.  'Str' is a string to receive the argument,
while 'len' is the number of characters allocated to 'str'.
The function return value is either the length of the argument
string actually returned, or EOF (-1) if there is no
argument in that position.
.im
'Geta$f' simply calls 'getarg' with the argument pointer,
and then calls 'ctop' to convert the result into the proper
Fortran format.
.am
str
.ca
ctop (2), getarg (2)
.bu
If 'len' is an odd number, 'geta$f' will return at most
'len - 1' characters of an argument.
.sa
getarg (2), geta$plg (2), geta$p (2)
