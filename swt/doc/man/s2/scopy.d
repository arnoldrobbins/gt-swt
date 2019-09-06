.hd scopy "copy one string to another" 02/25/83
integer function scopy (from, i, to, j)
character from (ARB), to (ARB)
integer i, j
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Scopy' copies a string from one place to another.  The source string
begins at the 'i'th character of 'from', and extends to an EOS; the
destination string begins at the 'j'th character of the string 'to'.
Copying takes place by character-by-character transfer until an EOS
is encountered; the EOS is transferred to the receiving string also.
When it finishes, 'scopy' returns the number of characters copied,
excluding the trailing EOS.
.im
A simple loop copies characters from one string to the other, until
an EOS is seen.
.am
to
