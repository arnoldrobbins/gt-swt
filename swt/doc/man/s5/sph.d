[cc]mc |
.hd sph "system phantom processor" 08/30/84
x sph <primos tree> [-u <user>] [-p <project>] [-g {<groups>}]
                    [-v <privilege>]
.ds
'Sph' is a SWT supplied command that enables the system administrator
to create phantoms with certain attributes (name, project, groups,
or special phantom privileges) specified. It can be run only from the
system console or, at Georgia Tech, by a user that has the .GURU group
associated with his job. 'Sph' is a primos command, so if it is to
be run from the subsystem, the 'x' command must be used to pass it
directly to primos, or it must be called through the 'sys$$' subroutine.
.sp
The required argument <primos tree> is the primos treename of the file
to phantom.
This file is a [ul Primos] command file, not a SWT shell file or
executable binary.
All the remaining arguments are optional and, except for
the '-v' option, default to the attributes that the caller currently
has. The '-u' specifies the user name of the process to create and
the '-p' option specifies the project. The '-g' option is followed by
zero or more groups that the phantom is to have. The group names should
not be preceded by a '.' (which is the Primos standard) because the
'sph' command will include them automatically. The '-v' option
allows the caller to set the privilege word (prvl) in the Primos
internal databases for the process privilege. Currently, the only
useful values for this option are zero and one. Zero prevents the
phantomed process from being able to execute 'sph' and one allows
the programs to use 'sph'.
.me
"Can't attach to <primos tree> (SPH)" for a non-attachable
directory.
.sp
"Phantom is user <pid> on <date> at <time>" for a successful
phantom.
.sp
Any Primos standard error message for any other exception
conditions (by calling Primos ERRPR$).
.es
x sph "system>cron.comi" -u cron -p lab -g guru -v 1
x sph "jeff>blerf" -u jeff -p blivnoxx -g
.bu
Locally supported until Prime supports EPF's and the SPAWN$
subroutine call.
.sp
Should probably be written for SWT, also.
.sa
cron (3)
[cc]mc
