.hd print "easy to use semi-formatted print routine" 01/07/83
subroutine print (fd, fmt, a1, a2, ...)
file_des fd
character fmt (ARB)
untyped a1, a2, ...
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Print' is an output routine designed for ease of use.
It allows the
user to specify a file on which to write, a format to control output to
the file, and any number of items to be printed.
The first argument is
the file descriptor of the file to be used for output.
The second argument
is a format string (discussed below).
The remaining arguments (zero or more)
are items to be output according to format control.
.sp
The format string is a EOS-terminated character string.  It contains
literal characters to be printed, as well as formatting control structures.
Formatting control structures consist of an asterisk (*) followed by a single
lower-case letter describing the action to be performed on the next argument
in the argument list.
For a complete list of the available formats, see the documentation
for the subroutine 'encode'.
.sp
Characters in the format string that are not associated with a format control
construct are output to the file without change.
.sp
A few examples may clarify the use of 'print'.
The following call will print two real numbers along with some
text for identification, followed by a NEWLINE, on standard output:
.sp
.nf
.ti +3
call print (STDOUT, "x = *r, y = *r*n"s, xcoord, ycoord)
.sp
.fi
This example shows how a line of output may be built up by successive
calls:
.sp
.nf
.in +5
call print (STDOUT, "absolute value = "s)
if (x < 0)
.ti +3
call print (STDOUT, "*i*n"s, -i)
else
.ti +3
call print (STDOUT, "*i*n"s, i)
.sp
.fi
.in -5
Further examples of formats may be found in the documentation for
'encode'.
.sp
For compatibility with earlier versions of the Subsystem,
packed strings will still be accepted,
but all new code should use standard EOS-terminated strings.
.im
Since Fortran passes arguments to subroutines by reference, 'print' does not
need to know the actual type of its printable arguments.
A local character buffer is declared and passed along with the arguments
to 'encode', which does the actual work of conversion.
A call to 'putlin' then writes the result to the specified file.
.ca
encode, ptoc, putlin
.bu
At most ten items may be printed.
.sa
encode (2), input (2), putlin (2), other conversion routines
('?*toc' and 'cto?*') (2)
