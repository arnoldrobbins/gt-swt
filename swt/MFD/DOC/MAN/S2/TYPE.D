.hd type "return type of character" 03/23/80
character function type (c)
character c
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Type' returns the type of the character given as its first argument:
LETTER if the character was a letter, DIGIT if the character was a digit,
and the character itself if it was anything else.
.im
'Type' checks the type of character by using a Ratfor 'select' statement
listing all the letters in one alternative and all the digits in another.
If the character falls within
the first range, LETTER is returned; if it falls within the last range,
DIGIT is returned; if it is outside of both, the function return is the
character itself.
