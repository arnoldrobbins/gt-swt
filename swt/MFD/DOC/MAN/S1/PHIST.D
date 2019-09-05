.hd phist "print Subsystem history" 12/26/80
phist { -b <author> | -f <date> | -s <subject> | -q }
      [-i <input file>]
<date> ::= <day> | <month>/<day> | <month>/<day>/<year>
.ds
The purpose of 'phist' is to print selected portions of a
history file.
[cc]mc |
The history file chosen by default, "=doc=/hist/history",
[cc]mc
chronicles the ongoing development and maintenance of the
Software Tools Subsystem
by its implementors at Ga. Tech.  It consists of a series of dated entries,
each of which contains the name of the author, a list of commands or
files affected, and a description of the modification.
.sp
When invoked without arguments, 'phist' simply prints out the
entire history file; but
several
optional argument sequences can be employed
to sift out the interesting entries.
The "-b <author>" argument sequence may be specified to
restrict the entries printed to those written by a given
author.
The syntax of <author> is the same as that defined for patterns in the
Software Tools Subsystem text editors (see the
[ul Introduction to the Software Tools Text Editor] for details).
.sp
The "-s <subject>" argument
sequence tells 'phist' that only those entries concerning the
specified subject should be printed.
<Subject> may also be an arbitrary pattern.
.sp
The "-f <date>" sequence allows the user to tell 'phist' that
he only wants to see entries written on or after a specific date.
The format of <date> has three options:  if a single integer
is specified, it designates a day of the current month; if two integers
separated by a slash are specified, they designate a month and day of
the current year;
finally, if three integers separated by slashes are specified, they
designate a specific month, day and year.
.sp
If the "-q" option is specified, 'phist' will only print the
heading of each selected entry (i.e., the date, author and
subject of the entry) and omit the explanatory text.
Otherwise, the entire entry is printed.
.sp
If the "-i <input file>" is specified, 'phist' takes its
input from <input file>, rather than from "=doc=/hist/history".
.es
phist
phist -s %se
phist -f 12/19
phist -f 1/31/79 -s stacc -b allen
.fl
.in +5
.ti -5
=doc=/hist/history for the history of the Software Tools Subsystem.
.in -5
.me
.in +5
.ti -5
"history file not available" if =doc=/hist/history does
not exist or is not readable.
.ti -5
"history file contains apocryphal information" if the history file
is incorrectly formatted.
.ti -5
"<author>: bad author pattern" if the string following "-b" is not
a legal pattern.
.ti -5
"<subject>: bad subject pattern" if the string following "-s" is
not a legal pattern.
.ti -5
"<date>: bad date" if the string following "-f" is not recognizable
as a date.
.ti -5
"Usage: phist ..." for incorrect argument syntax.
.in -5
.sa
history (1),
.ul
Software Tools Subsystem User's Guide
