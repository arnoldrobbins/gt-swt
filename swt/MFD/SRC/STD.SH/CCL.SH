# ccl --- compile and load a C program

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp c = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].c]
      error [source].c": can't open"
   fi

   cc [source].c [argsto / 1]
   ld -ub -o [source] [source].b [argsto / 0 2]
