[cc]mc |
.hd ssr "set search rule" 08/27/84
[cc]mc
ssr [ <new search rule> ]
.ds
The 'ssr' command allows users of the Subsystem shell
to specify which directories and command libraries should be searched
in the process of invoking a command.  If an argument is specified,
it becomes the new search rule; if not, the search rule remains
unchanged.  In either case, the resulting search rule is printed.
.sp
The search rule consists of a string of 'elements' separated by
commas.
Each element is a template that specifies either a special command
library or a directory to be searched.
In the process of invoking a command, the shell
examines each element in the search rule from left to right.
In each element, it replaces all ampersands ("&") with the command
name specified by the user.  It then searches for a command
by that name.
The shell keeps examining elements of the search rule until
a command is located or the end of the search rule is reached.
.sp
For example, the default search rule,
.sp
.ti +5
'^int,^var,&,=lbin=/&,=bin=/&'
.sp
specifies the following directories and libraries:
.sp
.in +15
.tc \
.ta 11
.ti -10
^int\Internal commands - those commands recognized
and executed by the shell itself.
.sp
.ti -10
^var\Shell variables - the effect of 'executing' a
variable is to print the value of the variable
on standard output 1.
.sp
.ti -10
&\A single ampersand
specifies the current working directory.
.sp
.ti -10
=lbin=/&\The directory '//lbin', where locally-supported
commands are stored.
.sp
.ti -10
=bin=/&\The directory '//bin', where standard Subsystem commands reside.
Note that the trailing slash and ampersand MUST
be included in the search rule.
.sp
.in -15
[cc]mc |
.# WARNING: the search rule syntax described herein is temporary
.# and subject to future modification.
.# As of 8/27/84, the syntax hadn't changed in over 4 years (from 3/20/80)
.# I think it is safe to delete this warning.
[cc]mc
.es
ssr
ssr "^var,^int,&,//newshbin/&,//newbin/&"
ssr "^var,//project_lib/&"
.sa
set (1),  declare (1),  forget (1),  vars (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
