# vt$dsw --- garbage collect the DFA

   subroutine vt$dsw

   include SWT_COMMON

   integer found, tbl, ent, i, ct

   ct = 0
   repeat {

      found = NO
      do tbl = 1, MAXESCAPE
         if (Fn_used (tbl) == YES) {
            do ent = 1, CHARSETSIZE
               if (Fn_tab (ent, tbl) ~= EOS)
                  next 2
            found = YES
            break
            }

      if (found == NO)
         break

      Fn_used (tbl) = NO      # return the table

      do i = 1, MAXESCAPE     # remove all references to the table
         if (Fn_used (i) == YES)
            do ent = 1, CHARSETSIZE
               if (Fn_tab (ent, i) == GET_NEXT_TABLE + tbl)
                  Fn_tab (ent, i) = EOS

      ct += 1
      }

DEBUG call vtprt (20, 1, "vt$dsw: *i tables returned"s, ct)

   return
   end
