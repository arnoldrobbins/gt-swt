.hd delarg "delete a command line argument" 03/23/80
integer function delarg (ap)
integer ap

Library:  vswtlb (standard Subsystem library)
.fs
'Delarg' deletes the command line argument indicated by 'ap'.
Subsequent arguments have their positions shifted left by one.
'Delarg' returns OK if
there is an argument at the position specified by 'ap', and EOF
otherwise.
.sp
'Delarg' can be used by an argument parsing routine to discard
arguments that it recognizes, while leaving other arguments
for later action.    Then, routines subsequently examining
the command line arguments are not bothered by arguments
already processed.
.im
'Delarg' simply shifts the pointers for arguments following 'ap' in
the Subsystem common area down by one and then reduces the
argument count by one.
.sa
getarg (2), parscl (2)
