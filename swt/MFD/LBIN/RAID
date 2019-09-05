# raid --- display bug reports

   declare _search_rule = "^int,^var,=bin=/&,&"
   declare last = [=ebin=/bugn]
   declare pr_opt

   if [arg 1]
      if [cmp [take 1 [arg 1]] == "-"]
         if [tlit -ap "" [arg 1]]
            error "Usage: raid [-{a|p}]"
         fi
         if [tlit ~a@n "" [arg 1]]    # -a specified
            declare lastbug = 0
         fi
         if [tlit ~p@n "" [arg 1]]    # -p specified
            set pr_opt = TRUE
         fi
      else
         error "Usage: raid [-{a|p}]"
      fi
   fi

   if [eval lastbug ">=" last]
      exit
   fi

   if [pr_opt]
      iota [eval lastbug+1] [last] -f "=bug=/r*3,,0i*n*1g=bug=/s*3,,0i" _
         | pr -n
   else
      iota [eval lastbug+1] [last] -f "=bug=/r*3,,0i" | pg -n
   fi

   set lastbug = [last]
   vars -s
