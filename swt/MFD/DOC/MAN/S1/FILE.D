.hd file "test information about a file" 04/03/82
file <pathname> {<option>}
<option> ::= -d | -[n]e | -p twrtwr | -[n]r |
             -s | -u | -[n]w | -[n]z
.ds
'File' tests the specified pathname for certain conditions.
'File' only operates on
one pathname per call and can only test
for all specified conditions true (the and-product of all
conditions).
If no conditions are given, 'file' assumes the "-e" option.
All other tests must be specifically
turned on.
The output of 'file' is a "1" or "0" depending on whether
the conditions were all true or one or more was false.
.sp
'File' is most commonly used with the 'if' command.
.sp
The options available are:
.sp
.na
.nf
-d         file type is DAM (direct access)
-[n]e      test for the [non] existence of <pathname>
-p twrtwr  test for specific protection bits on
-[n]r      test for [no] read permission on <pathname>
-s         file type is SAM (sequential access)
-u         file type is UFD (directory)
-[n]w      test for [no] write permission on <pathname>
-[n]z      test <pathname> for [non] zero length
.fi
.ad
.es
if [file [arg 1] -ne]
   echo [arg 1] does not exist
   exit
fi
.me
.in +5
.ti -5
"Usage: file ..." for illegal argument syntax.
.sp
.ti -5
"<pathname>: cannot test conditions" if 'filtst' returned an error
in trying to test the pathname.
.sp
.ti -5
Primos file system errors will be noted if found.
.in -5
.bu
Should accept multiple pathnames.
.sp
Should probably have an option to test for 'or' of arguments
as well as 'and' of arguments.
.sp
Accepts only an obsolete syntax for the file protection argument.
.sa
if (1), chat (1), lf (1), find$ (2)
