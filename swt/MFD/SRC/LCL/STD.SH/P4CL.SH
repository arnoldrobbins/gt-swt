# p4cl --- Pascal, Fortran and load a file for V-mode execution

   declare _search_rule = "^int,^var,=bin=/&,=lbin=/&"
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

   [src].p> p4c >[src].l >[src].f
   fc [src].f
   ld [src].b -o [src] -l p4clib [args 2]
