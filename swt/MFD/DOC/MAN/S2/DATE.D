.hd date "return time, date and other system information" 02/24/82
subroutine date (item, str)
integer item
character str (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Date' is used to return several interesting pieces of data that Primos
keeps for the user.  The first argument is a switch to select the data
returned; the second is a string for receiving the data.  The following
values of the first argument are defined:
.sp
.in +20
.ta 13 17
.tc %
.ti -16
SYS_DATE%[bl]1%date, in format mm/dd/yy
.ti -16
SYS_TIME%[bl]2%time, in format hh:mm:ss
.ti -16
SYS_USERID%[bl]3%user's login name
.ti -16
SYS_PIDSTR%[bl]4%user's three digit process id
.ti -16
SYS_DAY%[bl]5%day of the week (e.g. "monday", "tuesday", etc.)
.ti -16
SYS_PID%[bl]6%process id as a binary integer in str (1)
.ti -16
SYS_LDATE%[bl]7%name of day, name of month, day, year
.ti -16
SYS_MINUTES%[bl]8%number of minutes past midnight in str (1..2)
.ti -16
SYS_SECONDS%[bl]9%number of seconds past midnight in str (1..2)
.ti -16
SYS_MSEC%10%number of milliseconds past midnight in str (1..2)
.in -20
.sp
If the first argument is not one of these values, an empty string is returned.
.im
'Date' calls the Primos routine TIMDAT to fetch time, date, process id,
and login name information.
This information is then reformatted as needed.
.am
str
.ca
Primos timdat, encode (2), mapup (2), ptoc (2), wkday (2)
