# svsave --- save shell variables

   integer function svsave (file, trace)
   character file (ARB)
   bool trace

   define (NULL_PTR,16rFFF0000)
   define (FUNCTION,'<'c)        # start mnemonic function
   define (END_FUNC,'>'c)        # end the mnemonic function

   include SV_COMMON

   integer h, junk
   pointer p
   filedes fd
   filedes open
   pointer val

   call break$ (DISABLE)

   fd = open (file, WRITE, junk, 20)   # wait for up to 10 seconds
   if (fd == ERR) {
      call break$ (ENABLE)
      return (ERR)
      }

   if (trace)
      call print (TTY, "Saving variables in *s*n"p, file)

   for (h = 1; h <= SV_MAXHASH; h += 1)
      for (p = Sv_tbl (1, h); p ~= LAMBDA; p = Sv_mem (p + SV_HLINK)) {
         call putlin (Sv_mem (Sv_mem (p + SV_NAME)), fd)
         call putch (NEWLINE, fd)
         call svctmn (Sv_mem (Sv_mem (p + SV_VALUE)), val)
         call putlin (Sv_mem (val), fd)
         call putch (NEWLINE, fd)
         if (trace) {
            call putlin (Sv_mem (Sv_mem (p + SV_NAME)), TTY)
            call putch (NEWLINE, TTY)
            call putlin (Sv_mem (val), TTY)
            call putch (NEWLINE, TTY)
            }
         call svfree (val)
         }

   call trunc (fd)
   call close (fd)
   call break$ (ENABLE)

   return (OK)
   end



# svrest --- restore shell variables

   integer function svrest (file, trace)
   character file (ARB)
   bool trace

   include SV_COMMON

   pointer name, value
   integer len, junk
   integer svgetl, length
   filedes fd
   filedes open

   call break$ (DISABLE)

   fd = open (file, READ, junk, 20)
   if (fd == ERR) {
      call break$ (ENABLE)
      return (ERR)
      }

   if (trace)
      call print (TTY, "Restoring variables from *s*n"p, file)

   repeat {
      len = svgetl (name, fd)
      if (len == EOF)
         break
      Sv_mem (name + len - 1) = EOS
      len = svgetl (value, fd)
      if (len == EOF) {    # variable value is missing
         call close (fd)
         call break$ (ENABLE)
         return (ERR)
         }
      Sv_mem (value + len - 1) = EOS
      if (trace)
         call print (TTY, "*s = *s*n"p, Sv_mem (name), Sv_mem (value))
      call svmake (Sv_mem (name), Sv_mem (value))
      call svfree (value)
      call svfree (name)
      }

   call close (fd)
   call break$ (ENABLE)

   return (OK)
   end



# svscan --- scan the shell variable structure and return names

   integer function svscan (name, maxlen, info, offset)
   character name (maxlen)
   integer maxlen, info (3), offset

   include SV_COMMON

   integer ctoc
   bool missin
   integer i
   pointer p

   if (info (1) == 0) {
      info (1) = 1
      info (2) = 0
      if (missin (offset))
         info (3) = 0
      else
         info (3) = offset
      }

   name (1) = EOS

   if (info (1) < 1)
      info (1) = 1
   if (info (1) > SV_MAXHASH)
      return (EOF)
   if (info (2) < 0)
      info (2) = 0
   if (Sv_ll <= info (3))
      info (3) = Sv_ll - 1
   if (info (3) < 0)
      info (3) = 0

   p = Sv_tbl (Sv_ll - info (3), info (1))
   for (i = 1; i <= info (2) && p ~= LAMBDA; i += 1)
      p = Sv_mem (p + SV_HLINK)

   repeat {
      if (p ~= LAMBDA) {
         info (2) += 1
         return (ctoc (Sv_mem (Sv_mem (p + SV_NAME)), name, maxlen))
         }
      info (1) += 1
      if (info (1) > SV_MAXHASH)
         break

      info (2) = 0
      p = Sv_tbl (Sv_ll - info (3), info (1))
      }

   return (EOF)
   end



