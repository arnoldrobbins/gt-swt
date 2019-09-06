# build --- recompile all programs in 'ext.c'

   declare _search_rule = "^int,^var,&,=bin=/&"

   files .c$ | change "%{?*}.c$" "cc @1.c; ld -ub @1.b" | sh
