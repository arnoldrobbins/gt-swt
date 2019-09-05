.hd memo "automated memo and reminder system" 01/13/83
memo [[[-t] <user>] [-d <display_cond>] [-e <erase_cond>]]
.ds
'Memo' allows a user to send dated memos to himself or to another
user.
'Memo' differs from 'mail' in that "display conditions" and
"erase conditions" may be specified for memos; i.e., the user has
control over when a memo is displayed and how long it will be
displayed before it is deleted.
.sp
The simplest usage is just "memo".
This form checks the current user's memo file, displays any
memos whose display conditions yield "true", and deletes any
memos whose erase conditions yield "true".
Normally, a user would include this form of the 'memo' command
in his "_hello" shell variable, so it would be executed whenever
he enters the Subsystem.
.sp
The other forms of the command are used to send a memo.
The "-t" ("to") option, followed by a valid user login name,
specifies the intended recipient of the memo.
The "-t" may be omitted if desired.
If no user name is specified, then the memo is sent to oneself.
The "-d" option, if given, must be followed by a boolean
display condition (discussed below).
When this condition is "true", the memo will be displayed.
The default display condition is "always".
The "-e" option, if given, must be followed by a boolean
erasure condition (also discussed below).
When this condition is "true", the memo will be removed from the
user's memo file, regardless of whether or not it has ever been
displayed.
The default erasure condition is "always".
.sp
Display and erasure conditions are boolean expressions involving
variables concerned with the current time and date.
The allowable syntax is as follows:
.sp
.in +5
.nf
expression -> secondary { '&' secondary }
secondary -> primary { '|' primary }
primary -> '~' '(' expression ')'
         |  '(' expression ')'
         |  relation
         |  'always'
         |  'never'
relation -> arithprim relop arithprim
relop -> '=' | '==' | '~=' | '<>' | '<' | '>' | '<=' | '>='
arithprim -> integer_constant
         |  symbolic_constant
         |  time_variable
symbolic_constant ->
            sunday | sun
         |  monday | mon
         |  tuesday | tue
         |  wednesday | wed
         |  thursday | thu
         |  friday | fri
         |  saturday | sat
         |  january | jan
         |  february | feb
         |  march | mar
         |  april | apr
         |  may
         |  june | jun
         |  july | jul
         |  august | aug
         |  september | sep
         |  october | oct
         |  november | nov
         |  december | dec
time_variable ->
            month       # the current month, 1-12
         |  day         # the day of the month, 1-31 (usually)
         |  year        # the current year, e.g. 80
         |  dow         # the day of the week, 1-7
         |  hour        # the hour of the day, 0-23
         |  minute      # the minute of the hour, 0-59
.sp
.in -5
.fi
Some examples of conditions might be helpful.
.sp
The condition "always" is always true.
Thus, if used as a display condition, the memo will always be displayed.
If used as an erase condition, the memo will be immediately deleted
(although it may well have been displayed first).
The condition "(month=March)&(day>3)" will be true only on days
in March after March third (in any year).
The condition "(dow=Friday)" will be true on any Friday, false
otherwise.
The condition "(month=feb)&(day=2)" will be true on Groundhog Day.
The condition "(dow=mon)&(day=13)" will be true on those months
in which Friday the 13th falls on Monday.
.es
memo
.sp
memo system
 See about fixing 'lps'
 <Control-C>
.sp
memo -d "(month=mar)&(day<9)" -e "(month>=mar)&(day>=9)"
 See "In the Name of the Father" at Alliance Studio
 <Control-C>
.fl
=extra=/memo/<login_name> for storing memos
.br
=userlist= for verifying user names
.me
.in +5
.ti -5
"bogus character in expression"
an unrecognizable character appeared in a display or erasure condition
.ti -5
"undefined variable"
the parser encountered a variable that was not a symbolic constant
or time variable, as defined in the lists above
.ti -5
"illegal user name"
the named user is not in the Subsystem user list
.ti -5
"illegal user name or improper argument syntax"
the command line could not be parsed properly
.ti -5
"can't open memo file"
the user's memo file could not be opened
.ti -5
"memo file not available"
the addressee's memo file could not be opened
.ti -5
"Usage: memo ..."
command line was undecodable
.ti -5
"stack overflow"
a condition was too complex to evaluate fully
.ti -5
And several self-explanatory messages from the expression parser.
.in -5
.bu
Needs a more concise syntax for expressing dates.
Is subject to all the security problems of 'mail'.
Lacks the ability to file copies of memos away when they are
removed from the active memo file.
.sa
mail (1), to (1), stacc (1)
