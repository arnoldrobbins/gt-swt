# vt$ndf --- remove a definition specified by the user

   integer function vt$ndf (ch)
   character ch

   include SWT_COMMON

   integer sp, tbl, i, cl
   integer vt$gsq
   character delim, c
   character seq (MAXSEQ)

   call vtmsg ("UNDEFINE: Enter delimiter"s, CHAR_MSG)
   call vtupd (NO)
   call c1in (delim)

   sp = vt$gsq ("UNDEFINE: Enter sequence"s, delim, seq, MAXSEQ)
   if (sp == ERR)
      return (ERR)

   tbl = 1
   for (i = 1; i < sp; i += 1) {
      c = Fn_tab (seq (i) - CHARSETBASE, tbl)
      if (c < GET_NEXT_TABLE) {
         call vt$err ("Sequence not defined"s)
         return (ERR)
         }
      tbl = c - GET_NEXT_TABLE
      }

   cl = seq (i) - CHARSETBASE
   c = Fn_tab (cl, tbl)
   if (c < DEFINITION || c >= GET_NEXT_TABLE) {
      call vt$err ("Sequence not defined"s)
      return (ERR)
      }
   call vt$rdf (cl, tbl)
   call vt$dsw

   call vtmsg (EOS, CHAR_MSG)
   call vtupd (NO)
   return (OK)

   end

