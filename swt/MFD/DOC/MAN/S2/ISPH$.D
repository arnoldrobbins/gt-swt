[cc]mc |
.hd isph$ "determine if the caller is a phantom" 09/18/84
integer function isph$ (dummy)
untyped dummy
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Isph$' returns YES if the caller is a phantom user or NO otherwise.
The single argument 'dummy' is not referenced and exists only because
a function in FORTRAN 66 must have at least one argument.
.im
'Isph$' simply returns the value of the 'Isphantom' variable
in the SWT common block, which is set during Subsystem initialization.
.am
none
.sa
isph (1)
[cc]mc
