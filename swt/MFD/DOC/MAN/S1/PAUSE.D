.hd pause "suspend command interpretation" 06/10/80
.nf
pause ([ for ] <interval> [ <units> ]  |  until <time>)
.fi
.ds
'Pause' causes a user's traffic with the system to cease for a fixed
interval of time or until a specific wall clock time.
.sp
In the first usage format, <interval> is the number of time units
to pause, expressed as a positive decimal integer.  It must be less than
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
The word "for" may
be included to enhance readability; its presence or absence is
otherwise insignificant.
.sp
In the second format, traffic will be suspended until the system
clock registers the time of day specified by <time>.  <time> may
be expressed in almost any common format.  One guideline should
be observed, however: a colon must be used to separate hours
from minutes and minutes from seconds.
.es
pause 5 seconds
pause for 2 hours
pause until 3pm
pause until 18:45:30
.me
[cc]mc |
"Usage: pause ..." for invalid argument syntax.
[cc]mc
.sa
sema (1), date (2), Primos sleep$
