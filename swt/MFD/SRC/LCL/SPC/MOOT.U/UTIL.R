# Miscellaneous utility routines for 'moot':

# ctofm --- convert character string to file mark

   subroutine ctofm (str, fm)
   character str (ARB)
   file_mark fm

   integer i

   long_int ctol

   i = 1
   fm = ctol (str, i)

   return
   end



# equnam --- see if two names are equivalent

   logical function equnam (abbrev, nam)
   character abbrev (ARB), nam (ARB)

   character mapdn

   integer i, j

   i = 1
   j = 1

   repeat {

      SKIPBL (abbrev, i)
      SKIPBL (nam, j)

      if (abbrev (i) == EOS)
         return (.true.)
      if (nam (i) == EOS)
         return (.false.)

      while (mapdn (abbrev (i)) == mapdn (nam (j))) {
         if (abbrev (i) == ' 'c || abbrev (i) == TAB
           || abbrev (i) == EOS)
            break
         i += 1
         j += 1
         }

      if (abbrev (i) == ' 'c || abbrev (i) == TAB || abbrev (i) == EOS)
         while (nam (j) ~= ' 'c && nam (j) ~= TAB && nam (j) ~= EOS)
            j += 1
      else
         return (.false.)

      }

   end



# fmtoc --- convert file mark to character

   subroutine fmtoc (fm, buf)
   file_mark fm
   character buf (MAXLINE)

   integer junk
   integer ltoc

   junk = ltoc (fm, buf, MAXLINE)

   return
   end



# gettim --- get current time and date

   subroutine gettim (buf)
   character buf (MAXLINE)

   call date (SYS_TIME, buf)      # hh:mm:ss
   buf (9) = ' 'c
   call date (SYS_DATE, buf (10)) # mm/dd/yy

   return
   end



# itoc0f --- convert integer to character, zero filled

   subroutine itoc0f (int, str, size)
   integer int, size
   character str (size)

   integer i, l
   integer itoc

   character lstr (10)

   l = itoc (int, lstr, 10)
   for (i = 1; i <= size - l - 1; i += 1)
      str (i) = '0'c
   call scopy (lstr, 1, str, i)

   return
   end



# pwcryp --- one-way encrypt a password

   subroutine pwcryp (pword)
   character pword (MAXLINE)

   integer i, l
   integer length

   # a totally bogus encryption for now; insert a better one later
   l = length (pword)
   for (i = 1; i <= l; i += 1) {
      pword (i) = or (and (pword (i), not (pword (l))),
                      and (not (pword (i)), pword (l)))
      if (pword (i) < ' 'c)
         pword (i) = pword (i) + ' 'c
      }

   return
   end



# rename --- change the name of a file (by copying and removing)

   subroutine rename (old, new)
   character old (ARB), new (ARB)

   file_des fdold, fdnew
   file_des open, create

   fdold = open (old, READ)
   if (fdold == ERR)
      call cant (old)

   fdnew = create (new, READWRITE)
   if (fdnew == ERR)
      call cant (new)

   call fcopy (fdold, fdnew)

   call close (fdold)
   call close (fdnew)
   call remove (old)

   return
   end



# scratf --- generate a unique scratch file name

   subroutine scratf (name, maxlen)
   integer maxlen
   character name (maxlen)

   character pid (MAXLINE)

   integer i

   file_des fd
   file_des open

   call date (SYS_PIDSTR, pid)
   for (i = 1; i <= 10; i += 1) {
      call encode (name, maxlen, "=temp=/mo$*s$*i"s, pid, i)
      fd = open (name, READ)
      if (fd == ERR)
         return
      call close (fd)
      }

   call error ("fatal error --- cannot generate scratch file name"p)

   end
