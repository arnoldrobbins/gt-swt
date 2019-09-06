[cc]mc |
.hd hd "summarize available disk space" 08/27/84
[cc]mc
hd [ -n | -u | -v ] { <pack id> }
.ds
[cc]mc |
'Hd' ("how's disk?")
.# it is NOT "Havailable disk"!!
prints a summary of available disk space.
[cc]mc
Zero or more <pack id>
arguments may be used to specify the disk partitions
of interest.
A <pack id>
may be the packname of the
partition (the name of the record availability table file) or its
[cc]mc |
[ul octal]
[cc]mc
logical disk number in the range 0:76 or an asterisk indicating
the disk containing the user's current directory.
If no <pack id>
arguments are given, information for all online disks,
in order of increasing logical disk number, is provided.
.sp
The format of each line of output is as follows:
.sp
.ti +5
nn: rrrrrr free  pppppp% full  ssss...
.sp
where 'nn' is the logical disk number in octal (if the disk number
is known), 'rrrrrr' is the (decimal) number of records available on the
partition, 'pppppp' is the percentage of total records on the
partition that are currently in use, and 'ssss...' is the packname of
the partition.
.sp
The "-n" and "-u" options may be used to determine the base record
size for reporting the number of available records on storage module
partitions (whose physical record size is 1024 words).
If the "-n" option is specified, the number of physical records
available is "normalized" to an equivalent number of 440 word records.
If the "-u" option is specified, the number of available physical
records is reported as is, without normalization.
If neither option is given, "-u" is assumed.
.sp
If the "-v" option is used, 'hd' will also print the number of
heads and total number of records in each partition.
.es
hd
hd swtsys user_a 10
hd -v *
hd -n cc
.fl
Record availability tables and master file directories on
all reported disks.
.me
.in +5
.ti -5
"Usage: hd ..." for incorrect argument syntax.
.ti -5
"bad packname" for unrecognized packnames or out-of-range logical
disk numbers.
.ti -5
"disk-rat unreadable" if the record availability table can't be
opened for reading.
.ti -5
"disk-rat badly formatted" for a record availability table that
does not conform to the standard format.
.ti -5
"mfd unreadable" if the master file directory on the partition can't
be opened for reading.
.ti -5
"-n and -u are mutually exclusive" if both "-n" and "-u" options are
specified.
.in -5
[cc]mc |
.bu
The name is not terribly mnemonic.
It is a holdover from the long defunct Georgia Tech Burroughs B5500.
[cc]mc
.sa
fsize (1), lf (1)
