# nextln --- get line after "line"

   integer function nextln (line)
   integer line

   include SE_COMMON

   nextln = line + 1
   if (nextln > Lastln)
      nextln = 0

   return
   end
