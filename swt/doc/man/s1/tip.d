.hd tip "check if terminal input is pending" 02/25/82
tip
.ds
'Tip' checks to see if there is any terminal input pending.
If terminal input is waiting to be read, 'tip' outputs a
"1". If no terminal input is waiting to be read, 'tip'
outputs a "0".
.sp
'Tip' is most commonly used with the 'if' command.
.es
if [tip]
   @[set =]
fi
.bu
Should probably be able to check an assigned terminal
line for pending input.
.sa
if (1), chkinp (2)
