[cc]mc |
.hd vars "print, save, or restore shell variables" 08/27/84
[cc]mc
vars [ -{v | c | g | a | l} ] [-r [<file>] | -s [<file>]]
.ds
'Vars' can be used to print the names and values of all currently
defined shell variables, save the variables in a file, or restore
them from a file.
The options have meanings as follows:
.sp
.tc \
.ta 6
.in +10
.ti -5
[cc]mc |
-v\Values.  Print the value of each variable as well as its
[cc]mc
name.
.sp
.ti -5
[cc]mc |
-c\Columnar.  Print information in a single column, instead
[cc]mc
of across the  page (similar to the -c option of 'lf').
.sp
.ti -5
[cc]mc |
-g\Global.  Print names of all global variables, as well as
[cc]mc
those on the current nesting level.
.sp
.ti -5
[cc]mc |
-a\All.  Print names of all shell variables, on any nesting
[cc]mc
level, including those beginning with "_" (normally
reserved for use by the shell).
.sp
.ti -5
[cc]mc |
-l\Long.  Select options a, g, and v.
.sp
.ti -5
-s\Save.  Save shell variables.  If a file name is specified, variables
[cc]mc
and their values are saved in the given file; otherwise, the file
"=varsfile=" is used.
Only level 1 (global) variables are saved.
Listing of variable names and values still occurs.
.sp
.ti -5
[cc]mc |
-r\Restore.  Restore shell variables.  Variables and values from the
[cc]mc
named file (default "=varsfile=") are merged with the currently active
set of variables, at the current nesting level.
Listing of variable names and values still occurs.
.sp
.in -10
If no options are specified, 'vars' lists the names of all variables
active at the current nesting level in a multi-column format.
.sp
For more information on shell variables, see the 'set', 'declare' and
'forget' commands, or the
.ul
User's Guide for the Software Tools Subsystem Command Interpreter.
.es
vars
vars -vc
vars -l
vars -s
vars -s =varsdir=/environment
vars -r =varsdir=/environment
.bu
[cc]mc |
Should print the mnemonic form of the variable names.
[cc]mc
.sa
declare (1), forget (1), set (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
