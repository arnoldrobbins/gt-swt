[cc]mc |
.hd mkdir$ "create a directory" 07/04/83
[cc]mc
integer function mkdir$ (name, owner, non_owner)
character name (ARB), owner (ARB), non_owner (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Mkdir$' is used to create a new directory.
The argument 'name' is the pathname of the directory to be created;
the arguments 'owner' and 'non_owner' specify the owner and non-owner
passwords, respectively, of the new directory.
The function return is OK if the directory was successfully created,
ERR otherwise.
.im
'Getto' is called to attach to the directory which will become the
parent of the new directory.
A call to 'findf$' insures that the directory does not already exist.
The password strings are converted to packed format via calls to 'ctop'.
The Primos routine CREA$$ actually creates the directory
and sets the passwords.
Then the Primos routine SATR$$ is called to set the protection
so that the owner has all rights and non-owner has read access.
.ca
[cc]mc |
ctop, findf$, getto, Primos at$hom, Primos crea$$, Primos satr$$
[cc]mc
.sa
follow (2), getto (2), mkdir (1)
