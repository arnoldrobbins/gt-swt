# pr --- print named files on the line printer

   declare _search_rule = "^int,^var,=bin=/&"

   print -p [argsto / | quote] _
      >/dev/lps/b/print/[argsto / 1 | join | quote]

   sema -d -32       # dequeue all waiting spooler phantoms
