[cc]mc |
.hd until "terminate a loop statement" 09/05/84
repeat
   { <command> }
until @[ <value> ]
.ds
'Until' marks the end of a 'repeat' loop. It actually does nothing
and is just searched for by the 'repeat' statement when it is in
the process of pre-processing a loop. Each 'repeat' command must
be followed by a matching 'until' command.
.es
repeat
   echo This terminal is taken
until                            # infinite loop
.sp
repeat
   hd swt
   lf
until [eval [template =date=] == 110284]
.sa
if (1), then (1), else (1), fi (1), case (1), repeat (1)
[cc]mc
