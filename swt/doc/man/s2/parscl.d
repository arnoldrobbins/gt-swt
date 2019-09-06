.hd parscl "parse command line arguments" 01/07/83
integer function parscl (str, buf)
character str (ARB), buf (MAXARGBUF)
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Parscl' is used to parse most standard Subsystem command line
formats automatically.
It examines the command line, parses it according to instructions
present in its arguments, and makes the result available to the
user for further processing.
This processing is normally done with the aid of a set of standard
Subsystem macros, described below.
All arguments handled by 'parscl' are deleted from the command
line, so any remaining special cases may be handled by the user.
.sp
The argument 'str' is a string describing the syntax of the command
line.
The argument 'buf' is a one-dimensional array of characters
normally declared with the standard Subsystem macro 'ARG_DECL'.
The function return is OK if the command line parsed successfully,
ERR if an illegal option was seen or a required parameter was missing.
.sp
'Parscl' handles several types of arguments.
"Flag" arguments are single-letter flags, preceded by a hyphen or dash,
that have no parameters and may be grouped together in a single
argument; for example, "-a" or "-acq".
Arguments with parameters may have a string or integer value following
the single-letter, or present in the next argument in the command
line.
For example, "-p1", "-p 1", "-nfilename", or "-n filename".
Parameters for such arguments may be optional or required.
Finally, some arguments may be ignored entirely, while others may
not be allowable at all.
.sp
The argument 'str' contains a specification of allowable arguments
and their types.
Each specification consists of an option letter (case is ignored)
followed by a type in angle brackets.
The following types are allowable: 'f' or 'flag' for flag arguments,
'ign' or 'ignored' for ignorable arguments, 'na' for arguments
that are not allowable, 'oi' or 'opt int' for arguments with an
optional integer parameter, 'os' or 'opt str' for arguments with
an optional string parameter, 'ri' or 'req int' for arguments with
a required integer parameter, and 'rs' or 'req str' for arguments
with a required string parameter.
For example, a command with the syntax
.sp
.nf
.ti +5
-u <integer> [-l <integer>] [-i [<string>]]
.sp
.fi
would pass the following string to 'parscl':
.sp
.nf
.ti +5
u<req int> l<req int> i<opt str>
.sp
.fi
Order of arguments on the command line is unimportant, as well
as the case of the option letter used.
.sp
The command line is typically parsed and then examined with
a number of standard Subsystem macros.
'ARG_DECL' is used to declare the buffer required by 'parscl'.
"PARSE_COMMAND_LINE(str,msg)" is used to invoke 'parscl';
'str' is passed to 'parscl' as its first argument, and 'msg'
is passed to 'error' to be printed if the command line could
not be parsed.
For example, one might use
.sp
.nf
.in +5
PARSE_COMMAND_LINE ("u<ri>l<ri>i<os>"s,
   "Usage:  cmd -u<upper> [-l<lower>] [-i[<file>]]"p)
.sp
.fi
.in -5
Once 'parscl' has been called in this manner, default values
for optional parameters may be supplied with 'ARG_DEFAULT_INT'
and 'ARG_DEFAULT_STR':
.sp
.nf
.in +5
ARG_DEFAULT_STR(i,"/dev/stdin1"s)
ARG_DEFAULT_INT(l, 1)
.sp
.fi
.in -5
One may test for the presence of an argument on the command line
with 'ARG_PRESENT', and retrieve argument values with
'ARG_VALUE' and 'ARG_TEXT':
.sp
.in +5
.nf
if (ARG_PRESENT (l))
   lower = ARG_VALUE (l)
else
   lower = 1
call ctoc (ARG_TEXT (i), filename, MAXLINE)
.sp
.in -5
.fi
Once as much as possible of this kind of argument parsing is
complete, the user may examine any remaining arguments by
fetching them with 'getarg'.
.im
'Parscl' scans the specification string and builds a 26 element
array.  Each element of the array corresponds to a letter A - Z
and contains an integer describing the type of argument expected
when that letter is encountered.
If an unrecognized argument type (in angle brackets) is
encountered, 'parscl' calls 'error' to print an error message.
.sp
Then 'parscl' scans the command line arguments, skipping those
that do not begin with a hyphen or have a letter as the
second character.  Arguments that begin with hyphens are
examined further.  If the letter in the second position of the
argument is to be
ignored, it is skipped.
Flag arguments are simply marked "present" in the argument buffer.
Values for string parameters are stored in the argument buffer for
later retrieval.
Values for integer parameters are converted with 'gctoi'
(thus allowing arbitrary radix representation) then stored in
the argument buffer.
.sp
So that variables can be used in the macro calls, the following
macros take an integer or variable containing
an integer in the range 1 to 26 rather than a letter:

.nf
     ARG_VALUE_I (<integer>)
     ARG_PRESENT_I (<integer>)
     ARG_DEFAULT_INT_I (<integer>, <string>)
     ARG_DEFAULT_STR_I (<integer>, <string>)
.fi
.ca
ctoc, delarg, error, gctoi, getarg, mapdn, putlin, strbsr
.am
buf
.sa
delarg (2), getarg (2), gfnarg (2)
