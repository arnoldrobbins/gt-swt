# vt$db2 --- print the contents of the terminal input tables

   subroutine vt$db2

   include SWT_COMMON

   integer i, j
   character str (MAXLINE)

   for (i = 1; i <= MAXESCAPE; i += 1)
      if (Fn_used (i) == YES) {
         call print (ERROUT, "------ Table *i ------*n"s, i)
         for (j = 1; j <= CHARSETSIZE; j += 1) {
            if (Fn_tab (j, i) < 0)
               call print (ERROUT, "*4i"s, Fn_tab (j, i))
            else if (Fn_tab (j, i) >= GET_NEXT_TABLE)
               call print (ERROUT, "*3in"s, Fn_tab (j, i) - GET_NEXT_TABLE)
            else if (Fn_tab (j, i) >= DEFINITION)
               call print (ERROUT, "*3id"s, Fn_tab (j, i) - DEFINITION)
            else if (Fn_tab (j, i) >= 1000)
               call print (ERROUT, "*3ic"s, Fn_tab (j, i) - 1000)
            else {
               call ctomn (Fn_tab (j, i), str)
               call print (ERROUT, " *3s"s, str)
               }
            if (mod (j, 16) == 0)
               call print (ERROUT, "*n"s)
            }
         }
   return
   end
