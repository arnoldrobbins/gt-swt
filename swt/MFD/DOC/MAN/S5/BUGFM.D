.hd bugfm "format a bug report" 01/03/83
bugfm
.ds
'Bugfm' is not meant to be directly user-invoked; rather, it is
a utility used by the 'bug' command to solicit for bug report
information such as the name of the reporter, the name of the
command or subroutine which is suspected of having a bug, the
name of an example file which generates an error with the named
program, and a description of the error.
.sp
The time, date, and login name of the bug reporter are inserted
in the resulting bug report to allow report verification.
The resulting bug report is sent to standard output.
.es
<< should not be invoked by the user >>
.sa
bug (3), raid (3)
