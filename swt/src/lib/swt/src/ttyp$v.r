# ttyp$v --- check and set terminal type and attributes

   integer function ttyp$v (ttype)
   character ttype (ARB)

   include SWT_COMMON

   integer i, a (MAXTERMATTR)
   integer input, equal, ctoc
   character str (MAXLINE), junk (MAXLINE)
   file_des fd
   file_des open

   fd = open ("=ttypes="s, READ)
   if (fd == ERR)
      return (NO)

   ttyp$v = NO
   while (input (fd, "*s*,,,s*y*y*y*y*y*y"s,
          str, junk, a(1), a(2), a(3), a(4), a(5), a(6)) ~= EOF)
      if (equal (str, ttype) == YES) {
         call break$ (DISABLE)
         do i = 1, MAXTERMATTR
            Term_attr (i) = a (i)
         call ctoc (ttype, Term_type, MAXTERMTYPE)
         ttyp$v = YES
         call break$ (ENABLE)
         break
         }

   call close (fd)

   return
   end