# svmake --- create a shell variable in the current scope

   integer function svmake (name, value)
   character name (ARB), value (ARB)

   include SV_COMMON

   integer h, nl, vl, i
   integer length, svfind, svhash, svmntc
   pointer p, np, vp
   pointer svallo

   ### traverse string once before inhibiting breaks
   nl = length (name) + 1

   if (svfind (name, p) ~= Sv_ll) {    # not in this scope
      call break$ (DISABLE)
      p = svallo (3)    # allocate a new pointer block
      np = svallo (nl)  # allocate space for name
      call svmntc (value, vp) # allocate space for value
      h = svhash (name)
      Sv_mem (p + SV_NAME) = np
      Sv_mem (p + SV_VALUE) = vp
      Sv_mem (p + SV_HLINK) = Sv_tbl (Sv_ll, h)
      Sv_tbl (Sv_ll, h) = p
      call ctoc (name, Sv_mem (np), nl)
      call svfix (name, Sv_mem (vp), Sv_ll)
      call break$ (ENABLE)
      }
#  else {   # already declared in this scope; change value
#     call break$ (DISABLE)
#     call svfree (Sv_mem (p + SV_VALUE))
#     call svmntc (value, vp)
#     Sv_mem (p + SV_VALUE) = vp
#     call break$ (ENABLE)
#     }

   return (Sv_ll)
   end



# svput --- assign value to shell variable

   integer function svput (name, value)
   character name (ARB), value (ARB)

   include SV_COMMON

   integer ll
   integer svmntc, svfind, svmake
   pointer p, vp
   pointer svallo

   ll = svfind (name, p)   # see if variable is declared
   if (ll == EOF)    # no; create it in the current scope
      ll = svmake (name, value)
   else {
      call break$ (DISABLE)
      call svfree (Sv_mem (p + SV_VALUE))
      call svmntc (value, vp)
      Sv_mem (p + SV_VALUE) = vp
      call svfix (name, Sv_mem (vp), ll)
      call break$ (ENABLE)
      }

   return (ll)
   end



# svdel --- destroy a shell variable in the current scope

   subroutine svdel (name)
   character name (ARB)

   include SV_COMMON
   include SWT_COMMON

   integer h, i
   integer equal, svhash, strlsr
   pointer p, q

   stringtable pos, text
      / "_eof" _
      / "_erase" _
      / "_escape" _
      / "_kill" _
      / "_kill_resp" _
      / "_newline" _
      / "_retype" _
      / "_prt_dest" _
      / "_prt_form"

   q = LAMBDA
   h = svhash (name)
   for (p = Sv_tbl (Sv_ll, h); p ~= LAMBDA; p = Sv_mem (p + SV_HLINK)) {
      if (equal (name, Sv_mem (Sv_mem (p + SV_NAME))) == YES) {
         call break$ (DISABLE)
         if (q == LAMBDA)
            Sv_tbl (Sv_ll, h) = Sv_mem (p + SV_HLINK)
         else
            Sv_mem (q + SV_HLINK) = Sv_mem (p + SV_HLINK)
         call svfree (Sv_mem (p + SV_NAME))
         call svfree (Sv_mem (p + SV_VALUE))
         call svfree (p)

         i = strlsr (pos, text, 0, name)   # update SWT common blocks
         if (i ~= EOF)
            select (i - 1)
            when (1)
               Eofchar = Eofsave (Sv_ll)
            when (2)
               Echar   = Esave (Sv_ll)
            when (3)
               Escchar = Escsave (Sv_ll)
            when (4)
               Kchar   = Ksave (Sv_ll)
            when (5)
               call ctoc (Kresp_save (1, Sv_ll), Kill_resp, MAXKILLRESP)
            when (6)
               Nlchar  = Nlsave (Sv_ll)
            when (7)
               Rtchar  = Rtsave (Sv_ll)
            when (8)
               call ctoc (Pdest_save (1, Sv_ll), Prt_dest, MAXPRTDEST)
            when (9)
               call ctoc (Pform_save (1, Sv_ll), Prt_form, MAXPRTFORM)

         call break$ (ENABLE)
         break
         }
      q = p
      }

   return
   end



# svget --- fetch the value of a shell variable

   integer function svget (name, value, maxval)
   character name (ARB), value (ARB)
   integer maxval

   include SV_COMMON

   integer ctoc, svfind
   pointer p

   if (svfind (name, p) == EOF)
      svget = EOF
   else
      svget = ctoc (Sv_mem (Sv_mem (p + SV_VALUE)), value, maxval)

   return
   end



