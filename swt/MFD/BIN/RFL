# rfl --- Ratfor, Fortran and load a file for V-mode execution

   declare src _search_rule = "^int,=bin=/&,^var"

   if [nargs]
      set src = [arg 1]
   else
      if [declared f]
         set src = [f]
      else
         error "no source file."
      fi
   fi

   if [cmp r = ""[basename -s [src]]]
      set src = ""[basename -f [src]]
   fi

   if [file -ne [src].r]
      error [src].r": can't open"
   fi

   rp -a [src].r [argsto / 1]
   fc [src].f [argsto / 2]
   ld -u [src].b -o [src] [argsto / 0 2]
