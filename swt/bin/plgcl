# plgcl --- PL1G compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp plg = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].plg]
      error [source].plg": can't open"
   fi

   plgc [source].plg [argsto / 1]
   ld -p -o [source] [source].b [argsto / 0 2]
