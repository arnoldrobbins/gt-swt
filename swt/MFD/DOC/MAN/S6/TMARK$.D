.hd tmark$ "return the current position of a terminal file" 03/23/80
file_mark function tmark$ (f)
file_des f
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Tmark$' is used to obtain the current position of a terminal file.
Since this concept doesn't have much meaning at the present,
'tmark$' always returns zero.
.sa
markf (2), seekf (2)
