
   # fast version of lsgetc
   define (getchar(p,c),{
      while(Ls_ref(p)>=OS)p=Ls_ref(p)-OS
      c=Ls_ref(p)
      if(c~=EOS)p+=1
      })

# lsgetf --- get an arbitrarily long linked string from fd

   integer function lsgetf (ptr, fd)
   pointer ptr
   integer fd

####  WARNING:  This routine is intimately involved with
####            get_cl in sh_ci.r and lsquit in sh_ls.r

   include SWT_COMMON

   real * 8 rtlab
   common /quitcm/ rtlab

   character line (MAXLINE)
   integer str_len, line_len
   pointer j, k
   integer getlin

   call mklb$f ($1, rtlab)

   call lsallo (ptr, 0)
   k = ptr
   str_len = 0

   repeat {

      line_len = 1                  # Prepare for QUIT$ signal
      line (1) = NEWLINE            #    during or before I/O
      line (2) = EOS
      call break$ (ENABLE)
      line_len = getlin (line, fd)
   1; call break$ (DISABLE)         # Come here on QUIT$

      if (line_len == EOF) {
         call lsputc (k, EOS)
         call lsfree (ptr, ALL)
         lsgetf = EOF
         break
         }
      else if (line (line_len) == NEWLINE) {
         call lsmake (j, line)
         call lsjoin (k, j)
         lsgetf = str_len + line_len
         break
         }
      call lsmake (j, line)
      call lsjoin (k, j)
      str_len = str_len + line_len
      call lspos (k, ALL)
      }

   return
   end


# lsquit --- handle a quit only during terminal input/output

   subroutine lsquit (p)
   integer p

####  WARNING:  This routine is intimately involved with
####            get_cl in sh_ci.r and lsgetf in sh_ls.r

   real*8 rtlab
   common /quitcm/ rtlab

   include SWT_COMMON

   integer code

   Cmdstat = 1000
   Term_cp = 1
   Term_buf (Term_cp) = EOS
   Term_count = 0
   call duplx$ (Lword)
   call tty$rs (:140000, code)
   call putch (NEWLINE, TTY)
   call pl1$nl (rtlab)

   return
   end


# lsputf --- put an arbitrarily long linked string on fd

   subroutine lsputf (ptr, fd)
   pointer ptr
   integer fd

   include SWT_COMMON

   character line (MAXLINE)
   pointer k

   k = ptr
   repeat {
      call lsextr (k, line, MAXLINE)
      call putlin (line, fd)
      } until (lspos (k, MAXLINE) == EOS)

   return
   end


# lsjoin --- join two linked strings

   pointer function lsjoin (ptr1, ptr2)
   pointer ptr1, ptr2

   include SWT_COMMON

   pointer k

   k = ptr1
   call lspos (k, ALL)
   Ls_ref (k) = ptr2 + OS
   lsjoin = ptr1

   return
   end


# lscmpk --- compare a linked string to a K & P string

   character function lscmpk (ptr, str)
   pointer ptr
   character str (ARB)

   include SWT_COMMON

   pointer i1
   integer i2
   character c1, c2

   i1 = ptr
   i2 = 1
   c2 = str (i2)
   getchar (i1, c1)
   while (c1 == c2) {
      if (c1 == EOS)
         return ('='c)
      i2 += 1
      c2 = str (i2)
      getchar (i1, c1)
      }
   if (c1 == EOS || c2 ~= EOS && c1 < c2)
      lscmpk = '<'c
   else
      lscmpk = '>'c

   return
   end


# lscomp --- compare two linked strings, return '>'c, '='c or '<'c

   character function lscomp (str1, str2)
   pointer str1, str2

   include SWT_COMMON

   pointer i1, i2
   character c1, c2

   i1 = str1; getchar (i1, c1)
   i2 = str2; getchar (i2, c2)
   while (c1 == c2) {
      if (c1 == EOS)
         return ('='c)
      getchar (i1, c1)
      getchar (i2, c2)
      }
   if (c1 == EOS || c2 ~= EOS && c1 < c2)
      lscomp = '<'c
   else
      lscomp = '>'c

   return
   end


