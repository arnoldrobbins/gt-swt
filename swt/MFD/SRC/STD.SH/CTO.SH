# cto --- copy up to a delimiting line

   declare _search_rule = "^int,=bin=/&,^var"

   if [nargs]
      slice -i % -x %[arg 1 | quote]$
   else
      slice -i % -x %-EOF$
   fi
