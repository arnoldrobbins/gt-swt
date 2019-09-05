.hd lsdrop "drop characters from a linked string" 01/03/83
pointer function lsdrop (ptr, len)
pointer ptr
integer len
.sp
Library:  vlslb
.fs
The value of the function is a pointer to a string containing
all but the first 'len' characters of the string specified by
'ptr'.
.im
'Lspos' is called to position the string to position 'len' + 1.
'Lscopy' is then called to copy the remainder into a newly
allocated string, a pointer to which is returned as the function
value.
.ca
lscopy
.bu
Locally supported.
.sa
lsdel (4), lssubs (4), lstake (4)
