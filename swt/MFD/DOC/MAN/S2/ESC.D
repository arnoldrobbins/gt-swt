.hd esc "map substring into escaped character if appropriate" 05/29/82
character function esc (array, i)
character array (ARB)
integer i
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Esc' examines the string 'array' at character position 'i'.
If there is an escape character ("@") at this point, then the next
character in the array is examined.
If it is a letter "n", the function return is the character NEWLINE.
If it is a letter "t", the function return is the character TAB.
If the character is neither "n" nor "t", or if the escape character
was not present, the function return is the character itself.
In all cases, 'i' is incremented to point to the next unexamined
character in the string.
.am
i
.bu
Should probably handle "b" for backspace, arbitrary octal and hex
character constants, and a few other things.
