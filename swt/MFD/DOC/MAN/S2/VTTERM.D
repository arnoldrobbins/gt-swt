[cc]mc |
.hd vtterm "read terminal characteristics file" 07/11/84
[cc]mc
integer function vtterm (term_type)
character term_type (MAXTERMTYPE)
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vtterm' is used to read in the characteristics for a terminal
and put that information into the common blocks used by the
other VTH routines. It obtains the user's terminal type and
attempts to open the terminal characteristic file. If it
[cc]mc |
succeeds, the function return is OK, otherwise ERR.
[cc]mc
The user should not call this routine
himself, but should use the routine 'vtinit' as the interface
into this routine.
.im
'Vtterm' calls 'gttype' to return the user's terminal type.
It attempts to open the file "=vth=/<term_type>" for reading,
[cc]mc |
and if it can't, it returns ERR. Otherwise, it reads
[cc]mc
the file, decodes the symbolic characteristics, places
them in the VTH common block, and then returns OK.
.am
term_type
.ca
close, ctoc, ctoi, encode, equal,
getlin, gtattr, gttype, length,
mntoc, open, strbsr, vt$alc, vt$ier
.sa
other vt?* routines (2)
