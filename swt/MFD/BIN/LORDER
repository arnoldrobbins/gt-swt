# lorder --- arrange library for one-pass loading

   declare _search_rule = "^int,=ebin=/&,=bin=/&"

   if [nargs]
      then
         brefs [arg 1] | tsort | bmerge [arg 1] >[arg 1].lib
      else
         error "Usage: "[arg 0]" <object_file>"
   fi
