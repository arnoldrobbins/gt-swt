# build --- recompile all programs in 'ext.r'

   # Usage : build [<filename>]
   #     If no arguments present, rebuild all programs in directory
   #     If <filename> present, rebuild only that program

   declare _search_rule = "^int,^var,=bin=/&"

   if [nargs]
      declare src = ""[basename -b [arg 1]]
      rp -a [src].r
      fc [src].f
      ld [src].b
   else
      files .r$ | change "%{?*}.r$" "rp -a @1.r; fc @1.f; ld @1.b" | sh
   fi
