[cc]mc |
.hd lutemp "look up a template in the template directory" 09/15/83
[cc]mc
integer function lutemp (temp, str, strlen)
integer strlen
character temp (ARB), str (strlen)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
[cc]mc |
'Lutemp' converts a single template into its equivalent
[cc]mc
string representation.
The argument 'temp' is the template to be expanded;
[cc]mc |
'str' is the string to receive the expansion of at most 'strlen'
characters.
The function returns the length of the expanded string contained
[cc]mc
in 'str' if the template was found,
EOF otherwise.
.sp
Normally, the routine 'expand' would be called to expand a template,
since it rescans the text returned by 'lutemp' to evaluate
any nested templates.
.sp
[cc]mc |
The following dynamic templates are available:
[cc]mc
.sp
.in +15
.tc \
.ta 11
.ti -10
date\the current date, in form MMDDYY
.sp
.ti -10
time\the current time, in form HHMMSS
.sp
.ti -10
user\the login name of the user calling 'expand'
.sp
.ti -10
pid\the process id of the process calling 'expand'
.sp
.ti -10
passwd\the Subsystem password of the user calling 'expand'
.sp
.ti -10
day\the name of the current day of the week (e.g. tuesday)
.sp
[cc]mc |
.ti -10
home\the login directory of the user calling 'expand'
.sp
[cc]mc
.in -15
.nh
The statically-defined templates reside in the file
"=template=", and may be changed at the discretion of the
Subsystem manager.  For a complete list of templates,
see the [ul User's Guide to the Primos File System].
.sp
Users may create their own personal templates by placing template
names and replacement text in the file "=utemplate="
(nominally "=varsdir=/.template").
The template file is a standard text file which may be manipulated
by any of the usual text processing tools.
Each template appears on a line by itself, followed by blanks and
its replacement text.
Blank lines and comment lines (beginning with "#") may be added
to the template file to improve readability.
For an example of a template file, see =template=.
.hy
.im
[cc]mc |
'Lutemp' first looks up the requested template
in a hashed symbol table,
which contains the values of all "static"
(determined at Subsystem initialization time) templates and
resides in the shared Subsystem data area,
checking the user's personal templates and then the
system-defined templates.
If the search succeeds, 'lutemp'
returns the string value associated with the template.
Otherwise, 'lutemp' assumes that the template is dynamic
and searches a second shared hash table containing the values
of dynamic template.  If it finds the template in this table,
'lutemp' uses an associated function code value to direct appropriate
calls to 'date' (for time, date, day, pid, user) or
to file system routines (for home),
or to read values from Subsystem common areas (for passwd).
[cc]mc
.am
str
.ca
[cc]mc |
equal, date, gcdir$, length, mapstr, scopy, Primos at$hom,
Primos at$or
[cc]mc
.bu
There is no protection against setting static values for the
dynamic templates.  The user can possibly cause problems for
both himself and other Subsystem users by setting his own values
for the dynamic template names.
.sa
expand (2), open (2), getto (2), follow (2),
[ul User's Guide to the Primos File System]
