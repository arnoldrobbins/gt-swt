# vt$db3 --- dump the definitions for debugging

   subroutine vt$db3

   include SWT_COMMON

   integer i
   character str (4)

   call print (ERROUT, "---- Define Table ----*n"s)
   call print (ERROUT, "Last_def=*i*n"s, Last_def)

   for (i = 1; i <= Last_def; i += 1) {
      if (mod (i, 16) == 0)
         call print (ERROUT, "*n"s)
      call ctomn (Def_buf (i), str)
      call print (ERROUT, "*4s"s, str)
      }

   return
   end
