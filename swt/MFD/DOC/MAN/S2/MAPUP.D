.hd mapup "fold character to upper case" 03/23/80
character function mapup (c)
character c
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mapup' is the inverse of 'mapdn'.  If the character 'c' is a lower case
letter, the function return is the corresponding upper case letter; otherwise,
the function return is the same as 'c'.
.im
In 'mapup', as in 'mapdn', considerable use is made of the internal ASCII
character code.  If 'c' is between 'a'c and 'z'c, 'c' - 'a'c + 'A'c is
returned; otherwise, 'c' is returned.
.bu
Inordinate dependence on properties of character code.
.sa
mapdn (2), mapstr (2)
