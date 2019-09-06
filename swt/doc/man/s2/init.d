[cc]mc |
.hd init "initialize a Subsystem program" 08/28/84
[cc]mc
subroutine init
.sp
Library:  vswtlb (standard Subsystem library)
.fs
[cc]mc |
At version 8.1 of the Subsystem, 'init' became obsolete.
It remains to help users find programs which were compiled
before Release 8.1.
It will print the following error message:
.sp
.nf
     You are trying to run a pre-version 9 compilation.
     Please recompile and try again.
.fi
.sp
and then exit to the Subsystem.
.sp
'Init' should not be used in new compilations.
The Ratfor preprocessor 'rp'
[cc]mc
no longer automatically inserts a call to 'init' in each main program
it processes.
Users should remove all references to 'init' from their
programs, and recompile as soon as possible.
[cc]mc |
.sp
The Version[bl]8 compatibility library,
which allowed the use of programs compiled before Release 8.1,
is no longer supported.
[cc]mc
