.hd log "make an entry in a personal log" 02/14/82
log [ <log file> ]
.ds
'Log' is used to make entries in one of a number of user logs.
When used, 'log' appends the current date, time, and day-of-week
to the specified log file and then appends to it the contents of
standard input one, up to the next occurrence of end-of-file.
.sp
If <log file> is present, it must be the name of a file in the user's
variables storage directory; the named file is used as the log file.
If absent, the file "u.log" is used.
.sp
'Log' is frequently used to make records suitable for use in preparing
end-of-the-month time sheets and project diaries.
.es
log time_sheet
log projlog
log
.fl
=varsdir=/<log_file> for log file.
.bu
The restriction of having the log file reside in =varsdir= could
be considered a bug.
