.hd bugn "process the highest bug number" 01/03/83
bugn [-i]
.ds
'Bugn' is not intended to be user-invoked; rather, it is a utility
used by the 'bug' command to aid in bug report generation.  It
determines what the highest bug number is so far; if the optional
argument "-i" is specified, it increments the bug number and replaces
the old highest bug number with the new one.  In either case, it
prints the resulting bug number on standard output.
.es
<< not to be invoked by the user >>
.fl
.in +5
.ti -5
=bug=/$ to store the current highest bug number; use of the "-i"
option causes this file to modified.
.in -5
.me
.in +5
.ti -5
"Usage: bugn ..." for improper calling sequence
.in -5
.bu
Will not handle more than 999 concurrent bug reports.
.sa
bug (3), raid (3)
