.hd dump "dump various internal data bases" 03/25/82
dump { ls | linked_string | sv | shell_variable
     | fd [ <num> ] | file_desc [ <num> ]
     | cm | swt_common }
.ds
'Dump' is intended to print a semi-readable dump of the
various Subsystem data areas.
It dumps any of four different data areas, based on
its arguments.  Following are descriptions of the
four different dumps.
.sp
"Ls" or "linked_string" prints
the command interpreter's
linked string storage space in a readable format.
This option produces a symbolic listing consisting of a series of
entries of the form
.sp
.in +5
address -> item
.sp
.in -5
where "address" represents an index into the linked string
storage space, and "item" is either
(1) a quoted string, representing the characters in memory
at the given address (e.g. "peruse");
(2) the word LSNULL followed by a size in parentheses,
indicating available space in the storage area
(e.g. LSNULL (1600)); or
(3) the pointer "->" followed by an address, representing a
pointer or link to another place in the storage area.
.sp
"Sv" or "shell_variable" dumps
the contents of the hash table that
stores shell variables and their contents.
For each active lexic level (currently active command file),
it produces a symbolic dump of the five hashed lists
used for variable storage.
Each item in each list consists of a variable name followed
by an equals sign (=) and the variable's value.
Both name and value are followed by indexes into the linked
string storage area.
.sp
"Fd" or "file_desc" dumps the Subsystem file descriptor
<num>.  If <num> is missing, all open file descriptors
are dumped.
.sp
"Cm" or "swt_common" dumps the remaining Subsystem common
areas.
.es
dump ls sv
dump fd 3 fd 5
dump cm fd
.sa
shtrace (1), dumpls (2), dumpsv (2), dmpcm$ (6), dmpfd$ (6),
linked string routines ('ls?*' (4))
