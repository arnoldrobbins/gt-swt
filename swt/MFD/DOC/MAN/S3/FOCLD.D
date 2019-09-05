.hd focld "send FOCAL-GT/RT programs to the GT40" 02/23/82
focld <filename>
.ds
'Focld' is used to prepare a FOCAL program stored on the Prime for
acceptance by FOCAL-GT/RT.  'Focld' is used from FOCAL in the following
manner:
.sp
.nf
    Type control-f.
    Type your "kill" character.
    Without hitting return, type: focld <filename>
    Type control-t.
    Hit return.
    Wait while the program loads.
    Type control-t and control-f and you will be talking
       to FOCAL.
.fi
.sp
It is advisable to study section 3.1 and figure 3-1 of the
[ul FOCAL-GT/RT User's Manual] to understand the above procedure
and to develop the procedure for saving FOCAL programs.
.es
focld life
focld chess
.bu
Locally supported.
.sa
as11 (3),
.ul
FOCAL-GT/RT User's Manual
