# gcdir$ --- get current directory pathname

   integer function gcdir$ (path)
   character path (ARB)

   integer curdir (MAXLINE), dirname (MAXLINE)
   integer size, code
   integer mkpa$

   call gpath$ (KCURA, 0, curdir, MAXLINE, size, code)
   if (code ~= 0)
      return (ERR)

   call ptoc (curdir, EOS, dirname, size + 1)
   call mkpa$ (dirname, path, NO)

   return (OK)
   end
