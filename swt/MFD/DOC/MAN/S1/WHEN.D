.hd when "flag alternative in a case statement" 02/22/82
case <value>
   when <alternative1>
      { <command> }
   when <alternative2>
      { <command> }
   ...
   out
      { <command> }
.br
esac
.ds
'When' is used by the 'case' command to flag alternatives in a
multi-way comparison.
The argument of 'when' is tested by 'case', and if it is found
to be equivalent to <value>, then the group of statements following
'when' is executed.
In this function, 'when' is similar to the case statement in the
language C.
.sp
'When' itself is executed only when control falls out of the series
of commands controlled by the previous 'when'.
The action taken in this case is to skip until the next unmatched
'esac' is seen.
In this respect, 'when' and 'out' are identical.
.sp
Like 'out' and 'else', if executed from a terminal without proper
termination by an 'esac', 'when' will cause the shell to skip input
until end-of-file is seen.
.es
case [line]
   when 10
      se -t adds [arg 1]
   when 15
      se -t b200 [arg 1]
   out
      ed [arg 1]
esac
.me
.in +5
.ti -5
"Missing 'esac'" if end-of-file is seen before an 'esac' command.
.br
.in -5
.bu
Redirectors before the 'esac' prevent 'when' from spotting it.
.sp
The string given as the argument to 'when' is not evaluated; therefore,
function calls and iteration groups are not allowed.
.sa
case (1), out (1), esac (1), if (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
