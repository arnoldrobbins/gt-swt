.hd case "case statement for shell files" 02/22/82
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
'Case' provides capabilities for conditional
execution of commands in a manner similar to the case statements
of the Algol 68 and Pascal programming languages. It allows a
group of commands to be selected for execution based upon the
value of some expression.
.sp
'Case' is always associated with a corresponding 'esac' command which
marks the end of the scope of the 'case'.
.sp
'Case' accepts one argument to determine which of the subsequent groups
of commands is to be executed. Any construct that yields a valid
argument may be used.
Each group of commands following 'case' is introduced by either
a 'when' command or an 'out' command. The 'when' command takes
a string argument which is compared with <value>. If
the two match, the associated group of commands is executed and
the remaining alternatives are skipped;
otherwise, the associated commands are skipped. This proceeds until
either an 'out' command or an 'esac' command is seen. If 'out' is seen,
the associated command group is unconditionally executed; otherwise,
the whole 'case' command results in no action.
Thus, the commands associated with an 'out' command are executed
by default, if no other alternative is selected.
.br
.ne 10
.es
case [term_type]
   when "b200"
      se -t b200 [args]
   when "diablo"
      ed [args]
   out
      echo "Unknown terminal type."
esac
.sp
.ne 14
case [login_name]
   when ICS002
      set name = Allen
      set class = 4A
   when ICS005
      set name = Dan
      set class = 6D
   when ISLAB
      set name = Perry
      set class = Staff
   out
      echo "I'm sorry, but I don't recognize you."
      set (name class) = ([login_name] UNKNOWN)
esac
.me
.in +5
.ti -5
"missing esac" when end of file is encountered before matching
'esac' command is seen
.in -5
.bu
The string on the 'when' command is not evaluated, so function
calls, iteration, etc. are not allowed there.
.sa
if (1), esac (1), out (1), when (1), goto (1)
