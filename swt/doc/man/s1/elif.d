[cc]mc |
.hd elif "else-if construct for Shell programs" 09/05/84
if <value>
   then
      { <command> }
   elif <value>
      { <command> }
fi
.ds
'Elif' is used as a short form of the 'else' statement with an 'if'
statement. It does not cause another nesting level of control
statements and is useful in implementing case-like structures.
Unfortunately, <value> must be a constant in the 'elif' statement
where an else-if pair allows <value> to be a function call. This
severely limits its usefulness since the value will be known at
the time it is used.
.es
if @[eval @[line] = 10]
   then
      set term = consul
elif 7                     # always will execute, so same as an else
   then
      set term = regent
fi
.me
.in +5
.ti -5
"Missing 'fi'" if end-of-file is seen before a 'fi' is encountered.
.in -5
.bu
Redirectors placed before the 'fi' will prevent 'else' from detecting
it.
.sp
Some might consider it a bug that 'elif' takes a constant, instead
of being able to use the result of a function call.
.sa
if (1), then (1), elif (1), fi (1), case (1)
[cc]mc
