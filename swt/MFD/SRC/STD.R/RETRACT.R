# retract --- retract a news article

   include ARGUMENT_DEFS

   integer ap, art_no, i, quiet
   integer getarg, remove_from_index, remove_from_archive
   integer remove_from_delivery, ctoi
   file_des indfd
   file_des open
   character arg (MAXLINE)
   ARG_DECL

   indfd = open ("=news=/index"s, READWRITE)    # use index as a lock
   if (indfd == ERR)
      call error ("can't open index file"p)

   PARSE_COMMAND_LINE ("-q"s, "Usage:  retract [-q] { <article number> }"s)
   if (ARG_PRESENT (q))
      quiet = YES
   else
      quiet = NO

   for (ap = 1; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1) {

      i = 1
      art_no = ctoi (arg, i)
      if (arg (i) ~= EOS) {
         call print (ERROUT, "*s: not an article number*n"s, arg)
         call seterr (1000)
         break
         }

      if (remove_from_index (art_no, indfd) == ERR) {
         call seterr (1000)
         break
         }
      if (remove_from_archive (art_no) == ERR) {
         call seterr (1000)
         break
         }
      if (remove_from_delivery (art_no, quiet) == ERR) {
         call seterr (1000)
         break
         }

      }

   call close (indfd)

   stop
   end


# remove_from_archive --- remove the article from the archive

   integer function remove_from_archive (art_no)
   integer art_no

   character arch (MAXLINE)

   call encode (arch, MAXLINE, "=news=/articles/art*i"s, art_no)

   call remove (arch)

   return (OK)
   end



# remove_from_delivery --- remove an article from all news boxes

   integer function remove_from_delivery (art_no, quiet)
   integer art_no, quiet

   integer l, art_ct, i
   integer getlin, vfyusr, ctoi
   filedes subfd, boxfd, tmpfd
   filedes open, mktemp
   character box (MAXLINE), subname (MAXLINE)
   character author (MAXUSERNAME), ldate (32)

   procedure copy_and_remove forward

   subfd = open ("=news=/subscribers"s, READ)
   if (subfd == ERR) {
      call remark ("can't open subscriber list"p)
      return (ERR)
      }
   tmpfd = mktemp (READWRITE)
   if (tmpfd == ERR) {
      call remark ("can't open temporary file"p)
      return (ERR)
      }

   call date (SYS_USERID, author)
   call date (SYS_LDATE, ldate)

   for (l = getlin (subname, subfd); l ~= EOF; l = getlin (subname, subfd)) {
      subname (l) = EOS
      if (vfyusr (subname) ~= OK)
         next

      call encode (box, MAXLINE, "=news=/delivery/*s"s, subname)
      boxfd = open (box, READWRITE)
      if (boxfd == ERR) {
         call print (ERROUT, "*s: can't retract*n"p, subname)
         return (ERR)
         }

      call rewind (tmpfd)
      call trunc (tmpfd)

      copy_and_remove
      if (art_ct > 0) {       # if none were left, remove the box file
         call rewind (tmpfd)
         call rewind (boxfd)
         call trunc (boxfd)
         call fcopy (tmpfd, boxfd)
         call close (boxfd)
         }
      else {
         call close (boxfd)
         call remove (box)
         }
      }

   call close (subfd)
   return (OK)


   # copy_and_remove --- copy the news box, removing the offending article

      procedure copy_and_remove {

      local line; character line (MAXLINE)
      local number; integer number

      art_ct = 0

      l = getlin (line, boxfd)
      if (l ~= EOF && line (1) ~= 'A'c)      # for compatibility, if the
         art_ct += 1                         #     are old articles in front

      while (l ~= EOF) {
         if (line (1) == 'A'c) {
            i = 8
            number = ctoi (line, i)
            if (number == art_no)
               break
            art_ct += 1
            }
         call putlin (line, tmpfd)
         l = getlin (line, boxfd)
         }
      if (l == EOF) {
         if (quiet == NO) {  # inform the user of the retraction
            call print (tmpfd, "Article #*i was retracted by *s on *s*2n"s,
                                 art_no, author, ldate)
            art_ct += 1
            }
         }
      else {
         repeat                           # Gobble up the article
            l = getlin (line, boxfd)
            until (l == EOF || line (1) == 'A'c)
         if (l ~= EOF) {
            art_ct += 1
            call putlin (line, tmpfd)     # Copy of the rest of the box
            while (getlin (line, boxfd) ~= EOF) {
               if (line (1) == 'A'c)
                  art_ct += 1
               call putlin (line, tmpfd)
               }
            }
         }
      }

   end



# remove_from_index --- remove the entry from the index (if permitted)

   integer function remove_from_index (art_no, indfd)
   integer art_no
   file_des indfd

   integer i, j, number
   integer ctoi, getlin, equal
   filedes tmpfd
   filedes mktemp
   character uname (MAXUSERNAME), pname (MAXUSERNAME), line (MAXLINE)

   call rewind (indfd)

   call date (SYS_USERID, uname)

   tmpfd = mktemp (READWRITE)
   if (tmpfd == ERR) {
      call remark ("can't open temporary file"p)
      return (ERR)
      }

   repeat {                         # find the entry in the index
      if (getlin (line, indfd) == EOF) {
         call print (ERROUT, "*i: article not found*n"s, art_no)
         return (ERR)
         }
      i = 1
      number = ctoi (line, i)
      if (number == art_no)
         break
      call putlin (line, tmpfd)
      }

   i += 1
   SKIPBL (line, i)
   for (j = 1; j < MAXUSERNAME && line (i) ~= ' 'c; {j += 1; i += 1})
      pname (j) = line (i)
   pname (j) = EOS
   if (equal (pname, uname) == NO && equal (uname, "SYSTEM"s) == NO) {
      call print (ERROUT, "*i: article not yours*n"s, art_no)
      return (ERR)
      }

   call fcopy (indfd, tmpfd)              # copy the rest

   call rewind (indfd)
   call rewind (tmpfd)

   call trunc (indfd)
   call fcopy (tmpfd, indfd)
   call flush$ (indfd)     # make sure the rest of the index gets there

   call rmtemp (tmpfd)

   return (art_no)
   end


