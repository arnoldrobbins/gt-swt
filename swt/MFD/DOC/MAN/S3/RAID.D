.hd raid "examine bug reports" 01/15/83
[cc]mc |
raid [-(a | p)]
[cc]mc
.ds
'Raid' allows a user to examine bug reports submitted
with the 'bug' command.  'Raid' expects to find a variable
named 'lastbug' in the global environment (you can create
it by entering "set lastbug = 0") containing the number of
the last bug report examined.  If the "-a" option is
present, 'raid' prints all bug reports; otherwise it
prints only those reports that have not been seen.
If the "-p" option is present, 'raid' spools the bug
for printing; otherwise, they are displayed on the terminal
with 'pg'.
.sp
If you wish to be notified of new bug reports as they
occurs, place the following command in your "_hello"
variable, or in a shell program that is executed by
"_hello" variable:
.sp
.nf
   if [eval lastbug < [=ebin=/bugn]]
      echo "You have bugs."
   fi
.fi
.sp
.es
raid
raid -ap
.fl
.in +5
.ti -5
=bug=/r??? for storage of the bug report
.ti -5
=bug=/s??? for storage of the user's environment at the time the
bug was reported
.in -5
.me
"Usage: raid ..." for improper command syntax
.sa
bug (3)
