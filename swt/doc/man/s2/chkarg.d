.hd chkarg "parse single-letter arguments" 03/23/80
integer function chkarg (arg_num, result)
integer arg_num, result (26)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Chkarg' scans the list of arguments supplied on the command line,
starting at position 'arg_num', looking for arguments that contain
a dash followed by a string of letters. For each letter in such an
argument, 'chkarg' looks at the corresponding element in the 'result'
array (the letters "A" and "a" correspond to element 1, "Z" and "z"
to element 26). If the element is non-negative, it is set to a
positive value equal to the order in which the letter was encountered
in scanning the arguments, counting from 1.
Otherwise, the element is left unchanged and a value of ERR is returned
as the result of the function. Thus, illegal letters may be detected by
setting the corresponding elements in 'result' to a negative value
before calling 'chkarg'.
.sp
Scanning continues, incrementing 'arg_num', until the end of the
argument list is reached, an argument not beginning with a dash
is found, or an argument beginning with a dash but containing a
subsequent character other than a letter is found. In the first
two cases, 'chkarg' returns with the number of letters encountered
as its result. In the third case, a result of ERR is returned.
.im
'Chkarg' does a straightforward argument scan, using 'getarg' to
fetch each argument in turn.
The actions taken for each argument are simply those mentioned above.
.am
arg_num, result
.ca
getarg
.sa
getarg (2), getkwd (2)
