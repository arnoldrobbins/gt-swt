.hd gcifu$ "return the current value of the command unit" 10/15/81
integer function gcifu$ (funit)
integer funit
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gcifu$' returns the file unit which is providing command
input for the shell both in the argument 'funit' and as the
value of the function.
.im
'Gcifu$' returns the value contained in 'Comunit' in the
Subsystem common block.
.am
funit
.sa
sh (1)
