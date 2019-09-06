# cmp --- evaluate relation between two strings

   character str1 (MAXLINE), str2 (MAXLINE), rel (4)
   integer r, v
   integer getarg, strlsr, strcmp

   string_table relx, relt,
      / 1, 2, "<=",
      / 1, 2, "=<",
      / 1, 0, "<",
      / 2, 0, "==",
      / 2, 0, "=",
      / 1, 3, "~=",
      / 1, 3, "<>",
      / 1, 3, "><",
      / 2, 3, ">=",
      / 2, 3, "=>",
      / 3, 0, ">"

   if (getarg (1, str1, MAXLINE) == EOF
     || getarg (2, rel, 4) == EOF
     || getarg (3, str2, MAXLINE) == EOF)
      call error ("Usage: cmp <str1> <rel> <str2>"p)

   r = strlsr (relx, relt, 2, rel)
   if (r == EOF)
      call error ("bad relational operator.")

   v = strcmp (str1, str2)

   if (relt (relx (r)) == v || relt (relx (r) + 1) == v)
      call print (STDOUT, "1*n"s)
   else
      call print (STDOUT, "0*n"s)

   stop
   end
