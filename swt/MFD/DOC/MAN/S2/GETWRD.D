.hd getwrd "get a word from a line buffer" "02/04/83"
integer function getwrd (in, i, out)
integer in (ARB), out (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getwrd' retrieves the next word from the line buffer 'in' at current
position 'i', and places it in 'out'.  A word is a string of characters
delimited by blanks or newlines (also EOS, if the word occurs at the
end of the line).  The new current position is updated in 'i', and
the length of the word is returned as the function value.
.im
Any blanks, starting at the current position 'i' in the string, are
skipped.
Characters from 'in' are then copied to 'out', starting at
position 'i',
until the next character to be copied is either an EOS, a blank, or
a NEWLINE.  When this happens, the count of characters is returned.
.am
i, out
.sa
ctoc (2)
