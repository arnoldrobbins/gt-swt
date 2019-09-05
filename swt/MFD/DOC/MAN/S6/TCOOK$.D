[cc]mc |
.hd tcook$ "read and cook a line from the terminal" 09/14/84
integer function tcook$ (ubuf, size, tbuf, tptr)
character ubuf (ARB), tbuf (MAXTERMBUF)
integer size, tptr
[cc]mc
.sp
Library:  vswtlb (standard Subsystem library)
.fs
[cc]mc |
'Tcook$' reads and processes a line from the terminal. It handles
the processing of escape sequences, case and character set mapping,
line kills, character deletes, EOF's, and NEWLINE's. 'Ubuf' is the
user's buffer that is to receive no more than 'size' characters
(including the EOS). 'Tbuf' is a scratch buffer that is used to process
the input before moving it to 'ubuf' and 'tptr' is the index of the
current character being processed. Before the first call to 'tcook$',
'tptr' should contain a 1 and the first element of 'tbuf' should contain
an EOS. If these variables are used in subsequent calls, they will
be updated automatically to contain the correct values. The function
return value is the number of characters returned in 'ubuf', not
including the EOS.
[cc]mc
.im
'Tcook$' reads input from the terminal one character at a time,
[cc]mc |
interpreting each character as it is read. Special characters
(the Subsystem escape character, kill character, retype
character, newline character, and EOF character)
are removed and the appropriate action taken while other characters
are echoed and passed on directly. When the NEWLINE character is
read or when the end-of-file is generated, reading terminates and
the resulting line is returned after any required case
and character set mapping are performed.
.sp
The several special characters used by 'tcook$' to provide extra
functionality are explained below.
Look at the description of the 'escape' character
to see how to enter the special characters without
their special properties being interpreted.
.in +10
.sp
.ti -10
eof
.br
The eof character causes the generation of an end-of-file when read
from the terminal. If there is information already entered on the
current line, the user's kill response is printed, the information
on that line is forgotten, and the end-of-file is generated.
.sp
.ti -10
erase
.br
The erase character causes the removal of one character of previously
read input. The cursor is backed up one character position. If there
happened to be no characters on the line, nothing happens.
.sp
.ti -10
escape
.br
The escape character is normally used to enter the Subsystem
special characters and other characters with special
attributes. If any character is preceded
by the escape character (including the escape character) it will be
passed without interpretation into the receiving buffer. If an escape
character is followed by a '/' character and then another character,
that character will have its parity bit (normally on) turned off.
The final case is an escape followed by three octal (0 through 7) digits.
The character formed by those three digits is the character that is
entered.
.sp
.ti -10
kill
.br
The kill character is used to discard all text on the current input
line. When entered, the user's kill response is printed, any information
on the current line is forgotten, and the user is allowed to retype
the line.
.sp
.ti -10
newline
.br
The newline character is a signal to the input routines that the user
is finished with the current line of text and is ready for the machine to
accept it. If the character is not a linefeed character (the standard
newline character) then 'tcook$' will echo a carriage return
linefeed combination and return a NEWLINE character at the end of the
line.
.sp
.ti -10
retype
.br
Occasionally, the user will have a message forced to his
terminal, or will have typed input ahead of the system, while
the system is generating output.
In such a case, the representation of the current input line on the
user's terminal will become disrupted.
To see what has actually been entered,
the user may enter the retype character,
and 'tcook$' will echo the current input text.
The user can then finish entering his commands.
.in -10
[cc]mc
.am
[cc]mc |
ubuf, tbuf, tptr
[cc]mc
.ca
Primos c1in, Primos duplx$, Primos tonl, Primos t1ou
.sa
[ul User's Guide for the Software Tools Subsystem Command Interpreter],
[cc]mc |
term (1), [ul Primos Subroutines Reference Guide (DOC 3621)]
[cc]mc
