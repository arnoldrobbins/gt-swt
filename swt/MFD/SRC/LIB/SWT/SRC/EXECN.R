# execn --- execute program named by a quoted string

   subroutine execn (name)
   integer name (ARB)

   character path (MAXSTR)

   call ptoc (name, '.'c, path, MAXSTR)
   call exec (path)

   return
   end
