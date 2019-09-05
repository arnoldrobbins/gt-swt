# plpcl --- PLP compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp plp = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].plp]
      error [source].plp": can't open"
   fi

   plpc [source].plp [argsto / 1]
   ld -o [source] [source].b [argsto / 0 2] -l plplib
