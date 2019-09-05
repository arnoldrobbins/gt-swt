# splcl --- SPL compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp spl = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].spl]
      error [source].spl": can't open"
   fi

   splc [source].spl [argsto / 1]
   ld -o [source] [source].b [argsto / 0 2]
