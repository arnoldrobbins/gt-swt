# pcl --- PASCAL compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp p = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].p]
      error [source].p": can't open"
   fi

   pc [source].p [argsto / 1]
   ld -a -o [source] [source].b [argsto / 0 2]
