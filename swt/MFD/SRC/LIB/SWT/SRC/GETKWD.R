# getkwd --- get keyword type arguments from argument list

   integer function getkwd (keywd, value, length, defalt)
   character keywd (ARB), value (ARB), defalt (ARB)
   integer length

   integer i, j
   integer equal, getarg
   character arg (MAXARG)

   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1)
      if (equal (keywd, arg) == YES) {
         getkwd = getarg (i + 1, value, length)
         if (getkwd == EOF)
            break
         return
         }

   for (j = 1; j < length && defalt (j) ~= EOS; j += 1)
      value (j) = defalt (j)
   value (j) = EOS
   getkwd = j - 1

   return
   end
