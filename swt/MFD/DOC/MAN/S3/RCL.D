[cc]mc |
.hd rcl "command file to rf, fc and ld a program" 08/24/84
[cc]mc
rcl <program> [ <ld arguments> ]
.ds
'Rcl' is a shell file that causes the specified Ratfor program
to be preprocessed, compiled and loaded.
The source file is expected to be named <program>.r
and the output object code is named <program>. Default
options are used on all processors.
[cc]mc |
If 'rcl' is invoked with no <program> argument,
it automatically processes the last program edited,
since it shares the shell variable 'f' with the shell program 'e'.
[cc]mc
.sp
If <ld arguments> are present, they will be presented to the loader
following
the main program binary file.   This allows the inclusion of subroutine
and library files in the object program.
.es
rcl profile
[cc]mc |
rcl math -l vswtmath
[cc]mc
.bu
Will not be supported after Version 7.
Use 'rfl' and the extended preprocessor 'rp' instead.
.sa
rf (3), fc (1), ld (1), pl1cl (1), rfl (1), rp (1)
