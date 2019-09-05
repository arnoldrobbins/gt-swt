.hd flush$ "flush out a file's buffer" 02/24/82
integer function flush$ (fd)
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Flush$' is used to clean up the state of the internal Subsystem
buffers associated with an open file.
In general, this is necessary before changing access mode on a
disk file (e.g., from read to write or from character to block)
and when closing a file (to insure that all data is transferred
from the buffer to disk).
.sp
The single argument to 'flush$' is the file descriptor (returned
by 'open', 'create', or 'mktemp') of the file whose buffer is to
be flushed.
The function return is OK if the flush succeeded and ERR if it
failed.
.sp
Although it sees a great deal of use internally, 'flush$' is
practically useless to the general user.
The only circumstance in which its use might be appropriate is
when a log file or audit trail must be written to disk as
frequently as transactions occur; in such a case, the disk I/O
must not be buffered.
.im
The action of 'flush$' varies according to the device assigned
to the file and the last operation performed.
In all cases, buffer pointers and character counts must be
reinitialized.
For terminal devices, no other action is required.
If the last operation performed on a disk file was a 'putlin' or
'putch', then any pending compressed blanks must be forced out
and the buffer must be written to disk (via the Primos routine PRWF$$).
If the last operation was a 'getlin' or 'getch', then it is
necessary to back up the file's current position to the point
at which the unused portion of the buffer begins; a call
to PRWF$$ does the actual repositioning.
If the last operation was a 'writef', any words remaining in the
buffer are simply written out with PRWF$$.
Finally, if the last operation was a 'readf', the file's current
position is simply backed up by the number of unused words still
in the buffer.
.ca
dputl$, Primos prwf$$, Primos break$
