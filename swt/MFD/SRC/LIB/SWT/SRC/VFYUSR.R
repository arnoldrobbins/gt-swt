# vfyusr --- function to see if a username really exists

   integer function vfyusr (user)
   character user (ARB)

   character key (MAXUSERNAME), line (MAXLINE)
   integer len
   integer ctoc, getlin, length, strcmp
   filedes fd
   filedes open

   if (length (user) >= MAXUSERNAME)   # too long... don't bother testing
      return (ERR)

   fd = open ("=userlist="s, READ)
   if (fd == ERR) {
      call remark ("in vfyusr: can't read user list"p)
      return (ERR)
      }

   for (len = ctoc (user, key, MAXUSERNAME) + 1;
                                          len < MAXUSERNAME; len += 1)
      key (len) = ' 'c     # pad with blanks to maximum length
   key (MAXUSERNAME) = EOS

   call mapstr (key, UPPER)

   vfyusr = ERR   # assume the worst
   while (getlin (line, fd) ~= EOF) {
      line (MAXUSERNAME) = EOS      # truncate line after login name
      select (strcmp (line, key))
         when (2) {  # name just read equals key
            vfyusr = OK
            break
            }
#        when (3)    # name just read is greater than key
#           break
      }

   call close (fd)

   return
   end
