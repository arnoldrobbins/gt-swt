# locate --- find the location of Subsystem source code

   declare _search_rule = "^int,^var,=bin=/&"
   declare i key

   case [arg 1 | tlit A-Z a-z]
      when "-cmd"
         set key = c
         set i = 2
      when "-sub"
         set key = s
         set i = 2
      out
         set key = ?
         set i = 1
   esac

   { find %[key]"|"([args [i] 999 2 | tlit A-Z a-z])"|" =src=/misc/srcloc } _
      | change "%?|?*|"
