[cc]mc |
.hd page "display file in paginated form" 06/21/84
integer function page (fdin, prompt, eprompt, lines, fdout, options)
[cc]mc
file_des fdin, fdout
character prompt (ARB), eprompt (ARB)
[cc]mc |
integer lines, options
[cc]mc
.sp
Library:  vswtlb (Standard Subsystem Library)
.fs
[cc]mc |
'Page' displays the contents of a disk file in paginated form.
It also allows skipping pages forward and backward as well as
searching for patterns within the file.  'Page' is primarily
intended for viewing a file on a high speed CRT, but it may be
used from any terminal.
.sp
'Page' accepts six arguments, of which the last is optional.
'Fdin' is the swt file descriptor of a file to be displayed.
'Prompt' specifies a format string (cf. 'print', 'encode')
to be used for prompting the user after each screen of text
except the final page.
[cc]mc
If this format string contains a format code for an integer
[cc]mc |
(e.g. "*i") then 'page' replaces it with
the current page number in the actual prompt.
'Eprompt' specifies a format string to be used for prompting
the user when the final page of the file is reached;
[cc]mc
it may also contain a format code for the current page number.
[cc]mc |
'Lines' gives the number of lines in a page.
'Fdout' is the swt file descriptor of the file to receive the
output display; 'page' only pages output when the output file
is connected to a terminal (i.e. if the output file is on disk,
'page' simply copies the file to be displayed).
The final (optional) argument consists of flags that control the
operation of the 'page' subroutine.  The following flags may be
used singly or in combination (e.g. PG_END + PG_VTH):
.sp
.in +15
.ta 12
.tc %
.ti -11
PG_END%Do not prompt following the final page of the file.
The default action is to prompt.
.ti -11
PG_VTH%Use 'vth' to manage the screen.  By default 'page'
displays the file without using 'vth'.
.sp
.in -15
If the 'options' argument is not specified, it defaults to 0;
'page' displays the file using standard I/O and prompts after
the last page of the file.
.sp
If 'vth' is used to display the paginated file, 'page' ignores
the 'lines' argument and fixes the number of lines per page at
the maximum number that can fit on the screen.
.sp
'Page' prompts the user after each page of output, and awaits
one of the following commands (note that alphabetic commands
may be entered in upper or lower case):
[cc]mc
.sp
.in +15
.ta 11
[cc]mc |
.ti -10
D<pages>%Display given number of pages (default 1),
prompting only after the end of the range.
.ti -10
E<path>%Examine the file whose pathname is <path>.
.ti -10
E%Examine the original file.
.ti -10
H or ?%Print a command summary.
.ti -10
M<margin>%Set column of left margin to be displayed.
.ti -10
N or Q%Exit with OK status.
.ti -10
P or ^%Redisplay previous page.
.ti -10
S<lines>%Set page size to specified number of lines.
%Display starts over on page 1.
.ti -10
W <path>%Write a copy of the file being displayed to <path>.
%The file named <path> must not already exist.
.ti -10
W+<path>%Append a copy of the file being displayed to <path>.
.ti -10
W!<path>%Write a copy of the file being displayed to <path>.
%If the file already exists, it will be overwritten.
.ti -10
X%Exit with EOF status.
.ti -10
Y or :%Advance to the next page.
.ti -10
<ctrl-c>%Exit with EOF status (does not work in 'vth' mode).
.ti -10
<newline>%Advance to the next page.
.ti -10
<page>%Display specified page number.
.ti -10
-<pages>%Back up given number of pages (default 1).
.ti -10
.%Redisplay current page.
.ti -10
+<pages>%Advance given number of pages (default 1).
.ti -10
$%Display the last page.
.ti -10
/<pat>[/]%Display the next page containing <pat>.
.ti -10
\<pat>[\]%Display the previous page containing <pat>.
[cc]mc
.sp
.in -15
The pattern <pat> is a regular expression with the full set of
options found in the editor.
[cc]mc |
'Page' searches circularly from the current file position for the
[cc]mc
next page that contains the specified pattern.
[cc]mc |
As in the editor, the trailing delimiter is optional.
[cc]mc
(See [ul Introduction to the Software Tools Text Editor] in the
[ul Software Tools Subsystem User's Guide] for details.)
[cc]mc *
[cc]mc
.ca
[cc]mc |
close, ctoc, ctoi, encode, fcopy, getlin, isatty, makpat, markf,
match, open,print, putch, seekf, scopy, strim, vtclr, vtenb, vtgetl,
vtinfo, vtinit, vtprt, vtputl, vtread, vtstop, vtupd, Primos break$,
missin, mklb$f, mkon$f, pl1$nl
[cc]mc
.bu
[cc]mc |
Large amounts of stack space are used.
.sp
If any format code other than "*i" is used in a format string,
erroneous values will be displayed.
.sp
If more than one format code is specified, 'page' gets a
pointer fault error.
.sp
There is no way to change the page alignment.
.sp
The "H" command output is not paged.
[cc]mc
.sa
pg (1),
[ul Introduction to the Software Tools Text Editor]
