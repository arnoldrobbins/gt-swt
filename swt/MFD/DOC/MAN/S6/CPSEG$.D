.hd cpseg$ "copy one open segment directory to another" 01/05/83
subroutine cpseg$ (ifd, ofd, rc)
integer ifd, ofd, rc
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Cpseg$' expects 'ifd' to contain the Primos file unit of a segment
directory open for reading and 'ofd' to contain the Primos file unit
of an empty segment directory open for writing.  'Cpseg$' attempts
to make an exact copy of the input segment directory in the output
segment directory.  If it is successful, it sets 'rc' to OK; otherwise,
it sets 'rc' to ERR.
.im
'Cpseg$' scans the open segment directory with the Primos routine
SGDR$$, calling 'cpfil$' to copy files,
and calling itself recursively to copy nested segment directories.
.am
rc
.ca
cpfil$, cpseg$, Primos sgdr$$, Primos srch$$
.sa
cpfil$ (6), filcpy (2)
