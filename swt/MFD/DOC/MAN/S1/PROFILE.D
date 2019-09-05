.hd profile "print execution profile" 03/25/82
profile [ -d <dictionary> ] [ <profile> ]
.ds
'Profile' formats the information recorded by a
profiled Ratfor program (one compiled with "rp -p") and prepares
a report.
.sp
Two input files are used.  The first contains a dictionary of
the subroutines in the traced program and is produced by 'rp'
when the program is compiled (with the "-p" option).  The name
of the dictionary file may be specified explicitly after the
"-d" argument; otherwise, "timer_dictionary" is assumed.
.sp
The second file contains the actual profile data that are recorded
when the traced program is run.  Its name may also be specified
as an argument; "_profile" is assumed otherwise.
.sp
Profile analyzes the two data files and produces a report
on standard output, containing the following information:
.sp
.in +10
.ta 6
.tc \
.ti -5
-\Number of times each routine was called
.ti -5
-\Real time spent in each routine
.ti -5
-\Percentage real time spent in each routine
.ti -5
-\CPU time spent in each routine
.ti -5
-\Percentage CPU time spent in each routine
.ti -5
-\Milliseconds spent in each routine per call
.ti -5
-\Paging time spent in each routine
.ti -5
-\Percentage paging time spent in each routine
.in -10
.sp
Note that profile can only be used to summarize execution
of Ratfor programs compiled with the "-p" option, or Fortran programs
in which the necessary trace calls have been included by hand.
.es
profile | sp
profile -d dict1 prof_info
.fl
.in +5
.ti -5
"timer_dictionary" for default dictionary.
.ti -5
"_profile" for default profile data.
.in -5
.me
"Usage: profile ..." for invalid argument syntax.
.bu
If the profiled program exits without calling the profile exit routine
(e.g. by calling 'error' rather than using 'stop', from Ratfor)
no profile data file will be created.
.sp
The system clock only has a resolution of 1/330 second, so 'profile'
may not be accurate in timing short routines.
.sp
Procedure call overhead is charged to the calling routine rather
than to the called routine.
.sa
rp (1), st_profile (1), t$entr (6), t$exit (6), t$time (6)