# svfind --- locate a shell variable; return scope level and location

   integer function svfind (name, loc)
   character name (ARB)
   pointer loc

   include SV_COMMON

   integer h, i
   integer equal, svhash
   pointer p

   h = svhash (name)
   for (i = Sv_ll; i > 0; i -= 1)
      for (p = Sv_tbl (i, h); p ~= LAMBDA; p = Sv_mem (p + SV_HLINK))
         if (equal (name, Sv_mem (Sv_mem (p + SV_NAME))) == YES) {
            loc = p
            return (i)
            }

   loc = LAMBDA

   return (EOF)
   end



# svhash --- compute hash number for a shell variable name

   integer function svhash (name)
   character name (ARB)

   if (IS_LETTER (name (1)))
      svhash = mod (name (1), SV_MAXHASH) + 1
   else
      svhash = mod (name (2), SV_MAXHASH) + 1

   return
   end



# svpop --- exit the current shell variable scope level

   subroutine svpop

   include SV_COMMON
   include SWT_COMMON

   integer i
   pointer p, q

   call break$ (DISABLE)
   do i = 1, SV_MAXHASH
      for (p = Sv_tbl (Sv_ll, i); p ~= LAMBDA; p = q) {
         q = Sv_mem (p + SV_HLINK)
         call svfree (Sv_mem (p + SV_NAME))
         call svfree (Sv_mem (p + SV_VALUE))
         call svfree (p)
         }

   Eofchar = Eofsave (Sv_ll)
   Echar   = Esave (Sv_ll)
   Escchar = Escsave (Sv_ll)
   Kchar   = Ksave (Sv_ll)
   Nlchar  = Nlsave (Sv_ll)
   Rtchar  = Rtsave (Sv_ll)
   call ctoc (Kresp_save (1, Sv_ll), Kill_resp, MAXKILLRESP)
   call ctoc (Pdest_save (1, Sv_ll), Prt_dest, MAXPRTDEST)
   call ctoc (Pform_save (1, Sv_ll), Prt_form, MAXPRTFORM)

   Sv_ll -= 1
   call break$ (ENABLE)

   return
   end



# svpush --- enter a new shell variable scope level

   subroutine svpush

   include SV_COMMON
   include SWT_COMMON

   integer i

   call break$ (DISABLE)
   Sv_ll += 1
   do i = 1, SV_MAXHASH
      Sv_tbl (Sv_ll, i) = LAMBDA

   Eofsave (Sv_ll) = Eofchar
   Esave   (Sv_ll) = Echar
   Escsave (Sv_ll) = Escchar
   Ksave   (Sv_ll) = Kchar
   Nlsave  (Sv_ll) = Nlchar
   Rtsave  (Sv_ll) = Rtchar
   call ctoc (Kill_resp, Kresp_save (1, Sv_ll), MAXKILLRESP)
   call ctoc (Prt_dest , Pdest_save (1, Sv_ll), MAXPRTDEST )
   call ctoc (Prt_form , Pform_save (1, Sv_ll), MAXPRTFORM )

   call break$ (ENABLE)

   return
   end



# svinit --- initial shell variable tables

   subroutine svinit

   include SV_COMMON

   pointer t

   Sv_ll = 0

   # set up avail list:
   t = SV_AVAIL
   Sv_mem (t + SV_SIZE) = 0
   Sv_mem (t + SV_LINK) = SV_AVAIL + SV_OHEAD

   # set up first block of space:
   t = SV_AVAIL + SV_OHEAD
   Sv_mem (t + SV_SIZE) = SV_MEMSIZE - SV_OHEAD - 1   # -1 for MEMEND
   Sv_mem (t + SV_LINK) = LAMBDA

   # record end of memory:
   Sv_mem (SV_MEMEND) = SV_MEMSIZE

   call svpush

   return
   end



# svdump --- dump shell variable table

   subroutine svdump (fd)
   integer fd

   include SV_COMMON

   pointer val
   integer h, i
   pointer p

   for (i = 1; i <= Sv_ll; i += 1) {
      call print (fd, "Scope level *i:*n"p, i)
      for (h = 1; h <= SV_MAXHASH; h += 1) {
         call print (fd, "   Hash list *i:*n"p, h)
         for (p = Sv_tbl (i, h); p ~= LAMBDA; p = Sv_mem (p + SV_HLINK)) {
            call svctmn (Sv_mem (Sv_mem (p + SV_VALUE)), val)
            call print (fd, "*6i: *s (*i) = *s (*i)*n"p, p,
                  Sv_mem (Sv_mem (p + SV_NAME)), Sv_mem (p + SV_NAME),
                  Sv_mem (val), Sv_mem (p + SV_VALUE))
            call svfree (val)
            }
         }
      }

   return
   end



