# pmacl --- assemble and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp s = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].s]
      error [source].s": can't open"
   fi

   pmac [source].s [argsto / 1]
   ld -o [source] [source].b [argsto / 0 2]
