[cc]mc |
.hd sys$$ "pass a command to the Primos shell" 08/28/84
[cc]mc
integer function sys$$ (cmd, cominput)
character cmd (ARB)
file_des cominput
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Sys$$' passes the Primos command in 'cmd' to the
Primos shell with a call to the Primos routine CP$.
The second argument 'cominput' specifies the file unit from which
the command takes its input. If no change in command input
is desired, the argument should be ERR.
.sp
The function return is ERR if the status returned by CP$ is greater
than zero (a fatal error), and OK otherwise.
.im
'Sys$$' converts the command to a varying character
string with a call to 'ctov'.
If 'cominput' isn't the value ERR, the command input is
switched to that file; otherwise, the command is just
executed, with no change being made as to where the command
input is coming from.
After making a call to the Primos routine MKONU$ to create
an on-unit for the Primos REENTER$ condition,
it calls CP$ to process the Primos command.
.ca
ctov, flush$, mapfd, mapsu,
Primos break$, Primos comi$$, Primos cp$, Primos mkonu$
.bu
If the user's program is loaded in segment 4000, then only
Primos internal commands may be executed with 'sys$$'. External
commands will destroy the current memory image, and may
destroy the user's current Primos environment, requiring that
the user reset it, using the Primos command "RLS -ALL".
[cc]mc |
.sp
When Primos supports EPFs, this restriction will be lifted
(on programs loaded with 'bind').
[cc]mc
.sa
ldtmp$ (6)
