.hd geta$plg "fetch arguments for a PL/I G program" 02/24/82
geta$plg:   procedure (ap, str, len) returns (fixed);
   declare
      ap    fixed,
      str   character (128) varying,
      len   fixed;
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Geta$plg' fetches an argument from the Subsystem command
line in a format useable by a PL/I G (or PL/P) program.
The arguments are analogous to those used by 'getarg'.
'Ap' is the number of the argument to be fetched:
0 for the command name, 1 for the first argument, 2 for
the second, etc.  'Str' is a string to receive the argument,
while 'len' is the number of characters allocated to 'str'.
The function return value is either the length of the argument
string actually returned, or EOF (-1) if there is no
argument in that position.

To use 'geta$plg', it must be declared in the PL/I program:

.nf
   declare
      geta$plg entry (fixed, char (128) var, fixed)
                     returns (fixed)
.fi

It may then be called as a function wherever desired.
.im
'Geta$plg' simply calls 'getarg' with the argument pointer,
and then calls 'ctov' to convert the result into the proper
PL/I format.
.am
str
.ca
ctov (2), getarg (2)
.bu
If 'len' is an odd number, 'geta$plg' will return at most
'len - 1' characters of an argument.
.sa
getarg (2), geta$f (2), geta$p (2)
