# e --- invoke the editor best suited to user's terminal

   declare _search_rule = "^int,^var,=bin=/&"

   if [nargs]
      set f = [arg 1 | quote]
   else
      if [declared f]
      else
         set f = ""
      fi
   fi

   if [term_type -se]
      if [declared se_params]
         se [se_params] [f] [args 2]
      else
         se [f] [args 2]
      fi
   else
      ed [f] [args 2]
   fi
