.hd field "manipulate field-oriented data" 03/20/80
.nf
field  [-f[<width>]]  { <column>          |
                        <column>-<column> |
                        c<column>         |
                        s<string> }
.fi
.ds
'Field' is designed for manipulation of data in formatted fields.
It is a filter that selects data from certain fields of standard input,
processes it, and copies it to standard output.
.sp
To visualize the action of field, consider the following scenario:
Imagine a blank-filled output line.
Cut out data from an input line according to column specifications.
Paste this data onto the output line at the current column position.
Move the current column position to the end of the data just pasted on.
.sp
Field provides this "cut and paste" operation as its most basic function.
The argument forms <column> (meaning data in the single column given) and
<column>-<column> (meaning all data between the given columns, inclusive)
transfer fields of data from input line to output line.  The argument
form s<string> inserts an arbitrary string (called a "padding string")
at the current position in the output line.  The last argument form
(c<column>) resets the current position in the output line to any
desired column.
.sp
If the "-f" (fixed-length output) option is selected,
field will blank-fill output lines to a fixed length as
specified by <width>.  If <width> is omitted, a value of 72 is
assumed.
In the default mode (no "-f"), trailing blanks are stripped off.
.sp
Field was first designed to ease the problem of stripping sequence
numbers from Cobol programs, and still finds most of its work at the
same sort of task.  It is, however, also useful for arranging multiple
key fields before sorting with 'sort'.
.es
cobol_prog> field 1-72 >prog.cob
file> field 5-10 s" " 1-80 | sort | field 8-87 >sorted_file
data_file> field -f80 1-80 >padded_data
.me
.in +5
.ti -5
"Usage: field ..." for incorrect argument syntax
.ti -5
"<arg>: too many padding strings" for storage area overflow
.ti -5
"<arg>: column out of range" for bad column number
.ti -5
"<arg>: too many fields" for field storage area overflow
.ti -5
"<arg>: bad column syntax" for non-numeric column
.in -5
.sa
sort (1), lam (1), change (1)
