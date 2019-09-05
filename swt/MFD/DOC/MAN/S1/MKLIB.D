.hd mklib "convert binary relocatable to a library" 02/22/82
mklib <file>
.ds
'Mklib' runs the Primos EDB program to convert the relocatable
object code output from FTN, PMA, or other compilers contained
in the file named <file>.b into a library format file
in the file named <file>.
.sp
For example,
.sp
     mklib swtlib
.sp
would convert the contents of the file named "swtlib.b" into library
format and write the result on the file named "swtlib".
.es
mklib swtlib
.me
Several possible messages from EDB.
.sa
Primos EDB command
