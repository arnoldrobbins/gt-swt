# whereis --- print location of a terminal

   declare _search_rule = "^int,^var,=bin=/&"

   if [nargs]
      if [cmp '-' == [arg 1]]
         cat =termlist=
      else
         find %[arg 1]" " =termlist=
      fi
   else
      error "Usage: whereis ( <line number> | - )"
   fi