# lscut --- divide linked string into two parts

   pointer function lscut (ptr1, pos, ptr2)
   pointer ptr1, ptr2
   integer pos

   pointer i, j, k
   character c

   i = ptr1
   if (pos <= 0) {
      ptr2 = ptr1
      lscut = ptr1
      call lsallo (ptr1, 0)
      }
   else if (lspos (i, pos) == EOS) {
      call lsallo (ptr2, 0)
      lscut = ptr2
      }
   else {
      call lsallo (j, 1)
      ptr2 = i + 1
      lscut = ptr2
      k = i
      call lsgetc (i, c)
      call lsputc (k, j + OS)
      call lsputc (j, c)
      }

   return
   end


# lsins --- insert in linked string

   subroutine lsins (ptr1, pos1, ptr2, pos2, len)
   pointer ptr1, ptr2
   integer pos1, pos2, len

   include SWT_COMMON

   integer i, j, c

   if (len <= 0)
      return

   if (pos1 > 0) {
      j = 0
      call lscopy (ptr2, pos2, j, 2)
      call lsdel (j, len + 2, ALL)
      call lspos (j, 1)
      i = ptr1
      c = lspos (i, pos1)
      if (c == EOS) {  # Special case for append
         i = ptr1
         c = lspos (i, lslen (i))
         }
      Ls_ref (j) = c
      Ls_ref (i) = j + OS
      call lspos (j, ALL)
      Ls_ref (j) = i + 1 + OS
      }
   else {  # Special case for prepend
      j = lssubs (ptr2, pos2, len)
      i = ptr1
      ptr1 = j
      call lspos (j, ALL)
      Ls_ref (j) = i + OS
      }

   return
   end


# lstake --- take characters from a linked string

   pointer function lstake (ptr, len)
   pointer ptr
   integer len

   include SWT_COMMON

   character c
   pointer i, j

   i = ptr
   lstake = lsallo (j, len)
   while (lsputc (j, (lsgetc (i, c))) ~= EOS)
      ;
   return
   end


# lsdrop --- drop characters from a linked string

   pointer function lsdrop (ptr, len)
   pointer ptr
   integer len

   include SWT_COMMON

   pointer j

   lsdrop = 0
   call lscopy (j, len + 1, lsdrop, 1)

   return
   end


# lssubs --- take a substring of a linked string

   pointer function lssubs (ptr, pos, len)
   pointer ptr
   integer pos, len

   include SWT_COMMON

   character c
   pointer j, k
   integer i, len1

   if (len >= ALL)
      len1 = lslen (ptr) - pos + 2
   else
      len1 = len
   lssubs = lsallo (k, len1)
   j = ptr
   c = lspos (j, pos)
   for (i = 1; i <= len && c ~= EOS; i += 1) {
      getchar (j, c)
      call lsputc (k, c)
      }

   return
   end


# lsdel --- delete characters from a linked string

   subroutine lsdel (ptr, pos, len)
   pointer ptr
   integer pos, len

   include SWT_COMMON

   integer i, j

   if (len <= 0)
      return
   i = ptr
   call lspos (i, pos)
   j = i
   call lsfree (j, len)
   if (j == 0)
      Ls_ref (i) = EOS
   else
      Ls_ref (i) = j + OS

   return
   end


# lscopy --- copy linked string

   subroutine lscopy (ptr1, pos1, ptr2, pos2)
   pointer ptr1, ptr2
   integer pos1, pos2

   include SWT_COMMON

   integer k, c, j

   j = ptr1
   call lspos (j, pos1)
   if (ptr2 == 0)
      call lsallo (ptr2, pos2 - 1 + lslen (j))
   k = ptr2
   call lspos (k, pos2)
   getchar (j, c)
   while (lsputc (k, c) ~= EOS)
      getchar (j, c)

   return
   end


