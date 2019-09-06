.hd else "introduce else-part of a conditional" 03/20/80
if <value>
   then
      { <command> }
   else
      { <command> }
.br
fi
.ds
'Else' is used in conjunction with the 'if' command to introduce
the negative portion of a conditional statement.
Paradoxically, it is executed only as control falls through from
the then-part of the conditional; its action is to skip to
the first unmatched 'fi' command.
.sp
The else-clause of a conditional is always optional.
.sp
Since 'else' works as well from the terminal as it does from a
command file, typing "else" as a command will cause the command
interpreter to skip input until it sees a 'fi' command or end-of-file.
.es
if @[eval @[line] = 10]
   then
      set term = consul
   else
      set term = unknown
fi
.sp
.sp
if @[eval @[take 2 @[time]] ">" @[deadline]]
   then
      echo "Time out."
   else
      process_job
fi
.me
.in +5
.ti -5
"Missing 'fi'" if end-of-file is seen before a 'fi' is encountered.
.in -5
.bu
Redirectors placed before the 'fi' will prevent 'else' from detecting
it.
.sa
if (1), then (1), fi (1), case (1)
