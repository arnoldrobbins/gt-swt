# mktr$ --- convert a pathname into a treename

   integer function mktr$ (path, tree)
   character path (ARB), tree (ARB)

   procedure inchar (char) forward
   procedure back$$ forward

   integer tp, i, mfdpwd, blank
   integer index, scopy

   tp = 1
   i = 1
   SKIPBL (path, i)

   blank = NO
   select (path (i))
   when ('/'c) {
      mfdpwd = NO
      if (path (i + 1) == '/'c)  # special case two leading slashes
         for (i += 2; path (i) == '/'c; i += 1) ;
      else {
         inchar ('<'c)
         for (i += 1; path (i) ~= '/'c && path (i) ~= EOS; i += 1) {
            if (path (i) == ESCAPE) {
               i += 1
               inchar (path (i))
               }
            else if (path (i) == ':'c) {
               tp += scopy (">MFD"s, 1, tree, tp)
               mfdpwd = YES
               blank = YES
               }
            else {
               if (blank == YES)
                  inchar (' 'c)
               inchar (path (i))
               blank = NO
               }
            }
         if (path (i) ~= '/'c && mfdpwd == NO)
            tp += scopy (">MFD XXXXXX"s, 1, tree, tp)
         }
      }
   when ('\'c)
      back$$
   when (EOS)
      ;
   else {
      inchar ('*'c)
      inchar ('>'c)
      }

   for (; path (i) ~= EOS; i += 1) {
      if (path (i) == '/'c) {
         blank = NO
         while (path (i + 1) == '/'c)
            i += 1
         if (path (i + 1) ~= EOS)
            inchar ('>'c)
         }
      elif (path (i) == ':'c)
         blank = YES
      else {
         if (blank == YES)
            inchar (' 'c)
         if (path (i) == ESCAPE)
            i += 1
         inchar (path (i))
         blank = NO
         }
      }

   tree (tp) = EOS
   return (tp - 1)


   # inchar --- put a character in the tree name
   procedure inchar (char) {
      character char

      tree (tp) = char
      tp += 1
      }


   # back$$ --- intepret backslashes in a pathname
   procedure back$$ {

      local code, buf
      integer code, buf (MAXTREE)

      call gpath$ (2, 0, buf, MAXTREE * 2 - 1, tp, code)
      if (code ~= 0)
         return (ERR)
      call ptoc (buf, EOS, tree, tp + 1)
      call mapstr (tree, LOWER)

      for (tp += 1; path (i) == '\'c; i += 1) {
         repeat
            tp -= 1
            until (tp < 1 || tree (tp) == '>'c)
         }

      if (tp < 1)
         tp = 1
      tree (tp) = EOS

      if (path (i) ~= '/'c && path (i) ~= EOS)
         inchar ('>'c)
      elif (path (i) == EOS && index (tree, '>'c) == 0)
         tp += scopy (">MFD XXXXXX"s, 1, tree, tp)

      }


   end
