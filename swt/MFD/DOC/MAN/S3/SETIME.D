[cc]mc |
.hd setime "set time of day/date on all systems running ring" 07/20/83
setime [-d mmddyy] [-t hhmm]
.ds
The 'setime' command is an interface to the SWT 'ring' process which
allows validated users to change the time of day on all systems that
are running 'ring'.  If the "-d[bl]mmddyy" argument is present, the
current month, day, and year is set to the given value, otherwise the
date remains unchanged.  If the "-t hhmm" argument is present, the
current time of day is set to that value, otherwise the time of day
remains unchanged.  At least one of the arguments must be present.
.sp
If the current time of day is being reset, the 'setime' command executes
immediately.  Otherwise, 'setime' pauses until the beginning of the next
minute to complete execution.
.es
setime -d 030184
.sp
setime -t 1400
.me
.in +5
.ne 2
.ti -5
Cannot transmit SETTIME request
.br
Something interfered with the transmission of the SETTIME
command to the 'ring' process.  This should never happen.
.sp
.ne 2
.ti -5
Networks are not configured
.br
The system is not configured to support PRIMENET.
.sp
.ne 2
.ti -5
Request to <system> failed
.br
The attempt to set the time of day/date on system
<system> failed.
.sp
.ne 2
.ti -5
Request to <system> succeeded
.br
The attempt to set the time of day/date on system
<system> succeeded.
.sp
.ne 2
.ti -5
Ring connection has been terminated
.br
The connection to the 'ring' process has been cleared.
.sp
.ne 2
.ti -5
Setime complete
.br
The SETTIME command has been successfully attempted on all
systems in the ring.
.sp
.ne 2
.ti -5
SETTIME request initiated
.br
The SETTIME command has been transmitted to the 'ring' process.
.sp
.ne 2
.ti -5
The first day of the month must be at least 1
.br
0 is not a valid day of the month.
.sp
.ne 2
.ti -5
The month must be between 1 and 12 (inclusive)
.br
The only valid months are 1 through 12.
.sp
.ne 2
.ti -5
The hour must be between 0 and 23 (inclusive)
.br
The only valid hours are between 0 and 23.
.sp
.ne 2
.ti -5
The minute must be between 0 and 59 (inclusive)
.br
The only valid minutes are between 0 and 59.
.sp
.ne 2
.ti -5
Usage: setime @[-d mmddyy] @[-t hhmm]
.br
Some argument was incorrectly specified.
.sp
.ne 2
.ti -5
Unable to connect to ring node
.br
The current system is not running a 'ring' process.
.sp
.ne 2
.ti -5
You are not validated to SETTIME
.br
Your user number is not allowed to use the SETTIME
command.
.sp
.ne 2
.ti -5
<month> has only <count> days
.br
The number of days specified is not correct for the
given month.
.in -5
.bu
Will not work if the current system is not running 'ring'.
.sp
Is inherently inaccurate because of the time required for
the SETTIME request to go around the ring.
.sa
broadcast (3), execute (3), terminate (3)
[cc]mc
