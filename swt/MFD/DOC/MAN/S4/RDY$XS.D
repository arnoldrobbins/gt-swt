.hd rdy$xs "see if character waiting, and if so, fetch it" 06/25/82
logical function rdy$xs (char)
shortcall rdy$xs (4)
.sp
character char
.sp
Library: shortlb
Also declared in =incl=/shortlb.r.i
.fs
The function checks to see if a character has been typed at the terminal
but not yet input by software.  If no character is waiting, the function
returns the value FALSE.  If a character is waiting, then the
function returns TRUE and 'char' gets set to the waiting
character.
.im
Implemented as a simple PMA routine entered via a JSXB (shortcall).
The function switches to 64R mode to do a "SKS[bl]'704" (handled by
the Primos restricted instruction FIM).  If a value is waiting,
it is fetched by a call to the Primos routine T1IN.
.sp
Note that any routine using this call must be compiled using the
"-q" option of 'fc'.
.ca
Primos t1in
.am
char
.bu
Locally supported.
.sa
chkinp (2), fc (1)
