# getwrd --- get non-blank word from in(i) into out, increment i

   integer function getwrd (in, i, out)
   integer in (ARB), out (ARB)
   integer i, j

   SKIPBL (in, i)

   for (j = 1; in (i) ~= EOS && in (i) ~= ' 'c && in (i) ~= NEWLINE;
                              {i += 1; j += 1})
      out (j) = in (i)
   out (j) = EOS

   return (j - 1)
   end
