# mktree --- function to convert path names into Primos tree names


   integer i
   integer getarg, getlin
   character line (MAXLINE), path (MAXPATH), tree (MAXTREE)

   if (getarg (1, line, MAXLINE) == EOF)
      repeat {
         i = getlin (line, STDIN)
         if (i == EOF)
            break
         line (i) = EOS    # get the NEWLINE
         call expand (line, path, MAXPATH)
         call mktr$ (path, tree)
         call putlin (tree, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
   else
      for (i = 1; getarg (i, line, MAXLINE) ~= EOF; i += 1) {
         call expand (line, path, MAXPATH)
         call mktr$ (path, tree)
         call putlin (tree, STDOUT)
         call putch (NEWLINE, STDOUT)
         }

   stop
   end
