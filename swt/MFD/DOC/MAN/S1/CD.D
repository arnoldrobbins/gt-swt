.hd cd "change home directory" 03/25/82
cd [-p] [ <pathname> ]
.ds
'Cd' changes the current working directory.  <Pathname>
gives the pathname of the target directory;
if no arguments are present, the user's login directory is assumed.
.sp
If "-p" is given as the first argument, 'cd' prints on standard output
the full pathname of the directory specified as the second argument.
If there is no second argument, the full pathname of the current
directory is printed.
In neither case is the current working directory changed.
.es
cd
cd =extra=/fmacro
cd subdir
cd -p
cd -p =src=
.me
"bad pathname" when an invalid pathname is specified.
.sa
mkdir (1), Primos atch$$, Primos gpath$, gcdir$ (6)
