.hd strim "trim trailing blanks and tabs from a string" 03/23/80
integer function strim (str)
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Strim' is used to trim trailing blanks and tabs from the EOS-terminated
passed as its first argument.
The function return is the length of the trimmed string,
excluding EOS.
.im
One pass is made through the string, and the position of the last
non-blank, non-tab character remembered.
When the entire string has been scanned, an EOS is planted immediately
after the last non-blank.
.am
str
.sa
stake (2), sdrop (2), substr (2)
