# ed --- call the line editor from the editor library

   integer getarg
   character arg (MAXLINE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call edit (""s, STDIN, STDOUT)
   else
      call edit (arg, STDIN, STDOUT)

   stop
   end
