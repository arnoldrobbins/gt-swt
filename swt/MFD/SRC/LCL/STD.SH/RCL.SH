# rcl --- Ratfor, Fortran and load a file for V-mode execution

   declare _search_rule = "^int,^var,=bin=/&,=lbin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp r = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].r]
      error [source].r": can't open"
   fi

   (rf fc) [source].(r f)
   ld -u [source].b -o [source] [args 2]
