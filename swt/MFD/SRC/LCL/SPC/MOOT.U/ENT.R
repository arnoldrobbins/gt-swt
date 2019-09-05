# Entry support routines for 'moot'

# delent --- delete an entry from a file

   subroutine delent (key, fname, lockit)
   character key (MAXLINE), fname (MAXLINE)
   integer lockit

   file_des src, dst
   file_des open, create

   character scrat (MAXLINE), buf (MAXLINE)

   integer l
   integer getlin

   logical equnam

   call scratf (scrat, MAXLINE)

   if (lockit == YES)
      call lock         ### begin critical section

   src = open (fname, READ)
   if (src == ERR) {
      call putlin (fname, ERROUT)
      call errmsg (":  can't open"p)
      if (lockit == YES)
         call unlock    ### end critical section
      return
      }

   dst = create (scrat, READWRITE)
   if (dst == ERR) {
      call close (src)
      call errmsg ("can't open scratch file for deletion"p)
      if (lockit == YES)
         call unlock    ### end critical section
      return
      }

   repeat {
      l = getlin (buf, src)
      if (l == EOF) {      # not there...
         call close (src)
         call close (dst)
         call remove (scrat)
         if (lockit == YES)
            call unlock    ### end critical section
         return
         }
      if (buf (1) == KEY_FLAG)
         if (equnam (key, buf (2))) {  # don't copy this entry
            repeat {
               l = getlin (buf, src)
               if (l == EOF)
                  break 2
               } until (buf (1) == KEY_FLAG)
            call putlin (buf, dst)     # copy everything else through
            call fcopy (src, dst)      #  to avoid multiple deletions
            break
            }
      call putlin (buf, dst)
      }

   call close (src)
   call remove (fname)
   call close (dst)
   call rename (scrat, fname)

   if (lockit == YES)
      call unlock       ### end critical section

   return
   end



# getdat --- get a particular data item from an entry

   subroutine getdat (datum, flag, entry, size)
   character datum (ARB), flag
   integer size
   character entry (MAXLINE, size)

   integer i

   datum (1) = EOS
   for (i = 2; i <= size; i += 1)
      if (entry (1, i) == flag) {
         call scopy (entry (2, i), 1, datum, 1)
         return
         }

   return
   end



# getent --- get an entry from a file

   integer function getent (entry, size, fname, lockit)
   integer size, lockit
   character entry (MAXLINE, size), fname (ARB)

   file_des fd
   file_des open

   character line (MAXLINE)

   integer l, actsiz
   integer getlin

   logical equnam

   if (lockit == YES)
      call lock   ### begin critical section

   fd = open (fname, READ)
   if (fd == ERR) {
      call putlin (fname, ERROUT)
      call errmsg (":  can't open"p)
      getent = EOF
      if (lockit == YES)
         call unlock       ### end critical section
      return
      }

   repeat {          # search for an entry with a matching name field
      repeat {       # search for name field
         l = getlin (line, fd)
         if (l == EOF) {
            getent = EOF
            call close (fd)
            if (lockit == YES)
               call unlock    ### end critical section
            return
            }
         } until (line (1) == KEY_FLAG)
      line (l) = EOS
      } until (equnam (entry (2, 1), line (2)))

   call scopy (line, 1, entry (1, 1), 1)
   for (actsiz = 2; actsiz <= size; actsiz += 1) {
      l = getlin (entry (1, actsiz), fd)
      if (l == EOF)
         break
      entry (l, actsiz) = EOS
      }
   getent = actsiz - 1
   call close (fd)
   if (lockit == YES)
      call unlock       ### end critical section

   return
   end



# getkey --- get key item from an entry

   subroutine getkey (entry, key)
   character entry (MAXLINE, ARB), key (MAXLINE)

   call scopy (entry (2, 1), 1, key, 1)

   return
   end



# inient --- initialize an entry

   subroutine inient (entry, size)
   integer size
   character entry (MAXLINE, size)

   integer i

   for (i = 1; i <= size; i += 1) {
      entry (1, i) = EMPTY_FLAG
      entry (2, i) = EOS
      }
   entry (1, 1) = KEY_FLAG

   return
   end



