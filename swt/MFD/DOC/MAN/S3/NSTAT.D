[cc]mc |
.hd nstat "remote node status command" 01/15/83
nstat <node> [us | di | ne | wh | lo]
.ds
'Nstat' uses the X.25 Primenet calls to send a request to a server
phantom on the destination system. Currently, <node> may be
the systems "gt.a", "gt.b", "gt.c", and "gt.d".
The remote server process then executes a status command and
routes the information back through the virtual circuit to
the calling program. Options include:
.sp
.na
.fi
.in +8
.ti -4
us[bl 2](default) causes the equivalent of the Subsystem 'us' command
on the other system; same as a Primos STATUS USERS command.
.sp
.ti -4
di[bl 2]causes a status of active disks; same as a Primos
STATUS DISK command.
.sp
.ti -4
ne[bl 2]causes a status of the network; same as a Primos
STATUS NET command.
.sp
.ti -4
wh[bl 2]causes a verbose status listing of users; equivalent to
the Subsystem 'who' command being executed for the named system.
.sp
.ti -4
lo[bl 2]causes the server phantom on the named system to logout.
This command may only be issued by user "system".
.in -8
.ad
.es
nstat gt.b us
nstat gt.e di
.fl
The server process uses the file "=temp=/netstat", and some files
in the account(s) "//nstat"
.me
"Usage: nstat ..."  for improper arguments.
.br
Various other messages depending on network status.
.bu
Locally supported; experimental
.sa
Primenet guides, X.25 routines
[cc]mc
