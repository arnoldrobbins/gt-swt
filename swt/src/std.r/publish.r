# publish --- publish a news article


   integer ap, art_no
   integer getarg, index_entry, archive, deliver
   file_des artfd, indfd
   file_des reformat, open

   character art_name (MAXLINE), headline (MAXLINE)

   indfd = open ("=news=/index"s, READWRITE)    # use as a lock on
   if (indfd == ERR)                            #    on the news system
      call error ("can't open index file"p)

   for (ap = 1; getarg (ap, art_name, MAXLINE) ~= EOF; ap += 1) {

      artfd = reformat (art_name, headline)
      if (artfd == ERR) {
         call seterr (1000)
         break
         }

      art_no = index_entry (headline, indfd)
      if (art_no == ERR) {
         call rmtemp (artfd)
         call seterr (1000)
         break
         }
      if (archive (artfd, art_no) == ERR) {
         call rmtemp (artfd)
         call seterr (1000)
         break
         }
      if (deliver (artfd, art_no) == ERR) {
         call rmtemp (artfd)
         call seterr (1000)
         break
         }

      call rmtemp (artfd)
      }

   call close (indfd)

   stop
   end



# archive --- make an "archive" copy of an article

   integer function archive (artfd, art_no)
   filedes artfd
   integer art_no

   character arch (MAXLINE)
   character author (MAXUSERNAME), ldate (32)

   filedes archfd
   filedes create

   call rewind (artfd)
   call encode (arch, MAXLINE, "=news=/articles/art*i"s, art_no)

   archfd = create (arch, READWRITE)
   if (archfd == ERR) {
      call remark ("can't open archive copy file"p)
      return (ERR)
      }

   call date (SYS_USERID, author)               # put out the author heading
   call date (SYS_LDATE, ldate)
   call print (archfd, "Article *i by *s on *s*2n"p,
         art_no, author, ldate)

   call fcopy (artfd, archfd)
   call print (archfd, "*2n"s)
   call close (archfd)

   return (OK)
   end



# deliver --- deliver an article to all newsletter subscribers

   integer function deliver (artfd, art_no)
   filedes artfd
   integer art_no

   integer len, nlpos
   integer getlin, scopy, vfyusr
   filedes subfd, boxfd
   filedes open

   character box (MAXLINE), subname (MAXLINE)
   character author (MAXUSERNAME), ldate (32)

   subfd = open ("=news=/subscribers"s, READ)
   if (subfd == ERR) {
      call remark ("can't open subscriber list"p)
      return (ERR)
      }

   call date (SYS_USERID, author)               # put out the author heading
   call date (SYS_LDATE, ldate)

   len = scopy ("=news=/delivery/"s, 1, box, 1) + 1
   for (nlpos = getlin (subname, subfd); nlpos ~= EOF;
                                 nlpos = getlin (subname, subfd)) {
      subname (nlpos) = EOS
      if (vfyusr (subname) ~= OK)
         next
      call scopy (subname, 1, box, len)
      boxfd = open (box, WRITE)
      if (boxfd == ERR) {
         call print (ERROUT, "*s: can't deliver*n"p, subname)
         return (ERR)
         }
      call rewind (artfd)
      call wind (boxfd)
      call print (boxfd, "Article *i by *s on *s*2n"p,
            art_no, author, ldate)
      call fcopy (artfd, boxfd)
      call print (boxfd, "*2n"s)
      call close (boxfd)
      }

   call close (subfd)
   deliver = OK
   return
   end



# index_entry --- make entry in newsletter index, return entry number

   integer function index_entry (headline, indfd)
   character headline (ARB)
   file_des indfd

   integer i, number, len
   integer ctoi, getlin, encode

   character dat (9), tim (9), nam (MAXUSERNAME), line (MAXLINE)

   call rewind (indfd)
   while (getlin (line, indfd) ~= EOF) {
      i = 1
      number = ctoi (line, i) + 1
      }

   call date (SYS_DATE, dat)
   call date (SYS_TIME, tim)
   call date (SYS_USERID, nam)

   len = encode (line, MAXLINE, "*4i. *s *s *,5s *s"s,
                     number, nam, dat, tim, headline)

   if (len > 80) {
      call print (ERROUT, "Headline too long: *s"p, headline)
      return (ERR)
      }

   call putlin (line, indfd)
   call flush$ (indfd)     # be sure the index entry makes it

   return (number)
   end


# reformat --- copy and reformat the article for publication

   file_des function reformat (art_name, headline)
   character art_name (ARB), headline (ARB)

######################################################################
#     WARNING                                                        #
#        'Retract' may cease to function if the format of an         #
#        article is changed.  'Retract' expects the word             #
#        "Article" followed by the article number to be the first    #
#        line in each article.                                       #
######################################################################

   integer i, j, l, blcount
   integer getlin, allblank, length
   file_des artfd, rawfd
   file_des mktemp, open
   character line (MAXLINE)

   rawfd = open (art_name, READ)
   if (rawfd == ERR) {
      call print (ERROUT, "*s: cannot open*n"p, art_name)
      return (ERR)
      }

   artfd = mktemp (READWRITE)
   if (artfd == ERR) {
      call remark ("can't open temporary file"p)
      return (ERR)
      }

   repeat                                       # skip blank lines
      l = getlin (line, rawfd)
      until (l == EOF || allblank (line) == NO)
   if (l == EOF) {
      call print (ERROUT, "*s: empty file*n"p, art_name)
      call rmtemp (artfd)
      return (ERR)
      }

   i = 1                                        # grab out the headline
   SKIPBL (line, i)
   call scopy (line, i, headline, 1)

   call print (artfd, " *s"s, line)             # we get an extra NEWLINE

   for (j = length (line) - 1; j > 0; j -= 1)   # find last non-blank
      if (line (j) ~= ' 'c)                     #   and put out an underline
         break
   call print (artfd, " *#x*#,,-x*2n"s, i - 1, j - i + 1)

   repeat                                       # skip blank lines
      l = getlin (line, rawfd)
      until (l == EOF || allblank (line) == NO)

   blcount = 0
   while (l ~= EOF) {                           # leave out trailing
      if (allblank (line) == YES)               #    blank lines
         blcount += 1
      else {
         if (blcount > 0)
            call print (artfd, "*#n"s, blcount)
         blcount = 0
         call print (artfd, " *s"s, line)
         }
      l = getlin (line, rawfd)
      }

   call close (rawfd)
   call rewind (artfd)

   return (artfd)
   end



# allblank --- return YES if a line is all blank

   integer function allblank (line)
   character line (ARB)

   integer i

   for (i = 1; line (i) ~= EOS && line (i) ~= NEWLINE; i += 1)
      if (line (i) ~= ' 'c)
         return (NO)

   return (YES)
   end
