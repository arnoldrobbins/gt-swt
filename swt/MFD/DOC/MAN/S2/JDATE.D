.hd jdate "take month, day, and year and return day-of-year" 03/23/80
integer function jdate (month, day, year)
integer month, day, year
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Jdate' is used to determine the Julian date corresponding to a given
month, day, and year.
(For example, January first of any year has Julian date 1;
December 31st might have Julian date 365 or 366, depending on whether
the given year is a leap year or not.)
The function return is the Julian date calculated.
.im
'Jdate' simply adds up the number of days in all months before the
month given, then adds the number of days given.
If the year specified is a leap year, February is given 29 days
instead of the usual 28.
.sa
date (1), wkday (2), date (2)
