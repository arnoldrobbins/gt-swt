.hd fi "terminate conditional statement" 03/20/80
if <value>
   then
      { <command> }
   else
      { <command> }
.br
fi
.ds
'Fi' marks the end of a conditional statement.
It is a do-nothing command that may be searched for by either
'if' or 'else' in the process of skipping commands.
Each 'if' command must be followed by a matching 'fi' command.
.sp
.nh
If a terminal is locked up due to an unmatched 'if' or 'else',
the 'fi' command may be used to regain control.
.hy
.es
if [eval [line] ">" 33]
   then
      set type = phantom
   else
      set type = terminal
fi
.sp
if [cmp [login_name] ~= ICS002]
   echo "Sorry, you can't use this program."
   goto exit
fi
.bu
I/o redirectors placed before 'fi' render it unrecognizable to
'if' and 'else'.
.sa
if (1), then (1), else (1), case (1)
