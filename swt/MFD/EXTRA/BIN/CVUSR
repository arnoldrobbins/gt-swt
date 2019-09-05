# cvusr --- convert the userlist to Rev 19 format

   if [eval [nargs] ~= 2]
      error "Usage: "[arg 0]" old_userlist new_userlist"
   fi

   if [eval [arg 1] = [arg 2]]
      error old user list is new user list!!
   fi

   #                                    1         2
   #                           12345678901234567890123456
   [arg 1]> change "%??????" "&                          " >[arg 2]
