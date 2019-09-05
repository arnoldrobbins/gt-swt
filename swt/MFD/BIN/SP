# sp --- spool named files on the line printer

   declare _search_rule = "^int,^var,=bin=/&"

   cat [argsto /] >/dev/lps/b/sp.out/[argsto / 1 | join | quote]

   sema -d -32       # dequeue all waiting spooler phantoms
