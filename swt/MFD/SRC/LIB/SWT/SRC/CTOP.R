# ctop --- convert EOS-terminated string to packed string

   integer function ctop (str, i, pstr, len)
   character str (ARB)
   integer i, pstr (ARB), len

   integer max

   max = len * CHARS_PER_WORD

   for (ctop = 0; str (i) ~= EOS && ctop < max; i += 1)
      spchar (pstr, ctop, str (i))

   return
   end
