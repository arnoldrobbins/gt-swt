.hd macro "macro language from Software Tools" 01/16/83
macro [-e]
.ds
'Macro' is Kernighan and Plauger's macro preprocessor from Chapter 8
of [ul Software Tools].  'Macro' is an exceedingly powerful
program; it is theoretically possible to use it as a general programming
system.  A complete description of its capability is beyond the
scope of this document, but a few samples are presented here to help
the user become proficient in its usage.
.sp
'Macro' is a filter; it takes input from its standard input file,
expands all macros it encounters, and places the output on its standard
output file.  This behavior strongly encourages its use in pipelines.
.sp
The basic format of a macro definition is:
.sp
   define(macro-name, replacement-text)
.sp
"Macro-name" is an identifier, i.e. a sequence of letters or digits
beginning with a letter.  "replacement-text" is a (possibly empty)
sequence of characters, which may be specially interpreted by 'macro'.
.sp
The "-e" option allows for the escaping of characters that "macro'
would normally use as delimiters (e.g. commas, right parenthesis, etc.).
To escape a character, it must be preceded by the escape character
"@". 'Macro' discards the escape character and treats the escaped
character as a normal character with no special meaning. Since 'macro'
discards the escape character, in order to get a literal "@" it
must be escaped ("@@@").
.sp
Macro arguments are referred to by a construct of the form "$<integer>"
in the replacement text.  The <integer> must be a digit from 0 to 9,
inclusive.  (Digits 1-9 represent the first through the ninth arguments;
digit 0 represents the name of the macro itself).
For example, the following macro could be used to skip blanks and tabs
in a string, starting at a given position:
.sp
   define(skipbl,
      while ($1 ($2) == ' 'c | $1 ($2) == TAB)
         $2 = $2 + 1
      )
.sp
Here are a few examples of the use of this macro:
.sp
   skipbl(line, i)
   skipbl(str, j)
.sp
In order to prevent premature evaluation of a string, the string may be
surrounded by square brackets.  For example, suppose we wished to redefine
an identifier.  The following sequence will not work:
.sp
   define(x,y)
   define(x,z)
.sp
This is because "x" in the second definition will be replaced by "y",
with the net result of defining "y" to be "z".  The correct method is
.sp
   define(x,y)
   define([x],z)
.sp
The square brackets prevent the premature evaluation of "x".
.sp
'Macro' provides several "built-in" functions. These are given below:
.sp
.in +6
.ti -3
.nf
divert(filename) or divert(filename,append) or divert
.fi
"Filename" is opened for output and its file descriptor is stacked.
Whenever 'macro' produces output, it is directed to the named file.
If the second argument is present, output is appended to the named
file, rather than overwriting it.
If both arguments are missing, the current output file is closed and
output reverts to the last active file.
.sp
.ti -3
dnl or dnl(commentary information)
.br
As suggested by Kernighan and Plauger, 'dnl' may be used to
delete all blanks and tabs up to the next NEWLINE, and the NEWLINE
itself, from the input stream.
There is no other way to prevent the NEWLINE after each 'define'
from being passed to the output.
Any arguments present are ignored, thus allowing 'dnl' to be used
to introduce comments.
.sp
.ti -3
ifelse(a,b,c,d)
.br
If "a" and "b" are the same string, then "c" is the value
of the expression; otherwise, "d" is the value of the expression.
Example: this macro
returns "OK" if i is defined to be "1", "ERR" otherwise:
.ti +3
define(status,ifelse(i,1,OK,ERR))
.sp
.ti -3
include(filename)
.br
"Filename" is opened and its file descriptor is stacked.
The next time 'macro' requests input, it receives input from the
named file.
When end-of-file is seen, 'macro' reverts to the last active input
file (the one containing the last include) and picks up where it left
off.
.sp
.ti -3
incr(n)
.br
increment the value of the integer represented by "n", and return the
incremented value.  For instance, the following pair of defines
set MAXCARD to 80 and MAXLINE to 81:
.ti +3
define(MAXCARD,80)
.ti +3
define(MAXLINE,incr(MAXCARD))
.sp
.ti -3
substr(s,m,n)
.br
return a substring of string "s" starting at position "m"
with length "n".
substr(abc,1,2) is ab; substr(abc,2,1) is b; substr(abc,4,1) is
empty.  If "n" is omitted, the rest of the string is used:
substr(abc,2) is bc.
.sp
.ti -3
undefine(name)
.br
'Undefine' is used to remove the definition associated with a name.
Note that the name should be surrounded by brackets, if it is supplied
as a literal, otherwise it will be evaluated before it can be
undefined.
Example: undefine([x]),  undefine([substr])
.sp 2
.in -6
.es
See [ul Software Tools].
.fl
None used by 'macro' itself; the builtins 'include' and 'divert'
may be used for limited file manipulation.
.me
Extensive.   See [ul Software Tools].
.bu
Blanks are not allowed between the macro name and its argument list.
.sa
rp (1), include (1), [ul Software Tools]
