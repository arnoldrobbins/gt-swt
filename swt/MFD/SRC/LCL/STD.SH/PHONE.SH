# phone --- find the phone number of someone

   declare _search_rule = "^int,=bin=/&,=lbin=/&"

   find [echo [args] | tlit A-Z a-z | quote]"" =phonelist=
