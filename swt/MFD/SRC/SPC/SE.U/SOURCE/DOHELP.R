# dohelp --- display documentation about editor while in editor

define (readable(file), filtst (file, 0, 0, 1, 0, 1, 0, 0))
# test for existence and readability of a file

   subroutine dohelp (lin, i, status)
   character lin (ARB)
   integer i, status

   include SE_COMMON

   character filename (MAXARG)
   character unix_help (MAXARG)
   integer fd, l
   integer open, scopy
   integer filtst
   integer k

   SKIPBL (lin, i)
   if (lin (i) == NEWLINE)
      call scopy ("=doc=/se_h/elp"s, 1, filename, 1)
   else {   # build file name from text after "h"
      l = scopy ("=doc=/se_h/"s, 1, filename, 1)
      l += scopy (lin, i, filename, l + 1)
      filename (l) = EOS               # clobber newline character
      }

   call encode (unix_help, MAXARG, "*s_unix"s, filename)

   if (Unix_mode == YES && readable (unix_help) == YES) # Use UNIX version of help
      call scopy (unix_help, 1, filename, 1)
   # else
      # use regular help file

   status = OK
   fd = open (filename, READ)
   if (fd == ERR) {
      status = ERR
      Errcode = ENOHELP
      }
   else {      # status is OK
      call display_message (fd)  # display the help script
      call close (fd)
      }

   return
   end
