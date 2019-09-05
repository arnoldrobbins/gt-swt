# ctov --- convert EOS-terminated string to varying string

   integer function ctov (str, i, var, len)
   character str (ARB)
   integer i, var (ARB), len

   integer max

   max = (len - 1) * CHARS_PER_WORD + CHARS_PER_WORD

   for (ctov = CHARS_PER_WORD; str (i) ~= EOS && ctov < max; i += 1)
      spchar (var, ctov, str (i))

   ctov -= CHARS_PER_WORD
   var (1) = ctov

   return
   end
