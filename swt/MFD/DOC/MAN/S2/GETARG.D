.hd getarg "fetch command line arguments" 03/23/80
integer function getarg (n, arg, arg_len)
integer n, arg_len
character arg (arg_len)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getarg' is used to retrieve the arguments supplied
on the command line that invoked a program.  The first argument is the ordinal
of the command argument to be fetched: 1 for the first, 2 for the second, etc.
The second argument is a string to receive the command argument being fetched;
the third argument is the maximum length of the string.  The function return
from 'getarg' is the length of the command argument fetched, if the fetch was
successful; EOF if the argument could not be fetched.
Argument 0 is the name of the command calling 'getarg'.
.im
The Subsystem command interpreter maintains the list of command
arguments in its linked-string storage area.
'Getarg' uses the array of pointers into this area supplied by the
command interpreter to locate the desired argument, then copies
the characters to the user's buffer one-by-one.
.am
arg
.bu
A program can have at most 256 arguments.  There is no convenient way to
find out how many arguments have been supplied on an invocation without
searching through the entire list with calls to 'getarg'.
.sa
chkarg (2), getkwd (2)
