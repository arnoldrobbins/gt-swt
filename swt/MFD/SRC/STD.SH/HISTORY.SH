# history --- keep a record of Subsystem history

   declare _search_rule = "^int,^var,=bin=/&"

   if [cmp [group .guru] == 0]
      error "Must be a guru to issue this command"
   fi

   declare _quote_opt = YES
   declare name modules

   declare done = 0

   echo >=temp=/hist=pid=    # create and clean out the file

   repeat

      echo "Name:  " | tlit @n
      set name =

      echo "Modules affected:  " | tlit @n
      set modules =

      echo "Enter description of change, use 'w' and 'q' when done ..."
      pause for 2 seconds       # let the user read the instruction

      if [term_type -se]
         se =temp=/hist=pid=
      else
         ed =temp=/hist=pid=
      fi

      { echo ".m1 0@n.m2 0@n.m3 0@n.m4 0@n.rm 65"; _
        cat =temp=/hist=pid=; _
        echo ".br@n.ex" _
      } _
         | fmt >=temp=/hist=pid=

      echo @n

      echo "Name: "[name]
      echo "Modules affected: "[modules]
      echo "Description of change:"
      cat =temp=/hist=pid=

      echo @n@n
      echo "Is this acceptable (y) ?  " | tlit @n

      set done = [cmp y = [substr 1 1 [set = | tlit A-Z a-z]y]]

      if [done]
        # fall through
      else
        echo "Please Reenter...@n"
        # and loop up to the top
      fi

   until [done]

   term -nobreak

   {  echo ![day]", "[date]" "[time]; _
      echo *[name]; _
      echo $[modules]; _
      =temp=/hist=pid=> change % "#" _
      } >>=doc=/hist/history
   del =temp=/hist=pid=

   echo "Change recorded."

   term -break
