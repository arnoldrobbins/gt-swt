# ttyp$l --- list the available terminal types

   subroutine ttyp$l

   integer i, col
   integer input, length
   character ttype (MAXLINE), desc (MAXLINE)
   file_des fd
   file_des open

   define (MAXDESC, 25)

   procedure put forward

   call print (TTY, "Terminal types:*n"s)

   fd = open ("=ttypes="s, READ)
   if (fd == ERR)
      return

   col = 1

   while (input (fd, "*s*,,,s"s, ttype, desc) ~= EOF) {
      i = 1
      SKIPBL (desc, i)
      put
      }

   if (col ~= 1)
      call print (TTY, "*n"s)

   call close (fd)

   return

   # put --- put a terminal type out

      procedure put {

      if (col == 1) {
         call print (TTY, "  *8,,.s.*#s "s, ttype, MAXDESC, desc (i))
         if (length (desc (i)) > MAXDESC)
            call print (TTY, "*n"s)
         else
            col = 2
         }
      else {
         if (length (desc (i)) > MAXDESC)
            call print (TTY, "*n"s)
         call print (TTY, "  *8,,.s.*s*n"s, ttype, desc (i))
         col = 1
         }
      }

   undefine (MAXDEST)

   end
