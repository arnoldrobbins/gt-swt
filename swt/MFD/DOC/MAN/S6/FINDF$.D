.hd findf$ "see if file exists in current directory" 02/24/82
integer function findf$ (file)
packedchar file (16)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Findf$' is an internal routine used to verify the existence of a file.  The
argument is a packed, blank-padded character string (such as that returned
by 'getto')
that is 32 characters in length.  'Findf$' returns YES if the file exists
in the current directory, NO otherwise.
.im
'Findf$' calls the Primos routine SRCH$$ with the key KEXST to determine
if the named file exists.
.ca
Primos srch$$
.sa
getto (2), file (1)
