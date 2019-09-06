[cc]mc |
.hd vt$out "output a character onto the screen" 07/11/84
[cc]mc
subroutine vt$out (ch)
character ch
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$out' is the very low level routine which does the actual
character output to the terminal screen; the character contained
in 'ch' is printed on the screen after certain considerations
are evaluated.
.im
First, 'vt$out' checks to see if the character would be output
on the last character position of the last line of the screen;
if so, it returns without doing the output operations (thus
preventing the screen from scrolling).  Next, the character is
checked to see if it is printable; if not, then a printed
representation is output (if a "shifted" sequence for the unprintable
character is defined, i.e. a transparent mode indicator for the
terminal, then that sequence is output before the character itself).
The internal screen cursor position indicators are updated to
reflect that a character was printed.
.bu
Not meant to be called by the normal user.
.sa
other vt?* routines (2) and (6)
