# ek --- set user's erase and kill characters

   declare _search_rule = "^int,^var,=bin=/&"
   declare _quote_opt = YES


   if [nargs]
      if [term -erase [arg 1] 3| cat]
         error "Usage: ek <erase> <kill>"
      fi

      if [term -kill [arg 2] 3| cat]
         error "Usage: ek <erase> <kill>"
      fi

      set _erase = [arg 1]
      set _kill  = [arg 2]
   fi

   echo [_erase] [_kill]