# lock --- enforce mutual exclusion; begin a critical section

   subroutine lock

   integer code

   call sem$wt (SEMAPHORE, code)
   if (code ~= 0)
      call error ("fatal error --- mutual exclusion failure"p)

   return
   end



# makent --- make a new entry at the end of a file

   subroutine makent (entry, size, fname, lockit)
   integer size, lockit
   character entry (MAXLINE, size), fname (MAXLINE)

   file_des fd
   file_des open

   integer i

   if (lockit == YES)
      call lock      ### begin critical section

   fd = open (fname, READWRITE)
   if (fd == ERR) {
      call unlock    ### end critical section
      call putlin (fname, ERROUT)
      call error (":  can't open for update"p)
      }
   else {
      call wind (fd)    # position to end-of-file
      for (i = 1; i <= size; i += 1)
         call print (fd, "*s*n"s, entry (1, i))
      call close (fd)
      }

   if (lockit == YES)
      call unlock    ### end critical section

   return
   end



# putdat --- put data item in an entry

   subroutine putdat (datum, flag, entry, size)
   character datum (ARB), flag
   integer size
   character entry (MAXLINE, size)

   integer i, l
   integer length

   for (i = 2; i <= size; i += 1)
      if (entry (1, i) == flag || entry (1, i) == EMPTY_FLAG) {
         call scopy (datum, 1, entry (2, i), 1)
         l = length (entry (2, i))
         if (entry (l + 1, i) == NEWLINE)
            entry (l + 1, i) = EOS
         entry (1, i) = flag
         return
         }

   call error ("in putdat:  datum doesn't fit in entry"p)
   return
   end



# putkey --- put key item in an entry

   subroutine putkey (entry, key)
   character entry (MAXLINE, ARB), key (MAXLINE)

   integer l
   integer length

   entry (1, 1) = KEY_FLAG
   call scopy (key, 1, entry (2, 1), 1)
   l = length (entry (2, 1))
   if (entry (l + 1, 1) == NEWLINE)
      entry (l + 1, 1) = EOS
   return
   end



# unlock --- enforce mutual exclusion; end a critical section

   subroutine unlock

   integer code

   call sem$nf (SEMAPHORE, code)
   if (code ~= 0)
      call error ("fatal error --- mutual exclusion failure"p)

   return
   end



# updent --- update entry in a file

   subroutine updent (entry, size, fname, lockit)
   integer size, lockit
   character entry (MAXLINE, size), fname (ARB)

   file_des src, dst
   file_des open, create

   character scrat (MAXLINE), buf (MAXLINE)

   integer l, i
   integer getlin, length

   logical equnam

   call scratf (scrat, MAXLINE)
   dst = create (scrat, READWRITE)
   if (dst == ERR)
      call error ("can't open scratch file for update"p)

   if (lockit == YES)
      call lock         ### begin critical section

   src = open (fname, READWRITE)
   if (src == ERR) {
      call unlock       ### end critical section
      call close (dst)
      call remove (scrat)
      call putlin (fname, ERROUT)
      call error (":  can't open"p)
      }

   for (i = 1; i <= size; i += 1)
      call print (dst, "*s*n"s, entry (1, i))

   repeat {
      l = getlin (buf, src)
      if (l == EOF) {      # not there...add it onto the end
         call close (dst)
         call remove (scrat)
         for (i = 1; i <= size; i += 1)
            call print (src, "*s*n"s, entry (1, i))
         call close (src)
         if (lockit == YES)
            call unlock    ### end critical section
         return
         }
      if (buf (1) == KEY_FLAG)
         if (equnam (entry (2, 1), buf (2))) {  # don't copy old entry
            repeat {
               l = getlin (buf, src)
               if (l == EOF)
                  break 2
               } until (buf (1) == KEY_FLAG)
            call putlin (buf, dst)     # copy everything else through
            call fcopy (src, dst)      #  to avoid multiple deletions
            break
            }
      call putlin (buf, dst)
      }

   call close (src)
   call remove (fname)
   call close (dst)
   call rename (scrat, fname)

   if (lockit == YES)
      call unlock       ### end critical section

   return
   end
