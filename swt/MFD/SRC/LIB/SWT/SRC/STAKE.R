# stake --- take characters from a string APL-style

   integer function stake (from, to, chars)
   character from (ARB), to (ARB)
   integer chars

   integer len
   integer length, ctoc, scopy

   len = length (from)
   if (chars < 0) {
      len += chars
      if (len < 0)
         len = 0
      return (scopy (from, len + 1, to, 1))
      }
   else
      return (ctoc (from, to, chars + 1))

   end
