# getwrd --- get next word from line at position i; increment i

   integer function getwrd (line, i, word, size)
   integer i, size
   character line (ARB), word (size)

   integer j

   SKIPBL (line, i)
   j = 1
   while (line (i) ~= ' 'c && line (i) ~= NEWLINE && line (i) ~= EOS) {
      if (j < size) {
         word (j) = line (i)
         j += 1
         }
      i += 1
      }

   word (j) = EOS

   return (j - 1)
   end
