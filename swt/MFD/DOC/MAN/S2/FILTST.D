[cc]mc |
.hd filtst "perform existence and size tests on a file" 09/10/84
[cc]mc
integer function filtst (path, zero, permissions, exists,
   type, readable, writeable, dumped)
character path (MAXPATH)
integer zero, permissions, exists, type
integer readable, writeable, dumped
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Filtst' may be used to perform a number of tests on a named file.
The arguments specify which tests are to be performed, in a way described
below.
The function return is YES if all tests succeeded, NO if any one
failed, or ERR if a test could not be made.
.sp
'Path' is an EOS-terminated string containing the pathname of the
file to be tested.
'Zero' is -1 if the file is to be tested for non-zero length,
1 if for zero length, and 0 if it is not to be tested for length.
'Permissions' is a bit mask of protection keys, as returned by
[cc]mc |
the Primos routines DIR$RD and ENT$RD.
[cc]mc
or 0 if protections are not to be tested.
'Exists' is -1 if the file is to be tested for nonexistence, 1 if for
existence, and 0 if it is not to be tested for existence.
'Type' is 0 if the file's type is not to be tested;
otherwise, it is the same as the file type returned by Primos
[cc]mc |
ENT$RD logically or'ed with octal 100 (to distinguish between
[cc]mc
the SAM file type and the "no test" value).
'Readable' is -1 if the file is to be tested for non-readability,
1 if for readability, and 0 if no test is to be performed.
'Writeable' is -1 if the file is to be tested for non-writeability,
1 if for writeability, and 0 if writeability is not to be tested.
'Dumped' is -1 if the file is to be tested for not being dumped,
1 if for being dumped, and 0 if the dumped bit is not to be tested.
.im
[cc]mc |
Various calls to the Primos routines SRCH$$, ENT$RD and PRWF$$
[cc]mc
are made to check the attributes specified by the arguments.
The function return is YES if and only if the results of all tests
were true, ERR if Primos detected an error during any test, NO
otherwise.
.ca
getto, Primos srch$$, open, close, Primos prwf$$,
[cc]mc |
Primos ent$rd, Primos at$hom
[cc]mc
.sa
file (1), finfo$ (6)
