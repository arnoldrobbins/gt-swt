[cc]mc |
.hd cvusr "convert pre-Version 9 user list to Version 9 format" 09/21/84
cvusr <old_userlist> <new_userlist>
.ds
'Cvusr' is a simple shell script that takes two file names
as arguments, the old, pre-Version 9 user list, and the new
user list to be created.
It simply pads six-character login names with blanks to be
32 characters long.  It should be run once,
by the system administrator, when the new Subsystem is installed.
It is not needed at sites whose first edition of the Subsystem
was Version 9.
.es
=ebin=/cvusr //old_extra/users //extra/users
.me
"Usage: ..." if called improperly.
.br
"old user list is new user list!!" if both arguments are identical.
.bu
Will create a strange user list if any of the old login names
are longer than six characters.
.sa
.ul
Software Tools Subsystem Manager's Guide
[cc]mc
