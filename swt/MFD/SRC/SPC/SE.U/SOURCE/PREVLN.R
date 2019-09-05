# prevln --- get line before "line"

   integer function prevln (line)
   integer line

   include SE_COMMON

   prevln = line - 1
   if (prevln < 0)
      prevln = Lastln

   return
   end
