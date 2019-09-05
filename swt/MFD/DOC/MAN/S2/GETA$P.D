.hd geta$p "fetch arguments for a Pascal program" 02/24/82
type string128 = array [1..128] of char;
function geta$p (    ap:  integer;
                var str: string128;
                    len: integer) : integer;
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Geta$p' fetches an argument from the Subsystem command
line in a format useable by a Pascal program.
The arguments are analogous to those used by 'getarg'.
'Ap' is the number of the argument to be fetched:
0 for the command name, 1 for the first argument, 2 for
the second, etc.  'Str' is a string to receive the argument,
while 'len' is the number of characters allocated to 'str'.
The function return value is either the length of the argument
string actually returned, or EOF (-1) if there is no
argument in that position.

To use 'geta$p', it must be declared as a level 1 procedure
in the Pascal program:

.nf
function geta$p (    ap:  integer;
                var str: string128;
                    len: integer) : integer; extern;
.fi

It may then be called as a function wherever desired.
.im
'Geta$p' simply calls 'getarg' with the argument pointer,
and then calls 'ctop' to convert the result into the proper
Pascal format, after it has blank-filled 'str'.
.am
str
.ca
ctop (2), getarg (2)
.bu
If 'len' is an odd number, 'geta$p' will at most, return
'len - 1' characters of the argument.
.sa
getarg (2), geta$f (2), geta$plg (2)
