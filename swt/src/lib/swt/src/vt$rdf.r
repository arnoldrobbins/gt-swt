# vt$rdf --- remove the definition indicated by a DFA entry

   subroutine vt$rdf (c, tbl)
   integer c, tbl

   include SWT_COMMON

   integer p, len, i, j, lim
   integer length

   lim = Fn_tab (c, tbl)         # for use in updating pointers
   p = lim - DEFINITION
   Fn_tab (c, tbl) = Def_buf (p)

   len = 1 + length (Def_buf (p + 1))     # Def_buf (p) might be EOS

   for ({i = p; j = p + len + 1}; j <= Last_def; {i += 1; j += 1})
      Def_buf (i) = Def_buf (j)

   Last_def -= len + 1

   do i = 1, MAXESCAPE
      if (Fn_used (i) == YES)
         do j = 1, CHARSETSIZE
            if (Fn_tab (j, i) >= lim && Fn_tab (j, i) < GET_NEXT_TABLE)
               Fn_tab (j, i) -= len + 1

   return
   end
