# f77cl --- F77 compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp f77 = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].f77]
      error [source].f77": can't open"
   fi

   f77c [source].f77 [argsto / 1]
   ld -o [source] [source].b [argsto / 0 2]
