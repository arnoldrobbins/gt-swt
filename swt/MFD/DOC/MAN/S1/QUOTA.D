[cc]mc |
.hd quota "read and set disk record quota limits" 09/05/84
quota [-s <quota limit>] [-v] {<file_spec>}
.ds
It is possible to set an upper limit to the number of disk records
that may be used in a directory.  This command may be used to read
or set the quota limits on any directory.
Use of the 'quota' command
without the "-s" argument will result in a display of the form:
.sp
.ce
a/b (c)
.sp
where 'a' is the total number of records currently used in the
directory and all of its descendants, 'b' is the current quota, and
'c' is the time-record product; the time record product is a measure of
how many records have been in use over time in this directory and
may be used in accounting.
.sp
Use of the "-s" option will set the quota for the named directory.
The argument after the "-s" must decode to a positive-valued long
integer.  If the value is zero then quota limits are removed from the
directory.
.sp
Note that [ul no] error is reported if the user should set the maximum
quota to a value less than the number of records currently used.
Should this event occur, no files or directories may be created in the
directory, nor may any existing files be expanded.
.sp
See the help on 'cat' for a full description of the meaning
of <file_spec>.
.es
quota /u(a b c)/spaf -s 0
quota foobar/junk
.me
"Usage: quota ..." for improper arguments.
.br
"<pathname>: can't get quota information" for various file system
errors or lack of access rights.
.br
"<pathname>: not a quota directory"; self-explanatory.
.br
"improper quota value" for invalid value of <quota limit>.
.br
"<pathname>: can't set quota" for various file system
errors or lack of access rights.
.sa
cat (1), gfdata (2), sfdata (2)
[cc]mc
