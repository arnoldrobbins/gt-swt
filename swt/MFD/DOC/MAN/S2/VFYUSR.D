.hd vfyusr "validate username" 01/07/83
integer function vfyusr (lognam)
character lognam (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Vfyusr' is used to verify that a given login name corresponds to an
authorized user of the Subsystem.
The single argument is the login name of the user to be checked.
The function return is OK if the given name was validated,
ERR otherwise.
.im
'Vfyusr' opens the Subsystem user list file "=userlist="
(nominally in "//extra/users") and simply reads it until the given
user name is found or EOF is encountered.
.ca
close, ctoc, getlin, length, mapstr, open, remark, strcmp
