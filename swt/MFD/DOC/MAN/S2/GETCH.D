.hd getch "get a character from a file" 03/23/80
character function getch (c, fd)
character c
integer fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getch' is used to get a character from a file.  The first argument is assigned
the value of the character fetched; the second argument is the file descriptor
of the file to be read.  If end-of-file occurs on the input file, the character
returned is EOF.
The function return is always identical to the first argument (character read
or EOF).
.im
'Getch' calls 'getlin' with a very short line buffer (1 character + EOS).
'Getlin' thus returns one character in the buffer, which becomes the
value returned by 'getch'.
If 'getlin' returns EOF, 'getch' also returns EOF.
.am
c
.ca
getlin
.sa
getlin (2), putch (2)
