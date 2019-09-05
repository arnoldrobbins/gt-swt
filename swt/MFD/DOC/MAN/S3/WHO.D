[cc]mc |
.hd who "find out who's on the system and where they are" 08/20/83
who {-a|-l|-p|-q}
[cc]mc
.ds
[cc]mc |
'Who' prints a listing on standard output that shows which users are
[cc]mc
currently logged in.
Information provided on each logged-in user includes his login name,
his process number, the time at which he logged in, his full name,
[cc]mc |
and either his location or his current login project.
If the length of a login name exceeds 8 characters then 'who'
prints the name on a line by itself and the other information
on the next line.
.sp
Available options are:
.sp
.in +10
.ta 6
.tc \
.ti -5
-a\Display information on all active
processes, including phantoms; by default, 'who'
provides information only on real users.
.sp
.ti -5
-l\Display the locations of the logged in users.
This is the default behavior.
This option cannot be specified if the "-p" option is used.
.sp
.ti -5
-p\Display the current projects of the logged in users.
This option cannot be specified if the "-l" option is used.
.sp
.ti -5
-q\Do not print the header lines.
.in -10
.ta
.tc
[cc]mc
.es
who
who -a
[cc]mc |
who -p
[cc]mc
.fl
.in +5
.ti -5
=userlist= to correlate a login name with the user's full name
.ti -5
=termlist= to correlate process numbers with terminal locations
.in -5
.me
"Usage: who ..." for invalid argument syntax.
.br
"can't read user list" when unable to read "=userlist=".
.br
"can't read terminal list" when unable to read "=termlist=".
[cc]mc |
.br
"can't display both location and project at the same time" when
both "-l" and "-p" options are specified.
[cc]mc
.bu
The date of login is not displayed; thus, the time displayed
for phantom users is probably useless.
[cc]mc *
[cc]mc
.sa
us (1)
