# fdmlcl --- Fortran DML preprocess, compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp f = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].f]
      error [source].f": can't open"
   fi

   fdmlc [source].f
   fc [source].df [argsto / 1]
   ld -o [source] [source].b -l dmllib [argsto / 0 2]