# svallo --- allocate space for shell variables

   pointer function svallo (w)
   integer w

   include SV_COMMON

   pointer p, q, l
   integer n, k

   n = w + SV_OHEAD
   q = SV_AVAIL

   repeat {
      p = Sv_mem (q + SV_LINK)
      if (p == LAMBDA) {
         call break$ (ENABLE)    # assume we were called inhibited
         call signl$ ("NO_SVMEM"v, NULL_PTR, 0, NULL_PTR, 0, 0)
         }
      if (Sv_mem (p + SV_SIZE) >= n)
         break
      q = p
      }

   k = Sv_mem (p + SV_SIZE) - n
   if (k >= SV_CLOSE) {
      Sv_mem (p + SV_SIZE) = k
      l = p + k
      Sv_mem (l + SV_SIZE) = n
      }
   else {
      Sv_mem (q + SV_LINK) = Sv_mem (p + SV_LINK)
      l = p
      }

   return (l + SV_OHEAD)
   end



# svfree --- return a block of storage to the available space list

   subroutine svfree (block)
   pointer block

   include SV_COMMON

   pointer p0, p, q
   integer n

   p0 = block - SV_OHEAD
   n = Sv_mem (p0 + SV_SIZE)
   q = SV_AVAIL

   repeat {
      p = Sv_mem (q + SV_LINK)
      if (p == LAMBDA || p > p0)
         break
      q = p
      }

   if (q + Sv_mem (q + SV_SIZE) > p0) {
      call remark ("in svfree: attempt to free unallocated block"p)
      return      # do not attempt to free the block
      }

   if (p0 + n == p & p ~= LAMBDA) {
      n = n + Sv_mem (p + SV_SIZE)
      Sv_mem (p0 + SV_LINK) = Sv_mem (p + SV_LINK)
      }
   else
      Sv_mem (p0 + SV_LINK) = p

   if (q + Sv_mem (q + SV_SIZE) == p0) {
      Sv_mem (q + SV_SIZE) = Sv_mem (q + SV_SIZE) + n
      Sv_mem (q + SV_LINK) = Sv_mem (p0 + SV_LINK)
      }
   else {
      Sv_mem (q + SV_LINK) = p0
      Sv_mem (p0 + SV_SIZE) = n
      }

   return
   end



#  svmntc --- convert a string with mnemonics to real characters

   integer function svmntc (value, out)
   character value (ARB)
   pointer out

   include SV_COMMON

   pointer svallo
   integer i, j, k
   character c, mn (4)

   procedure handle_escape forward
   procedure handle_function forward

   out = svallo (length (value) + 1)
   for ({i = 1; j = 0}; value (i) ~= EOS; i += 1)
      select (value (i))
         when (ESCAPE)
            handle_escape
         when (FUNCTION)
            handle_function
         else {
            Sv_mem (out + j) = value (i)
            j += 1
            }

   Sv_mem (out + j) = EOS
   return (j)


#  handle_escape --- process escape sequences

   procedure handle_escape {

      if (value (i + 1) ~= EOS)
         i += 1

      select (value (i))
         when ('n'c)
            Sv_mem (out + j) = NEWLINE
         when ('t'c)
            Sv_mem (out + j) = TAB
         else
            Sv_mem (out + j) = value (i)

      j += 1
      }


#  handle_function --- process a mnemonic function

   procedure handle_function {

   local k, mn, c, l
   integer k, l
   character mn (4), c
   character mntoc

      for (k = 1; value (i + k) ~= END_FUNC &&
                  value (i + k) ~= FUNCTION &&
                  value (i + k) ~= EOS      &&
                  k <= 3; k += 1             )
         mn (k) = value (i + k)

      mn (k) = EOS
      if (value (i + k) ~= END_FUNC) {
         Sv_mem (out + j) = value (i)
         j += 1
         }
      else {
         l = 1
         c = mntoc (mn, l, ERR)
         if (c == ERR) {
            Sv_mem (out + j) = value (i)
            j += 1
            }
         else {
            Sv_mem (out + j) = c
            j += 1
            i += k
            }
         }
      }

   end



