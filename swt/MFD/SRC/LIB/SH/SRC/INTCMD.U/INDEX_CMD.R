# index_cmd --- find index of a character in a string

   subroutine index_cmd

   character c (2), str (MAXLINE)
   integer index, getarg

   if (getarg (1, str, MAXLINE) == EOF || getarg (2, c, 2) == EOF)
      call error ("Usage: index <string> <character>"p)

   call print (STDOUT, "*i*n"s, index (str, c (1)))

   stop
   end
