[cc]mc |
.hd vt$def "accept a macro definition from the user" o7/11/84
[cc]mc
integer function vt$def (dummy)
integer dummy
.sp
[cc]mc |
Library: vswtlb (standard Subsystem library)
[cc]mc
.fs
'Vt$def' is used to accept a macro definition from the user.
If a status line is enabled, the user is prompted, otherwise
he must remember the entry format himself. The format is
.sp
.ti +10
<del><seq1><del><seq2><del>
.sp
where <del> is a delimiter not used in either sequence,
<seq1> is the macro, and <seq2> is the substitution string.
When the macro sequence is entered, it is immediately replaced
by the substitution string. If there is no room for another
definition, no room for another substitution sequence, or
an illegal sequence is entered, the function return is ERR
and 'vt$err' is called to print an an appropriate message,
otherwise the function return is OK.
.ca
vt$alc, vt$err, vt$gsq, vt$rdf, vtmsg, vtupd, and Primos c1in
.bu
Not meant to be called by the normal user.
.sa
Primos t1in and other vt?* routines (2) and (6)
