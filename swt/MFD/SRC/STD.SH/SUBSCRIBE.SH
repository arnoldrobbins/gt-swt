# subscribe --- subscribe to the Subsystem news service

   declare _search_rule = "^int,^var,=bin=/&"

   if [find %[login_name]$ -o 1 =news=/subscribers]
      error "You already have a subscription."
   else
      login_name >>=news=/subscribers
   fi