# lspos --- find position in linked string

   character function lspos (ptr, pos)
   pointer ptr
   integer pos

   include SWT_COMMON

   integer i

   for (i = 1; i < pos; i = i + 1) {
      while (Ls_ref (ptr) >= OS)
         ptr = Ls_ref (ptr) - OS
      if (Ls_ref (ptr) == EOS)
         break
      ptr = ptr + 1
      }
   while (Ls_ref (ptr) >= OS)
      ptr = Ls_ref (ptr) - OS

   lspos = Ls_ref (ptr)

   return
   end


# lsmake --- convert K & P string to linked string

   pointer function lsmake (ptr, str)
   pointer ptr
   character str (ARB)

   include SWT_COMMON

   integer i, j

   call lsallo (ptr, length (str))
   j = ptr
   for (i = 1; str (i) ~= EOS; i = i + 1) {
     # call lsputc (j, str (i))
      while (Ls_ref (j) >= OS)
         j = Ls_ref (j) - OS
      Ls_ref (j) = str (i)
      j = j + 1
      }

   lsmake = ptr

   return
   end


# lsextr --- extract K & P string from linked string

   integer function lsextr (ptr, str, max)
   pointer ptr
   character str (ARB)
   integer max

   include SWT_COMMON

   integer i, j

   j = ptr
   for (i = 1; i < max; i += 1) {
      getchar (j, str (i))
      if (str (i) == EOS)
         break
      }

   str (i) = EOS

   return (i - 1)
   end


# lslen --- compute length of linked string

   integer function lslen (ptr)
   pointer ptr

   include SWT_COMMON

   integer i, j

   j = ptr
   for (i = 0; ; i += 1) {
      while (Ls_ref (j) >= OS)
         j = Ls_ref (j) - OS
      if (Ls_ref (j) == EOS)
         break
      j += 1
      }

   return (i)
   end


# lsgetc --- get character from linked string

   character function lsgetc (ptr, c)
   pointer ptr
   character c

   include SWT_COMMON

   while (Ls_ref (ptr) >= OS)
      ptr = Ls_ref (ptr) - OS
   c = Ls_ref (ptr)
   lsgetc = c
   if (Ls_ref (ptr) ~= EOS) {
      ptr = ptr + 1
      while (Ls_ref (ptr) >= OS)
         ptr = Ls_ref (ptr) - OS
      }

   return
   end


# lsputc --- put character into a linked string

   character function lsputc (ptr, c)
   pointer ptr
   character c

   include SWT_COMMON

   integer i

   while (Ls_ref (ptr) >= OS)
      ptr = Ls_ref (ptr) - OS
   if (Ls_ref (ptr) ~= EOS) {
      Ls_ref (ptr) = c
      ptr = ptr + 1
      if (c == EOS) {
         i = ptr
         call lsfree (i, ALL)
         }
      lsputc = c
      }
   else
      lsputc = EOS

   return
   end


# lsallo --- allocate space for linked string

   pointer function lsallo (ptr, len)
   pointer ptr
   integer len

   include SWT_COMMON
   include CI_COMMON

   integer i, j, flag

   flag = NO
   repeat {
      if (Ls_ho + len + 1 < Ls_top) {
         ptr = Ls_ho + 1
         Ls_ho += len + 1
         for (i = ptr; i < Ls_ho; i += 1)
            Ls_ref (i) = LSVOID
         Ls_ref (Ls_ho) = EOS
         return (ptr)
         }
      j = 0
      for (i = Ls_na; Ls_ref (i) ~= EOS; i += 1) {
         while (Ls_ref (i) >= OS)
            i = Ls_ref (i) - OS
         if (Ls_ref (i) == EOS)
            break
         j += 1
         if (j > len) {
            ptr = Ls_na
            Ls_ref (i) = EOS
            Ls_na = i + 1
            return (ptr)
            }
         }

      if (flag == YES) {
         call print (TTY, "Too many linked strings*n"p)
         stop
         }

      flag = YES

      if (and (Ci_trace, LS_TRACE) ~= 0) {
         call print (TTY, "Begin linked string garbage collection:*n"p)
         call print (TTY, "Request: *i  Avail: *i  Open: *i*n"p,
                              len, j, Ls_ho)
         }

      call lsfree (Ls_na, ALL)
      for (; Ls_ref (Ls_ho) == LSNULL; Ls_ho -= 1)
         ;
      i = Ls_ho
      Ls_ho += 1
      Ls_ref (Ls_ho) = EOS

      if (and (Ci_trace, LS_TRACE) ~= 0)
         call print (TTY, "Open reduced to *i*n"p, Ls_ho)

      Ls_na = Ls_ho
      j = 0
      while (i > 1) {
         for (; Ls_ref (i) ~= LSNULL; i -= 1)
            if (i <= 1)
               break 2
         Ls_ref (i) = Ls_na + OS
         j += 1
         for (i -= 1; i > 1 && Ls_ref (i) == LSNULL; i -= 1) {
            Ls_ref (i) = LSVOID
            j += 1
            }
         Ls_na = i + 1
         }
      if (and (Ci_trace, LS_TRACE) ~= 0)
         call print (TTY, "Storage reclaimed: *i*n"p, j)
      }   # this loop never terminates

   end


