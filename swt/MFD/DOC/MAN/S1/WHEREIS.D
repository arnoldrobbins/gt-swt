.hd whereis "find the location of a terminal" 03/20/80
whereis [ - | <terminal number> ]
.ds
'Whereis' is a shell program that may be used to find the location of a
specific terminal.
The argument may be the line number of the terminal to be located
or a single dash (meaning "all terminals").
.sp
Terminal numbers appear under the column heading "LINE" in the output
produced by the Subsystem's 'us' command (Primos STATUS USERS command).
.es
whereis 10
whereis -
.fl
=termlist= for terminal list
.bu
Dependence on the fixed terminal list means that inaccuracies
will occur as terminals get changed or moved around.
.sa
whois (1), us (1), term_type (1)
