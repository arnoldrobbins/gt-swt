# fos --- format, overstrike and spool a document

   declare _search_rule = "^int,^var,=bin=/&"

   if [nargs]
      fmt [arg 1] | os >/dev/lps/b/fos.out/f/[args 2 | join | quote]
   else
      if [declared f]
         fmt [f] | os >/dev/lps/b/fos.out/f
      else
         error "Usage: "[arg 0]" [ <file> { <spool options> } ]"
      fi
   fi

