# rfc --- Ratfor and Fortran a file

   declare src _search_rule = "^int,=bin=/&,^var"

   if [nargs]
      set src = [arg 1]
   else
      error "Usage: "[arg 0]" <file> <'rp' args> / <'fc' args>"
   fi

   if [cmp r = ""[basename -s [src]]]
      set src = ""[basename -f [src]]
   fi

   if [file -ne [src].r]
      error [src].r": can't open"
   fi

   rp -a [src].r [argsto / 0 2]
   fc [src].f [argsto / 1]
