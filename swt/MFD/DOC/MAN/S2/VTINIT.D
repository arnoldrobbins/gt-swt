[cc]mc |
.hd vtinit "initialize terminal characteristics" 07/11/84
[cc]mc
integer function vtinit (term_type)
character term_type (MAXTERMTYPE)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtinit' initializes the terminal characteristic common blocks for
the virtual terminal handler. It must be called before any
of the other routines are used. The single argument is the
returned terminal type of the users current process. The value
returned from 'vtinit' is OK if the descriptor file for that
type of terminal is found, and is in the correct format,
and ERR otherwise.
.im
'Vtinit' first calls 'vtterm' to initialize the terminal
characteristic tables and return the terminal type. If
'vtterm' couldn't initialize the tables, then 'vtinit' returns
[cc]mc |
ERR. 'Vtinit' then proceeds to clear the screen buffers,
[cc]mc
status information, input enabling, and turns off terminal
echo, and then returns OK.
.am
term_type
.ca
vtterm, Primos duplx$
.sa
other vt?* routines (2)