# lsfree --- free linked string space

   subroutine lsfree (ptr, len)
   pointer ptr
   integer len

   include SWT_COMMON

   integer i, j, k

   if (ptr == 0 || Ls_ref (ptr) == LSNULL)   # Just in case
      return
   k = 0
   for (i = ptr; k < len; i = i + 1) {
      while (Ls_ref (i) >= OS) {
         j = i
         i = Ls_ref (j) - OS
         Ls_ref (j) = LSNULL
         }
      if (Ls_ref (i) == EOS) {
         Ls_ref (i) = LSNULL
         ptr = 0
         return
         }
      Ls_ref (i) = LSNULL
      k = k + 1
      }

   ptr = i

   return
   end


# lsinit --- initialize linked string space

   subroutine lsinit

   include SWT_COMMON

   Ls_top = MAXLSBUF - 1
   Ls_ho = 1
   Ls_na = 1
   Ls_ref (1) = EOS

   return
   end


# lsdump --- dump linked string space for debugging

   subroutine lsdump (fd)
   integer fd

   include SWT_COMMON

   integer i, j, pos

   call print (fd, "Top=*i  HO=*i  NA=*i*n"p, Ls_top, Ls_ho, Ls_na)
   for (i = 1; i <= Ls_ho; i += 1) {
      call print (fd, "*5i: "p, i)
      pos = 0
      select
         when (Ls_ref (i) == LSVOID) {    # unused part of a string
            j = 0
            for (; i <= Ls_ho && Ls_ref (i) == LSVOID; i += 1)
               j += 1
            call print (fd, "VOID (*i)*n"p, j)
            i -= 1   # incremented by outer 'for' loop
            }
         when (Ls_ref (i) == LSNULL) {    # not allocated to a string
            j = 0
            for (; i <= Ls_ho && Ls_ref (i) == LSNULL; i += 1)
               j += 1
            call print (fd, "NULL (*i)*n"p, j)
            i -= 1
            }
         when (Ls_ref (i) < OS) {         # a valid character
            call putch ('"'c, fd)
            for (; i <= Ls_ho && Ls_ref (i) < OS; i += 1) {
               if (pos > 60) {   # handle long lines
                  call print (fd, '" _*n       "'p)
                  pos = 0
                  }
               if (' 'c <= Ls_ref (i) && Ls_ref (i) < DEL) {
                  call putch (Ls_ref (i), fd)
                  pos += 1
                  }
               elif (Ls_ref (i) ~= EOS) {
                  call print (fd, "<*3,8i>"p, Ls_ref (i))
                  pos += 5
                  }
               else {
                  call print (fd, "<EOS>"p)
                  break
                  }
               }
            call putch ('"'c, fd)
            if (Ls_ref (i) >= OS)
               call print (fd, " -> *i"p, Ls_ref (i) - OS)
            call putch (NEWLINE, fd)
            }
      else
         call print (fd, "-> *i*n"p, Ls_ref (i) - OS)
     }

   return
   end

   undefine (getchar)
