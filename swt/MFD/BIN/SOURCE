# source --- obtain the source code for a Subsystem command

   declare _search_rule = "^int,^var,=bin=/&"

   declare curarg = 1
   declare file srcfil

   if [nargs]
   else
        error "Usage: "[arg 0] "{ <command> | <subroutine> }"
   fi

   locate [args] | repeat
      set file =

      if [cmp [basename -s [file]]'' == a]
         ar -t [file] | find [arg [curarg]] | set srcfil =
         if [cmp ""[srcfil] == ""]
            error source for [arg [curarg]] not found
         else
            echo ==================== [file]"("[srcfil]")" ====================
            ar -p [file] [srcfil] | cat
         fi
      else
         cat -h [file]
      fi

      set curarg = [eval curarg + 1]
   until [cmp [arg [curarg]]'' == '']
