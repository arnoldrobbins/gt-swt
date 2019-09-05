.hd ph "execute subsystem commands in the background" 08/17/82
ph { <command> }
.ds
The 'ph' command allows the Subsystem user to execute Subsystem
commands in the background while continuing with other work at
his terminal. The phantom user feature of the Primos operating
system is used to implement this command and Primos must have
been configured at startup for phantom users.
.sp
'Ph' has two usage formats:
.sp
.in +5
.rm -5
In the first format, the commands to be executed are given as
arguments. Care should be taken when using this format to enclose
in quotes any commands that contain the following characters:
.sp
     ( ) [ ] { } # , > |
.sp
since these meta-characters will otherwise be interpreted by the shell
applied to the 'ph' command itself.
.sp
In the second format, commands are read from standard input
[cc]mc |
up to the next occurrence of end of file. This format allows 'ph'
[cc]mc
to be used at the end of a pipeline.
.sp
.in -5
.rm +5
In either case, 'ph' builds a script of commands that will be used
to drive the phantom process.
.sp
Assuming no errors were encountered, 'ph' responds by printing
the phantom's process id on standard output.
.es
ph rf se.r
ph "rf rf.r; fc rf.f"
commands> ph
.fl
=varsdir=/ph<user_number><sequence> for phantom input file
.me
.in +5
.ti -5
"=temp= missing" if unable to follow pathname of phantom script.
.ti -5
"No free phantoms" if Primos refuses to initiate phantom.
.ti -5
"Can't create phantom temp" if unable to create file to hold
phantom script.
.in -5
.bu
A note on portability: 'ph' takes advantage of a Georgia Tech modification
to the Primos operating system that duplicates both current
and home directories in the environment of the phantom (the
normal procedure is to duplicate only the current directory). In
systems that do not have this feature, the first command to
be executed by the phantom should be a 'cd' command to attach to the
desired directory.
.sp
Only 4 phantoms may be concurrently in progress on behalf of
any single user.
.sp
Due to Primos restrictions, phantoms cannot be started while the
user is attached to a remote disk.
.sa
sh (1), x (1), batch (1), Primos phant$
