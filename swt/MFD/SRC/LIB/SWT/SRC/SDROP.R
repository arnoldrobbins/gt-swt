# sdrop --- drop characters from a string APL-style

   integer function sdrop (from, to, chars)
   character from (ARB), to (ARB)
   integer chars

   integer len
   integer ctoc, scopy, length

   len = length (from)
   if (chars < 0)
      return (ctoc (from, to, len + chars + 1))
   else {
      if (chars < len)
         len = chars
      return (scopy (from, len + 1, to, 1))
      }

   end
