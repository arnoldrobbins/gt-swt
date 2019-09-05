# echo_cmd --- echo arguments onto standard output

   subroutine echo_cmd

   character arg (MAXARG)
   integer i, j
   integer getarg
   character esc

   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
      if (i > 1)
         call putch (' 'c, STDOUT)
      for (j = 1; arg (j) ~= EOS; j += 1)
         call putch (esc (arg, j), STDOUT)
      }

   if (i > 1)
      call putch (NEWLINE, STDOUT)

   stop
   end



# esc --- map  array (i)  into escaped character if appropriate
   character function esc (array, i)
   character array (ARB)
   integer i

   if (array (i) ~= ESCAPE)
      esc = array (i)
   else if (array (i+1) == EOS)   # \*a not special at end
      esc = ESCAPE
   else {
      i = i + 1
      if (array (i) == 'n'c)
         esc = NEWLINE
      else if (array (i) == 't'c)
         esc = TAB
      else
         esc = array (i)
      }
   return
   end
