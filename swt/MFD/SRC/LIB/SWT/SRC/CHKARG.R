# chkarg --- get and parse single letter arguments

   integer function chkarg (ap, result)
   integer ap, result (26)

   character arg (MAXARG)
   integer letters, position, i
   integer getarg

   letters = 0
   for (; getarg (ap, arg, MAXARG) ~= EOF && arg (1) == '-'c; ap += 1)
      for (i = 2; arg (i) ~= EOS; i += 1) {
         select
            when (IS_LOWER (arg (i)))
               position = arg (i) - 'a'c + 1
            when (IS_UPPER (arg (i)))
               position = arg (i) - 'A'c + 1
         else
            return (ERR)
         if  (result (position) < 0)
            return (ERR)
         letters += 1
         result (position) = letters
         }

   return (letters)

   end
