.hd stop "exit from subsystem" 03/20/80
stop [- | <pathname>]
.ds
'Stop' is used to exit from the Software Tools Subsystem.
If no option
is specified, the user's profile is saved and a normal exit to Primos
occurs.  If the "-" option is specified, the user's profile is saved and
logout from the Prime is forced.
If a pathname is given, then the given file is deleted before logout
is forced and the user's profile is not saved. This is used in
conjunction with the 'ph' command to log out phantoms.
.es
stop
stop -
stop =varsdir=/ph00301
.sa
bye (1), ph (1), Primos logo$$
