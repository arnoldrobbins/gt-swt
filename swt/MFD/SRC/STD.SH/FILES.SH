# files --- list file names that match a pattern

   declare _search_rule = "^int,^var,=bin=/&"

   lf -c [args 2] | find [arg 1 | quote]
