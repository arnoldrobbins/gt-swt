.hd esac "mark the end of a case statment" 03/20/80
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
'Esac' is a do-nothing command used to mark the end of a case statement.
It may be searched for by the 'case', 'when', or 'out' commands.
Every 'case' command must be followed by a matching 'esac' command.
.sp
'Esac' may be used to regain control of a terminal after execution
of a 'when' or 'out' command.
.es
case @[time]
   when 12:00:00
      echo "LUNCHTIME!!!"
   when 17:00:00
      echo "t i m e   t o   g o   h o m e . . ."
   out
      echo "Back to Work."
esac
.bu
.in +5
.ti -5
Redirectors before 'esac' prevent its recognition by 'when', 'out',
and 'case'.
.br
.in -5
.sa
case (1), when (1), out (1), if (1)
