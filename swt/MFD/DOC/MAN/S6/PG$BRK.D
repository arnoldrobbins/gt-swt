[cc]mc |
.hd pg$brk "catch a break for the page subroutine" 07/19/84
subroutine pg$brk (cp)
long_int cp
.fs
'Pg$brk' is used by the 'page' subroutine to catch the QUIT$
condition and return to a set place within it.
.sp
The user should not call this routine directly.
.im
'Pg$brk' simply calls 'pl1$nl' with the 'Rtlabel' array from
the Software Tools common block.  This was
previously set to the proper label to return to.
.ca
Primos pl1$nl
.sa
page (2)
[cc]mc
