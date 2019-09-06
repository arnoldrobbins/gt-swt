.hd getvdn "return name of file in user's variables directory" 01/07/83
subroutine getvdn (filename, pathname [, username])
character filename (ARB), pathname (ARB), username (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Getvdn' is used to return the full pathname of a file in a user's
shell variables storage directory.
Such files are often used for small amounts of data that must be
secure (e.g. mail files, encryption parameters, shell variables, etc.).
.sp
The 'filename' argument is an EOS-terminated string containing the
simple name of a file in the variables directory.
The 'pathname' argument receives the full pathname of the given file.
The 'username' argument, if present, specifies the particular user
whose variables directory is to be referenced.
If 'username' is missing, or is equal to the user making the call to
'getvdn', then the user's Subsystem password is inserted in the
returned pathname, allowing full owner rights in the variables
directory.
.sp
An example:  If the current user's login name is "foo" and his
Subsystem password is "bar", then the call
.ti +5
call getvdn (".vars"s, pathname)
.br
would return the string "=vars=/foo:bar/.vars" in 'pathname'.
.im
'Getvdn' calls 'ctoc' to start the pathname with the string "=vars=/",
then simply uses 'scopy' to append the other items of information
as needed.
The Subsystem password is available in the variable 'Passwd' in
the shell's common areas.
.am
pathname
.ca
ctoc, date, equal, length, scopy, Primos missin
.bu
Security of the variables directory can be broken by a Trojan
horse.
.sa
vfyusr (2), expand (2), lutemp (6)
