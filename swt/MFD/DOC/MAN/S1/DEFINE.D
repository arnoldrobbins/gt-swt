[cc]mc |
.hd define "define expander" 08/27/84
define [-(f | m)] {<input_file>}
[cc]mc
.ds
'Define' is a text substitution facility used to replace
defined identifiers by their definitions.
'Define' takes the file(s) specified in the argument list,
processes [bf define] statements and [bf undefine] statements,
and places the output on its standard
output file. 'Define' also processes [bf include] statements.
For more information on [bf define] and [bf undefine] statements
see the [ul Ratfor Programmer's Guide].
.sp
In addition to the way that Ratfor handles the 'define' statement,
this processor will allow the user to prevent premature evaluation
of a given string by enclosing it in brackets, similar to 'macro'
(please see the Reference Manual entry for the 'macro' command).
.sp
The following options are available:
.sp
.in +10
.ta 6
.tc \
.ti -5
[cc]mc |
-f\Suppress automatic inclusion of standard definitions file.
[cc]mc
Macro definitions for the manifest constants used throughout
the Subsystem reside in the file "=incl=/swt_def.r.i".
'Define' will process these definitions automatically, unless the
"-f" option is specified.
.sp
.ti -5
[cc]mc |
-m\Map all identifiers to lower case.
[cc]mc
When this option is selected, 'define' considers the upper case letters
equivalent to the corresponding lower case letters,
except inside quoted strings.
.sp
.in -10
The remainder of the command line is used to specify the names
of the input file(s). If no input file is specified, 'define'
will expect input from standard input. Output will be sent to
standard output.
.es
define file1.r
file> define -f
define -m file1 file2 file3
.fl
=incl=/swt_def.r.i for standard Subsystem macro definitions
.me
"missing left paren in define"
.br
"non-alphanumeric name in define"
.br
"missing right paren in define"
.br
"missing parameter in definition"
.br
.ti +5
(two commas in a row)
.br
"non-numeric parameter not allowed"
.br
"too many parameters"
.br
.ti +5
(more than 32 parameters)
.br
"missing comma in parameter list"
.br
"missing comma in parameter list"
.br
.ti +5
(no comma between the parameter list or the name and the definition)
.br
"invalid file name in include"
.br
"includes nested too deeply"
.br
.ti +5
(more than five levels deep)
.br
"can't  open include file"
.br
"definition too long"
.br
.ti +5
(more then 400 characters long)
.br
"missing right paren after definition"
.br
"missing left paren after undefine"
.br
"non-alphanumeric name in undefine"
.br
"missing right paren after undefine"
.br
"line too long"
.br
"unexpected EOF"
.sa
macro (1), rp (1),
.ul
Ratfor Programmer's Guide
