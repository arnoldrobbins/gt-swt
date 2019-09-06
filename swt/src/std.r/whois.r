# whois --- find the name associated with a login name

# Usage:
#    whois
#       takes login names from standard input
#    whois name1 name2...
#       performs search for the specified names
#    whois -
#       prints the entire contents of the names file


   character name (MAXLINE), buf (MAXLINE)
   integer mapup, equal, getlin, getarg, open
   integer fromsi, i, j, fd

   fd = open ("=userlist="s, READ)
   if (fd == ERR)
      call error ("user name list file not available"p)

   if (getarg (1, name, MAXLINE) == EOF)
      fromsi = YES
   else
      fromsi = NO
   if (name (1) == '-'c) {
      call fcopy (fd, STDOUT)
      call close (fd)
      stop
      }
   i = 1

   repeat {
      if (fromsi == YES) {
         if (getlin (name, STDIN) == EOF)
            break
         }
      else {
         if (getarg (i, name, MAXLINE) == EOF)
            break
         i += 1
         }
      for (j = 1; name (j) ~= EOS & name (j) ~= NEWLINE; j += 1)
         name (j) = mapup (name (j))
      for (; j <= MAXUSERNAME - 1; j += 1)
         name (j) = ' 'c
      name (MAXUSERNAME) = EOS
      repeat {
         if (getlin (buf, fd) == EOF)
            break
         buf (MAXUSERNAME) = EOS
         if (equal (buf, name) == YES) {
            buf (MAXUSERNAME) = ' 'c
            call putlin (buf, STDOUT)
            break
            }
         }
      call rewind (fd)
      }
   call close (fd)
   stop
   end
