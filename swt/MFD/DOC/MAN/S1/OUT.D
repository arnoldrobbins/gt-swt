.hd out "specify default alternative in a case statement" 02/22/82
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
'Out' is used to flag the default alternative in a 'case' command sequence.
It should appear after any command sequences introduced by 'when'
commands, and will be selected by the 'case'
command if and only if none of the alternatives specified by 'when'
commands are taken.
.sp
'Out' is usually executed only if control falls through from the
commands under the control of a 'when'.
In this instance, commands are skipped until an unmatched 'esac'
command is found.
.sp
Use of 'out' from a terminal may cause input to be ignored until
end-of-file or the typing of an 'esac' command.
.es
case [line]
   when 12
      set location = REMOTE
   out
      set location = LOCAL
esac
.me
.in +5
.ti -5
"Missing 'esac'" if end-of-file is encountered before an 'esac' command.
.br
.in -5
.bu
'Out' is a holdover from the ALGOL 68 case-clause syntax.
.sa
case (1), when (1), esac (1), if (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
