# term_type --- return a string containing the user's terminal type

   integer i
   integer gttype, gtattr, strlsr, getarg

   character ttype (MAXTERMTYPE), arg (MAXARG)

   string_table spos, stxt
      TA_SE_USEABLE,  YES,  "se"       / _
      TA_SE_USEABLE,  YES,  "-se"      / _
      TA_VTH_USEABLE, YES,  "vth"      / _
      TA_VTH_USEABLE, YES,  "-vth"     / _
      TA_UPPER_ONLY,  NO,   "lcase"    / _
      TA_UPPER_ONLY,  NO,   "-lcase"   / _
      TA_SE_USEABLE,  NO,   "nose"     / _
      TA_SE_USEABLE,  NO,   "-nose"    / _
      TA_VTH_USEABLE, NO,   "novth"    / _
      TA_VTH_USEABLE, NO,   "-novth"   / _
      TA_UPPER_ONLY,  YES,  "nolcase"  / _
      TA_UPPER_ONLY,  YES,  "-nolcase"

   if (gttype (ttype) == NO)
      call error ("No terminal type information is available"p)

   if (getarg (1, arg, MAXARG) == EOF)
      call print (STDOUT, "*s*n"s, ttype)
   else {
      call mapstr (arg, LOWER)
      i = strlsr (spos, stxt, 2, arg)
      if (i == EOF) {
         call remark ("Usage: term_type [ -se   | -vth   | -lcase"p)
         call error  ("                   -nose | -novth | -nolcase ]"p)
         }
      if (gtattr (stxt (spos (i))) == stxt (spos (i) + 1))
         call print (STDOUT, "1*n"s)
      else
         call print (STDOUT, "0*n"s)
      }

   stop
   end
