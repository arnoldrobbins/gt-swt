.hd putdec "write decimal integer to a file" 03/23/80
subroutine putdec (n, w, fd)
integer n, w
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Putdec' prints a decimal integer in a field of width greater than or equal
to the argument 'w'.  The argument 'n' is the integer to be printed; 'w' is
the field width; 'fd' is the file descriptor of the file to be written.
If 'w'
is insufficient to print the integer, enough additional space on the file
is used to insure that an accurate representation is printed.
.im
'Putdec' calls 'itoc' to convert the integer to a character representation.
Enough blanks are output by calls to 'putch' to right justify the string
produced by 'itoc', then the string itself is printed by multiple calls
to 'putch'.
.ca
itoc, putch
.sa
itoc (2), encode (2), print (2)
