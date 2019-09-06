.hd ts "time sheet for hourly employees" 01/15/83
ts  @[ in | out ]  [ <hh>:<mm>  [ <mm>/<dd> ] ]
.ds
'Ts' was written to ease the monthly chore of preparing a
time sheet.
During the month, the worker uses 'ts' like a time clock,
entering "ts in" as he begins a work session and "ts out"
as he concludes it.
His entry and exit times are recorded to the nearest
quarter-hour.
(Should variations in time be necessary, he may specify a
time and, optionally, a date on the command line.)
His comings and goings are recorded in a file named ".ts"
in his variables directory.
.sp
At the end of the month, the worker simply enters the command
"ts", which causes a reasonably readable time sheet to be printed
on standard output.
This timesheet contains daily, weekly, and monthly totals.
.sp
After his time has been reported to his superior, the worker
should delete his old ".ts" file and begin anew.
.es
ts in
ts out 12:45
ts
.fl
=varsdir=/.ts for record of work
.me
"Usage: ts ..." for invalid argument syntax.
.br
"can't open time sheet file" when unable to open "=varsdir=/.ts".
.bu
This program is incredibly locked in to the pay period used
in the Georgia Tech School of Information and Computer Science;
e.g., pay periods must begin on the 18th of the month and end
on the 17th of the next, and all entries in the timesheet file must
have dates between those limits.
'Ts' is also guaranteed to fail on "pathological" timesheet files:
those that have entries missing or out of order.
.sp
Locally supported.
.sa
log (1)
