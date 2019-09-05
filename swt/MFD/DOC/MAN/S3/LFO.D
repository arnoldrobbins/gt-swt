[cc]mc |
.hd lfo "list files opened for a specified user" 10/21/83
lfo {<process id> | <user name>}
.ds
'Lfo' prints the following information on STDOUT for each process number
and for all processes owned by each user name specified:
.sp
.in +5
.nf
1. the user name and process-id;
2. his accumulated cpu and io times;
3. his initial, current, and home directories;
4. every open file unit and its associated pathname.
.fi
.in -5
.sp
If no arguments are specified, 'lfo' lists the information for as
many processes as possible. The normal user may list only his own
processes, while a system administrator may list any process on the
system.
.es
lfo 1 15 16 23
lfo snodgrass silverlips
lfo 3 upi 8
lfo
.me
"pathname not obtainable" for files opened on a remote system.
.bu
Locally supported.
.sp
Requires Georgia Tech modified Primos.
[cc]mc
