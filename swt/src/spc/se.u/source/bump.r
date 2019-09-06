# bump --- advance line number and corresponding index simultaneously

   subroutine bump (line, ix, way)
   integer line, way
   pointer ix

   include SE_COMMON

   if (way == FORWARD) {   # increment line number
      ix = Nextline (ix)
      if (ix == Line0)
         line = 0
      else
         line += 1
      }
   else {                  # decrement line number
      if (ix == Line0)
         line = Lastln
      else
         line -= 1
      ix = Prevline (ix)
      }

   return
   end
