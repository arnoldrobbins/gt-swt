.hd bug "report a bug with system software" 02/23/82
bug
.ds
'Bug' allows users to report any problems they may encounter
with system commands or libraries.
It creates a standardized report whose existence is announced
to the system administrator at each login until
the report is examined.
'Bug' prompts for such information as the user's name,
a description of the bug, and the name of any file (e.g., program
source code or comoutput file) which helps illustrate the bug.
.es
bug
.fl
.in +5
.ti -5
=bug=/r??? for storage of the bug report
.ti -5
=bug=/s??? for storage of the user's environment at the time the
bug was reported
.in -5
.sa
raid (3)