#  svctmn --- convert a string of real characters to mnemonics

   integer function svctmn (in, value)
   character in (ARB)
   pointer value

   include SV_COMMON

   pointer svallo
   integer i, j, len
   character mn (4)
   character ctomn

   for ({i = 1; j = 1}; in (i) ~= EOS; i += 1)
      if (in (i) <= US || in (i) == DEL)
         j += 5
      else
         j += 1

   value = svallo (j)
   for ({i = 1; j = 0}; in (i) ~= EOS; {i += 1; j += len}) {
      len = ctomn (in (i), mn)

      if (len == 1 || in (i) == ' 'c) {
         if (in (i) == FUNCTION) {
            Sv_mem (value + j) = ESCAPE
            j += 1
            }
         elif (in (i) == ' 'c)
            len = 1
         Sv_mem (value + j) = in (i)
         }
      else {
         Sv_mem (value + j) = FUNCTION
         call ctoc (mn, Sv_mem (value + j + 1), len + 1)
         Sv_mem (value + len + j + 1) = END_FUNC
         j += 2
         }
      }

   Sv_mem (value + j) = EOS
   return (j)
   end



#  svfix --- fix the SWT common blocks after changing a special variable

   subroutine svfix (name, val, ll)
   character name (ARB), val (ARB)
   integer ll

   include SV_COMMON
   include SWT_COMMON

   integer i
   integer strlsr

   stringtable pos, text
      / "_eof" _
      / "_erase" _
      / "_escape" _
      / "_kill" _
      / "_kill_resp" _
      / "_newline" _
      / "_retype" _
      / "_prt_dest" _
      / "_prt_form"

   i = strlsr (pos, text, 0, name)
   if (i == EOF)
      return

   select (i - 1)
   when (1) {
      Eofchar = val (1)
      do i = ll, Sv_ll
         Eofsave (i) = val (1)
      }
   when (2) {
      Echar = val (1)
      do i = ll, Sv_ll
         Esave (i) = val (1)
      }
   when (3) {
      Escchar = val (1)
      do i = ll, Sv_ll
         Escsave (i) = val (1)
      }
   when (4) {
      Kchar = val (1)
      do i = ll, Sv_ll
         Ksave (i) = val (1)
      }
   when (5) {
      call ctoc (val, Kill_resp, MAXKILLRESP)
      do i = ll, Sv_ll
         call ctoc (val, Kresp_save (1, i), MAXKILLRESP)
      }
   when (6) {
      Nlchar = val (1)
      do i = ll, Sv_ll
         Nlsave (i) = val (1)
      }
   when (7) {
      Rtchar = val (1)
      do i = ll, Sv_ll
         Rtsave (i) = val (1)
      }
   when (8) {
      call ctoc (val, Prt_dest, MAXPRTDEST)
      do i = ll, Sv_ll
         call ctoc (val, Pdest_save (1, ll), MAXPRTDEST)
      }
   when (9) {
      call ctoc (val, Prt_form, MAXPRTFORM)
      do i = ll, Sv_ll
         call ctoc (val, Pform_save (1, ll), MAXPRTFORM)
      }

   return
   end



#  svgetl --- get an arbitrarily long line from fd

   integer function svgetl (ptr, fd)
   pointer ptr
   file_des fd

   include SV_COMMON

   pointer tptr
   integer getlin
   pointer svallo
   integer len, pos
   character buf (MAXLINE)

   pos = 1
   ptr = svallo (pos)
   Sv_mem (ptr) = EOS

   repeat {
      len = getlin (buf, fd)
      if (len == EOF)
         return (EOF)

      tptr = svallo (pos + len)
      call ctoc (Sv_mem (ptr), Sv_mem (tptr), pos)
      call ctoc (buf, Sv_mem (tptr + pos - 1), len)
      call svfree (ptr)
      ptr = tptr
      pos += len
      } until (buf (len) == NEWLINE)

   return (pos - 1)
   end



#  svlevl --- return the current shell variable lexic level

   integer function svlevl (level)
   integer level

   include SV_COMMON

   level = Sv_ll
   return (Sv_ll)             # not much to do
   end



undefine (NULL_PTR)
undefine (FUNCTION)
undefine (END_FUNC)
