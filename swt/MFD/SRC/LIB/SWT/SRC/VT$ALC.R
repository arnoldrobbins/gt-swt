# vt$alc --- allocate another DFA table

   integer function vt$alc (tbl, c)
   integer tbl
   character c

   include SWT_COMMON

   integer i, j

   for (i = 1; i <= MAXESCAPE && Fn_used (i) == YES; i += 1)
      ;
   if (i > MAXESCAPE)         # Is there enough room ??
      return (ERR)

   Fn_used (i) = YES
   do j = 1, CHARSETSIZE
      Fn_tab (j, i) = EOS
   Fn_tab (c, tbl) = i + GET_NEXT_TABLE
   tbl = i

   return (OK)
   end
