# getrange --- get 'from' range for tlit command

   integer function getrange (array, k, set, size, allbut)
   character array (ARB), set (ARB)
   integer k, size, allbut

   include SE_COMMON

   integer i, j
   integer addset

   Errcode = EBADLIST   # preset error code

   i = k + 1
   if (array (i) == '~'c) {  # check for negated character class
      allbut = YES
      i += 1
      }
   else
      allbut = NO

   j = 1
   getrange = ERR
   call filset (array (k), array, i, set, j, size)
   if (array (i) ~= array (k)) {
      set (1) = EOS
      return
      }
   if (set (1) == EOS) {
      Errcode = ENOLIST
      return
      }
   if (j > 1 && addset (EOS, set, j, size) == NO) {
      set (1) = EOS
      return
      }

   k = i
   Errcode = EEGARB

   return (OK)

   end
