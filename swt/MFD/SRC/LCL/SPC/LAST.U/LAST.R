# last --- high speed line count and last n line print of file
#   ehs  6/80, modified 1/29/81; 5/3/81; 5/19/81


   include ARGUMENT_DEFS

   integer open, mapfd, isatty, gfnarg, mktemp, getlin
   long_int last

   file_des fd, funit
   integer path (MAXPATH), lne_cnt, is_temp
   integer i, j, lne (MAXLINE), state (4)
   long_int sze
   logical print_text, print_count
   ARG_DECL
   string usage "Usage: last [-t ] [ -c] [-l<#>] [-v] [-n<#> | -n | {<pathname>}]"

   ARG_DEFAULT_INT(l, 20)

   PARSE_COMMAND_LINE ("l<ri>v<f>t<f>c<f>n<ign>"s, usage)

   if (ARG_PRESENT(l))
      lne_cnt = ARG_VALUE(l)
   else
      lne_cnt = 20

   print_count = ARG_PRESENT(c)
   print_text = ((~ARG_PRESENT(c)) | ARG_PRESENT(t))

   state(1) = 1

   repeat {
      is_temp = NO
      if (gfnarg (path, state) == EOF)
         stop
      else {
         fd = open (path, READ)
         if (fd == ERR)
            call cant (path)
         }

      if (isatty (fd) == YES) {
         j = mktemp (READWRITE)
         call fcopy (fd, j)
         fd = j
         is_temp = YES
         }

      call rewind (fd)
      call flush$ (fd)
      funit = mapfd (fd)
      if (funit == ERR)
         call error ('error in mapfd.')

      sze = last (funit, lne_cnt)
      if (sze < 0) {
         call print (ERROUT, "*s: "s, path)
         call error ('error in "last".'s)
         }

      if (print_count) {
         call print (STDOUT, "*6l"s, sze)
         if (ARG_PRESENT(v))
            call print (STDOUT, " lines | *s"s, path)
         call print (STDOUT, "*n"s)
         }

      if (ARG_PRESENT(v) & ~print_count)
         call print (STDOUT, " *s*n"p, path)

      if (print_text) {
         if (lne_cnt > 0)
            call fcopy (fd, STDOUT)
         else {
            call rewind (fd)
            for (j = 1; j <= -lne_cnt; j +=1) {
               if (getlin (lne, fd, MAXLINE) == EOF)
                  break
               call putlin (lne, STDOUT)
               }
            }
         }

      if (is_temp == YES)
         call rmtemp (fd)
      }
   end
