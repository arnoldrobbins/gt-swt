.hd day "day of week" 03/20/80
day  [ <dd> | <mm>/<dd> | <mm>/<dd>/<yy> ]
.ds
'Day' prints the name of the day of the week (e.g. Monday,
Tuesday, Wednesday, etc.) on standard output one. The name is printed
in lower case with the first character capitalized.
.sp
Should no arguments be given, the name of the current day is
printed.
Optionally, a day in the current month, in a different month but
the current year, or in a different month and year may be given
as an argument, and the day associated with that date will be
printed.
.es
day
echo Today is @[day] @[date]
day 30
day 01/01/99
.bu
Argument format restricts usefulness to the Twentieth century.
.sa
date (1), time (1), date (2)
