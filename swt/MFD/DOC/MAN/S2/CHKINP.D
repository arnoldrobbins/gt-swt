.hd chkinp "check for terminal input availability" 03/24/80
logical function chkinp (flag)
logical flag
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Chkinp' returns the value ".true." if there are characters waiting
to be read in the user's terminal buffer.  Otherwise, 'chkinp'
returns ".false.".
.im
'Chkinp' enters 64R addressing mode and executes the instruction

      SKS    '704

(which is trapped and interpreted by Primos).
If the instruction skips, 'chkinp' reenters 64V mode and returns
".true.".  Otherwise, it reenters 64V mode and returns ".false.".
.am
flag
