#  lfo --- list files a user has opened

   include PRIMOS_ERRD
   include "lfo_def.r.i"
   include "lfo_com.r.i"

   integer getarg, ctoi
   integer buf (MAXLINE)
   integer i, ap, pid, code

   define (DB,#)

   space = FALSE
   call gmetr$ (1, loc (sys_info), 13, code, 0)

   if (getarg (1, buf, MAXARG) == EOF)
      do pid = 1, nusr
         call list_info (pid)
   else
      for (ap = 1; getarg (ap, buf, MAXARG) ~= EOF; ap += 1) {
         i = 1
         pid = ctoi (buf, i)
         if (pid >= 1 && pid <= nusr)
            call list_info (pid)
         else if (pid == 0)   {  # may be a user name
DB          call print (ERROUT, "user = *s*n"s, buf)
            for (i = 1; buf (i) ~= EOS; i += 1)
               buf (i) = mapup (buf(i))
            call list_uinfo (buf)
            }
         }

   stop
   end



#  list_info --- list information for a single process

   subroutine list_info (xpid)
   integer xpid

   include "lfo_com.r.i"

   integer i, code
   real cpused, ioused
   character buf (MAXLINE)


   call getupn (xpid, 1, buf, MAXLINE, i, code)
   if (code == ENRIT || code == EUNIU)    # not allowed or not logged in
      return

   call gmetr$ (4, loc (user_info), 43, code, xpid)
   cpused = cptime * float (cptick) / 1000000.0
   ioused = iotime / float (clrate)
   call ptoc (name, ' 'c, buf, 32)

   if (space)
      call putch (NEWLINE, STDOUT)
   else
      space = TRUE

   call print (STDOUT, "*s (*i) cp = *r, io = *r*n"s, buf, xpid, cpused, ioused)

   call list_item (xpid, INITIAL, "ID"s)
   call list_item (xpid, HOME,    "HD"s)
   call list_item (xpid, CURRENT, "CD"s)

   do i = 0, 127; {
      call itoc (i, buf, 10)
      call list_item (xpid, i, buf)
      }

   return
   end



#  list_item --- retrieve a single name for a given file unit

   subroutine list_item (xpid, xfunit, xname)
   integer xpid, xfunit
   character xname (ARB)

   integer len, code
   character ptree (MAXTREE), tree (MAXTREE), path (MAXPATH)


   call getupn (xpid, xfunit, ptree, MAXTREE*2, len, code)
   if (code == 0) {
      call ptoc (ptree, ' 'c, tree, MAXTREE)
      call mkpa$ (tree, path, NO)
      call print (STDOUT, "   *-3s = *s*n"s, xname, path)
      }
   elif (code == EIREM)
      call print (STDOUT, "   *-3s = pathname not obtainable*n"s, xname)

   return
   end

#  list_uinfo --- list information for a user "xname"

   subroutine list_uinfo (xname)
   character xname (ARB)

   include "lfo_com.r.i"

   integer i, code, xpid, strcmp
   character buf (MAXLINE)

DB call print (ERROUT, "list_uinfo (*s)*n"s, xname)
   for (xpid = 1; xpid <= nusr; xpid += 1)   {
      call getupn (xpid, 1, buf, MAXLINE, i, code)
      if (code ~= ENRIT && code ~= EUNIU) {  # not allowed or not logged in
         call gmetr$ (4, loc (user_info), 43, code, xpid)
         call ptoc (name, ' 'c, buf, 32)
DB       call print (ERROUT, "   checking *s*n"s, buf)
         if (strcmp (buf, xname) == 2)   {
DB          call print (ERROUT, "   names match*n"s)
            call list_info (xpid)
            }
         }
      }
   return
   end
