.hd wkday "get day-of-week corresponding to month, day, year" 03/23/80
integer function wkday (month, day, year)
integer month, day, year
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Wkday' is used to return the day-of-the-week corresponding to a
given date.
The three arguments completely specify the date:
the month (1-12), day (1-28, 29, 30, or 31), and year (e.g. 1980).
The function return is the ordinal number of the day-of-the-week
(1 == Sunday, 7 == Saturday).
.im
Zeller's Congruence.
.sa
date (2), day (1)
