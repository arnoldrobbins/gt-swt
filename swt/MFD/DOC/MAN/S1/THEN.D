.hd then "introduce the then-part of a conditional" 03/20/80
if [ <value> ]
   then
      { <command> }
   else
      { <command> }
.br
fi
.ds
'Then' is a do-nothing command that may be used to introduce the
"affirmative" or "asserted" part of a conditional statement.
It is available solely for the purpose of improving the appearance
of conditional statements in command files, and is always optional.
.es
if [nargs]
   then
      set file = [arg 1 | quote]
fi
.sa
if (1), else (1), fi (1), case (1)
