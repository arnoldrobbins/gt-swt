[cc]mc |
.hd sema "manipulate user semaphores" 08/27/84
[cc]mc
.nf
[cc]mc |
sema -(w | n | t | d | c) {<semaphore>}
sema -o {<pathname>} [-i <integer>]
[cc]mc
   <semaphore> ::= integer
.fi
.ds
[cc]mc |
'Sema' gives access to Prime's user semaphores, which are available to
all users.  There is no mechanism to assure that semaphores
are used properly (i.e. - preventing deadlock or race conditions).
.sp
'Sema' performs the function indicated by its argument, on the
semaphore number or pathname given. When multiple semaphores or pathnames
are supplied, the operation given is performed on each argument in
the order listed on the command line. The functions available are:
.sp
.in +5
.ta 6
[cc]mc
.tc \
[cc]mc |
.ti -5
-w\(wait) increment the semaphore's counter.  If the resulting value
[cc]mc
is positive, enqueue on the semaphore's waiting list and block
execution (sleep) until awakened by some other process.
.sp
[cc]mc |
.ti -5
-n\(notify) decrement the counter.  If the result is positive or zero,
[cc]mc
dequeue a process from the waiting list and wake it up.
.sp
[cc]mc |
.ti -5
-t\(test) print the value of the counter (in decimal) on
[cc]mc
standard output.
.sp
[cc]mc |
.ti -5
-d\(drain) initialize a semaphore for use.  Set the counter
[cc]mc
to zero, dequeue all waiting processes and wake them up.
.sp
[cc]mc |
.ti -5
-o\(open) initialize a semaphore for use. This initializes
named semaphores for use and returns the semaphore numbers
on standard output. A semaphore is opened only if the
[cc]mc
user has read access to the pathname given and if the pathname
[cc]mc |
is on the current system. One semaphore is opened for each pathname
specified. All semaphores
opened on the same pathname are the same. This allows the user to
restrict access to the semaphores by restricting access
access to the files used to open the semaphores. This may be achieved
with access control lists or passworded directories. The numbered
semaphores (1-64) are considered always open and any attempt to open
one of them will result in an error.
.sp
.ti -5
-i\(initialize) when used with the "-o" (open) option causes
the semaphores that are opened to be initialized to the value specified.
This initialization only takes place the first time the semaphore is
opened. If multiple users have opened a semaphore, only first time
cause the initialization to take place.
Since initializing a semaphore to a positive value does not make sense,
only non-positive values are allowed. If this option is omitted,
the default is 0.
.sp
.ti -5
-c\(close) close a named semaphore. This removes the user's number from the
[cc]mc
list of current users of the semaphore and makes the semaphore
unavailable for further use for that user.
[cc]mc |
Since the numbered semaphores are always open, any attempt to close
one of them will result in an error.
.in -5
[cc]mc
.es
[cc]mc |
sema -w 1
sema -n 1 2 3
sema -t @[iota 62]
sema -d -32
set sema_number = [sema -o //system/restricted_file -i -1]
sema -c [sema_number]
[cc]mc
.me
.in +5
.ti -5
"Usage: sema ..." for nonsensical arguments.
.ti -5
[cc]mc |
"no available semaphores" when all named semaphores are allocated.
.ti -5
"<pathname>: invalid semaphore name" when the semaphore used
has not been opened.
.ti -5
"<pathname>: semaphore overflow" when another notify would exceed
the limit on the semaphore.
.ti -5
"<pathname>: on a remote disk" when the pathname
is not on the current system.
.ti -5
"<pathname>: file not found" when the file used to open a semaphore
cannot be read.
.ti -5
"<pathname>: can't open semaphore" when some unknown reason causes
an error.
.ti -5
"<integer>: initial value greater than 0" when an initial value
is specified that is greater than 0.
[cc]mc
.in -5
.sa
[cc]mc |
.ul
Prime's Subroutines Reference Guide (DOC3621-190P),
section 21,
for a complete description of semaphores as implemented in
Primos and for a description of the system calls used by 'sema'.
[cc]mc
.sp
Peter Freeman: [ul Software Systems Principles], for a discussion
of how semaphores of this type can be used.
