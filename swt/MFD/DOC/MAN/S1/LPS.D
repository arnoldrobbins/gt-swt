.hd lps "line printer status monitor" 08/17/82
lps ( <cancel> | <list> )
<cancel> ::= -c { <seq> }
<list>   ::= { -{d|m|q} | -a <dest> | -p <paper> } { <pack> }
.ds
'Lps' allows the user to cancel entries from his home spool queue,
or to list the contents of any spool queue in the system.
.sp
To cancel entries, the "-c" argument is followed by the entry
numbers to be cancelled.  If an entry does not belong to the
user, 'lps' prints an error message and leaves the entry intact.
.sp
In the absence of the "-c" argument, 'lps' lists the contents of
the spool queues on the specified disk packs, interpreting the
remaining arguments as listing constraints as follows:
.in +7
.ta 6
.tc \
.de op
.sp
.ti -5
[1]@[tc]
.en op
.op -a
list only entries that will be printed at the specified destination.
.op -d
list only entries that are deferred.
.op -m
list only entries that belong to the current user.
.op -p
list only entries that will be printed on the specified type of paper.
.op -q
print a "quiet" listing that contains no heading and lists only the
sequence number, user name, size, destination and file name of each entry
selected. (Note: this option merely controls the format of the listing
and has nothing to do with which entries are selected.)
.in -7
.sp
If multiple constraints are specified, only entries that satisfy
all constraints are listed.  If no constraints are specified, the
entire queue is listed.
.es
lps
lps -c 1 5 prt10
lps -a lpb -p narrow -q  sa sb sc
.fl
.in +5
.ti -5
/<pack>/spoolq/q.ctrl  queue control file
.ti -5
//spoolq/prt???  print files
.in -5
.me
.in +5
.ti -5
"Usage: lps ..." for improper command syntax.
.ti -5
"Can't find SPOOLQ directory on disk <pack>" if the specified disk
partition is inaccessible or does not contain a spooler queue.
.ti -5
"Can't read queue on disk <pack>" if the spooler queue on the
specified disk can't be opened for reading.
.ti -5
"<seq>: bad sequence number" for illegal syntax in specifying
a print file.
.ti -5
"<print_file>: in use" for trying to cancel a print file that
is either being printed or still being written.
.ti -5
"<print_file>: can't cancel" when an unexpected error occurs while
cancelling a print file.
.ti -5
"<print_file>: not found" for trying to cancel a non-existent print
file.
.ti -5
"<print_file>: not yours" for attempting to cancel someone else's
print file.
.in -5
.sa
sp (1), pr (1)
