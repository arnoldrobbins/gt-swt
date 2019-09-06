# vt$def --- accept a macro definition from the user

   integer function vt$def (ch)
   character ch

   include SWT_COMMON

   integer sp, i, cl, tbl
   integer vt$alc, vt$gsq
   character delim, c
   character seq (MAXSEQ)

   if (Last_def >= MAXDEF) {
      call vt$err ("No room for definition"s)
      return (ERR)
      }

   call vtmsg ("DEFINE: Enter delimiter"s, CHAR_MSG)
   call vtupd (NO)
   call c1in (delim)

   sp = vt$gsq ("DEFINE: Enter sequence"s, delim, seq, MAXSEQ)
   if (sp == ERR)
      return (sp)

   tbl = 1
   for (i = 1; i < sp; i += 1) {
      c = Fn_tab (seq (i) - CHARSETBASE, tbl)
      select
         when (c == EOS)            # allocate a new table
            if (vt$alc (tbl, seq (i) - CHARSETBASE) == ERR) {
               call vt$err ("Too many sequences"s)
               return (ERR)
               }
         when (c < GET_NEXT_TABLE) {# It's a character or a control seq
            call vt$err ("Illegal sequence"s)
            return (ERR)
            }
         else
            tbl = c - GET_NEXT_TABLE
      }

   cl = seq (i) - CHARSETBASE
   c = Fn_tab (cl, tbl)
   select
      when (c == DEFINE, c == UNDEFINE) {
         call vt$err ("Don't try that!"s)
         return (ERR)
         }
      when (c < DEFINITION)         # it's some other character
         ;
      when (c < GET_NEXT_TABLE)     # it's a definition
         call vt$rdf (cl, tbl)
      else {                        # it's another DFA table
         call vt$err ("Illegal prefix"s)
         return (ERR)
         }

   Last_def += 1
   Def_buf (Last_def) = Fn_tab (cl, tbl)  # squirrel away the old def
   Fn_tab (cl, tbl) = Last_def + DEFINITION
   Last_def += 1

   sp = vt$gsq ("DEFINE: Enter definition"s, delim,
                  Def_buf (Last_def), MAXDEF - Last_def + 1)

   if (sp == ERR)
      return (ERR)

   Last_def += sp

   call vtmsg (EOS, CHAR_MSG)
   call vtupd (NO)
   return (OK)

   end
