#  ring - infinite loop to ensure permanent execution of ring process

   declare _search_rule = "^int,=ebin=/&,=bin=/&"

x chap -[line] 2
x lon  -off

:loop
   como =ring=/ring_log
   gtod
   ring
goto loop
