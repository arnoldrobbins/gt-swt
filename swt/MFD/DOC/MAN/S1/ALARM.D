.hd alarm "digital alarm clock for CRTs" 01/16/83
.nf
alarm (@[ in ] <interval> @[ <units> ]  |  at <time>)
.fi
.ds
'Alarm' works like an alarm clock, allowing you to set when the
alarm goes off.  It displays the alarm set time, and then displays
the current time in "hh:mm:ss" similar to 'clock'.  When the alarm time
is reached, 'alarm' sounds the terminal bell every second.
.sp
In the first usage format, <interval> is the number of time units
before the alarm sounds,
expressed as a positive decimal integer.  It must be less than
32768.  <Units> specifies the time unit.  It may be:
.sp
.nf
     "seconds"  for seconds,
     "minutes"  for minutes,
     "hours"    for hours,
.fi
.sp
or omitted, in which case "seconds" is assumed.
Abbreviations consisting of any initial substring of the above units
are allowed.
The word "in" may
be included to enhance readability; its presence or absence is
otherwise insignificant.
.sp
In the second format, the alarm will occur when the system
clock registers the time of day specified by <time>.  <Time> may
be expressed in almost any common format.  One guideline should
be observed, however: a colon must be used to separate hours
from minutes and minutes from seconds.
.sp
'Alarm' is terminated by typing control-P or by pressing the
BREAK key.
.es
alarm
alarm in 5 seconds
alarm at 12:50pm
alarm at 14:55:55
.me
"Usage: alarm ..." for invalid argument syntax.
.bu
Works only on CRT terminals.
.sa
clock (1), date (1), day (1), pause (1), time (1), date (2)
