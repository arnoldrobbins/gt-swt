[cc]mc |
.hd pg "list a file in paginated form" 06/22/84
pg [-e] [-v] [-s <screensize>] [-m <message>] {<file_spec>}
[cc]mc
<file_spec> ::= <filename> | -[<stdin_number>] |
.ti +16
-n(<stdin_number> | <filename>)
.ds
[cc]mc |
'Pg' is a filter which displays the contents of a disk file in
paginated form.  It allows skipping pages forward and backward
as well as searching for patterns within the file.  'Pg' is primarily
intended for viewing a file on a high speed CRT, but it may be used
from any terminal.
.sp
'Pg' displays the named files (see 'cat' for further information on
<file spec>s) by calling the library routine 'page', which accepts
the following responses:
[cc]mc
.sp
.in +15
.ta 11
[cc]mc |
.tc ?
.ti -10
f <path>?Display the file whose pathname is <path>.
.ti -10
f?Redisplay the original file.
.ti -10
h?Print a command summary.
.ti -10
l<lines>?Set screen size to specified number of lines.
?Display starts over on page 1.
.ti -10
n?Proceed to next file (exit if on last file).
.ti -10
p<pages>?Display given number of pages (default 1),
prompting only after the end of the range.
.ti -10
q?Proceed to next file (exit if on last file).
.ti -10
x?Exit immediately from 'pg'.
.ti -10
y?Advance to the next page (proceed to next file
if on last page).
.ti -10
ctrl-c?Exit immediately from 'pg'.
.ti -10
newline?Advance to the next page (proceed to next file
if on last page).
.ti -10
<page>?Display specified page number.
.ti -10
-<pages>?Back up given number of pages (default 1).
.ti -10
^?Redisplay previous page.
.ti -10
.?Redisplay current page.
.ti -10
+<pages>?Advance given number of pages (default 1).
.ti -10
$?Display the last page.
.ti -10
/<pat>[/]?Display the next page containing <pat>.
.ti -10
\<pat>[\]?Display the previous page containing <pat>.
.sp
.in -15
.tc \
[cc]mc
The pattern <pat> is a regular expression with the full set of
options found in the editor.
The file is searched circularly from the current position for the
next page that contains the specified pattern.
[cc]mc |
As in the editor, the trailing delimiter is optional.
[cc]mc
(See [ul Introduction to the Software Tools Text Editor] in the
[ul Software Tools Subsystem User's Guide] for details.)
.sp
By default, 'pg' prompts after each page with a string of the form
[cc]mc |
.sp
.in +5
file [n+]?
.in -5
.sp
and after the last page with a string of the form
.sp
.in +5
file [n$]?
.in -5
.sp
if the '-e' command line argument is not specified.
"File" is the name of the file being displayed, and "n" is
the page number within the file.  If the '-e' argument is specified,
'pg' will not issue a prompt after the final page of a file, but
instead it proceeds to the next file in the argument list
(if any).
The '-m[bl]<message>' argument sequence may be used to specify
a prompt string different from the default; this
[cc]mc
string is used as both the intermediate and final prompt.
For details on how this string is interpreted, see the entry
for 'page' in section 2.
.sp
[cc]mc |
'Pg' normally displays each file using the 'vth' subroutine package
to manage the screen.  If the current terminal type is not one of
those that 'vth' supports, or if the '-v' argument is specified, then
'pg' displays each file using ordinary sequential output.
.sp
The user can inform 'pg' of the number of lines on his terminal screen
with the '-s <screensize>' command line argument.
If 'vth' output is used, 'pg' takes advantage of the fact that 'vth' knows
the size of the screen, and uses all available lines to display the file.
In this case the '-s' argument is ignored.  If 'vth' output is not used,
and the '-s' argument is omitted, 'pg' uses a default value of 23 lines.
[cc]mc
.es
pg -s 5 file
fmt english | pg
help -i | pg -m "continue or quit? "
.me
"Usage: pg ..." for invalid argument syntax.
[cc]mc |
.bu
The "h" command output is not paged.
[cc]mc
.sa
[cc]mc |
cat (1), copy (1), print (1), page (2), vt?* (2),
[cc]mc
[ul Introduction to the Software Tools Text Editor]
