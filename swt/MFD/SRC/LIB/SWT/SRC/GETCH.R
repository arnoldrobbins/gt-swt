# getch --- get a character from a file

   character function getch (c, fd)
   character c
   integer fd

   character buf (2)
   integer getlin

   c = getlin (buf, fd, 2)
   if (c ~= EOF)
      c = buf (1)

   return (c)

   end
