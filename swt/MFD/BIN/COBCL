# cobcl --- Cobol compile and load

   declare _search_rule = "^int,^var,=bin=/&"
   declare source

   if [nargs]
      set source = [arg 1]
   else
      set source = [f]
   fi

   if [cmp cob = ""[basename -s [source]]]
      set source = ""[basename -f [source]]
   fi

   if [file -ne [source].cob]
      error [source].cob": can't open"
   fi

   cobc -m [source].cob [argsto / 1]
   ld -o [source] [source].b -l vcoblb -l vkdalb [argsto / 0 2]
