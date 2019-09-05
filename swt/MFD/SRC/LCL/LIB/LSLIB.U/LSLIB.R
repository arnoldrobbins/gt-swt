define(MAXLSBUF,4090)
define(ALL,9999)
define(LSNULL,-1)
define(LSVOID,-2)
define(OS,300)


# lsgetf --- get an arbitrarily long linked string from fd
   integer function lsgetf (ptr, fd)
   pointer ptr
   integer fd

   character line (MAXLINE)
   integer str_len, line_len
   pointer j, k
   integer getlin

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   call lsallo (ptr, 0)
   k = ptr
   str_len = 0

   repeat {
      line_len = getlin (line, fd)
      if (line_len == EOF) {
         lsgetf = EOF
         break
         }
      else if (line (line_len) == NEWLINE) {
         call lsmake (j, line)
         call lsjoin (k, j)
         lsgetf = str_len + line_len
         break
         }
      else if (line (line_len) == ETX) {
         line (line_len) = EOS
         line_len -= 1
         }
      call lsmake (j, line)
      call lsjoin (k, j)
      str_len += line_len
      call lspos (k, ALL)
      }

   return
   end


# lsputf --- put an arbitrarily long linked string on fd
   subroutine lsputf (ptr, fd)
   pointer ptr
   integer fd

   character line (MAXLINE)
   pointer k
   character lspos

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

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

   pointer k

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   k = ptr1
   call lspos (k, ALL)
   ref (k) = ptr2 + OS
   lsjoin = ptr1

   return
   end


# lscmpk --- compare a linked string to a K & P string
   character function lscmpk (ptr, str)
   pointer ptr
   character str (ARB)

# Variables:
   pointer i1
   integer i2
   character c1, c2

# Functions:
   character lsgetc

   i1 = ptr
   i2 = 1
   c2 = str (i2)
   while (lsgetc (i1, c1) == c2) {
      if (c1 == EOS) {
         lscmpk = '='c
         return
         }
      i2 += 1
      c2 = str (i2)
      }
   if (c1 == EOS || c2 ~= EOS && c1 < c2)
      lscmpk = '<'c
   else
      lscmpk = '>'c

   return
   end


# lscomp --- compare two linked strings, return GREATER, EQUALS or LESS
   character function lscomp (str1, str2)
   pointer str1, str2

# Variables:
   pointer i1, i2
   character c1, c2

# Functions:
   character lsgetc

   i1 = str1
   i2 = str2
   while (lsgetc (i1, c1) == lsgetc (i2, c2))
      if (c1 == EOS) {
         lscomp = '='c
         return
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
   character lspos

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

   integer i, j, c
   character lspos
   integer lslen
   pointer lssubs

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

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
      ref (j) = c
      ref (i) = j + OS
      call lspos (j, ALL)
      ref (j) = i + 1 + OS
      }
   else {  # Special case for prepend
      j = lssubs (ptr2, pos2, len)
      i = ptr1
      ptr1 = j
      call lspos (j, ALL)
      ref (j) = i + OS
      }

   return
   end


# lstake --- take characters from a linked string
   pointer function lstake (ptr, len)
   pointer ptr
   integer len

   character c
   pointer i, j
   character lsgetc, lsputc
   pointer lsallo

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

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

   pointer j

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   lsdrop = 0
   call lscopy (j, len + 1, lsdrop, 1)
   return
   end


# lssubs --- take a substring of a linked string
   pointer function lssubs (ptr, pos, len)
   pointer ptr
   integer pos, len

   character c
   pointer j, k
   integer i, len1
   character lsgetc, lspos
   integer lslen
   pointer lsallo

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   if (len >= ALL)
      len1 = lslen (ptr) - pos + 2
   else
      len1 = len
   lssubs = lsallo (k, len1)
   j = ptr
   c = lspos (j, pos)
   for (i = 1; i <= len & c ~= EOS; i += 1)
      call lsputc (k, lsgetc (j, c))
   return
   end


# lsdel --- delete characters from a linked string
   subroutine lsdel (ptr, pos, len)
   pointer ptr
   integer pos, len

   integer i, j

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   if (len <= 0)
      return
   i = ptr
   call lspos (i, pos)
   j = i
   call lsfree (j, len)
   if (j == 0)
      ref (i) = EOS
   else
      ref (i) = j + OS
   return
   end


# lscopy --- copy linked string
   subroutine lscopy (ptr1, pos1, ptr2, pos2)
   pointer ptr1, ptr2
   integer pos1, pos2

   integer c, j, k
   character lsgetc, lsputc
   integer lslen

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   j = ptr1
   call lspos (j, pos1)
   if (ptr2 == 0)
      call lsallo (ptr2, pos2 - 1 + lslen (j))
   k = ptr2
   call lspos (k, pos2)
   while (lsputc (k, lsgetc (j, c)) ~= EOS)
      ;
   return
   end


# lspos --- find position in linked string
   character function lspos (ptr, pos)
   pointer ptr
   integer pos

   integer i

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   for (i = 1; i < pos; i += 1) {
      while (ref (ptr) >= OS)
         ptr = ref (ptr) - OS
      if (ref (ptr) == EOS)
         break
      ptr += 1
      }
   while (ref (ptr) >= OS)
      ptr = ref (ptr) - OS
   lspos = ref (ptr)
   return
   end


# lsmake --- convert K & P string to linked string
   pointer function lsmake (ptr, str)
   pointer ptr
   character str (ARB)

   integer i, j
   integer length

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   call lsallo (ptr, length (str))
   j = ptr
   for (i = 1; str (i) ~= EOS; i += 1)
      call lsputc (j, str (i))
   lsmake = ptr
   return
   end


# lsextr --- extract K & P string from linked string
   integer function lsextr (ptr, str, max)
   pointer ptr
   character str (ARB)
   integer max

   integer i, j
   character lsgetc

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   j = ptr
   for (i = 1; i < max; i += 1)
      if (lsgetc (j, str (i)) == EOS)
         break
   str (i) = EOS
   lsextr = i - 1
   return
   end


# lslen --- compute length of linked string
   integer function lslen (ptr)
   pointer ptr

   integer i, j, c
   character lsgetc

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   j = ptr
   for (i = 1; lsgetc (j, c) ~= EOS; i += 1)
      ;
   lslen = i - 1
   return
   end


# lsgetc --- get character from linked string
   character function lsgetc (ptr, c)
   pointer ptr
   character c

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   while (ref (ptr) >= OS)
      ptr = ref (ptr) - OS
   c = ref (ptr)
   lsgetc = c
   if (ref (ptr) ~= EOS) {
      ptr += 1
      while (ref (ptr) >= OS)
         ptr = ref (ptr) - OS
      }
   return
   end


# lsputc --- put character into a linked string
   character function lsputc (ptr, c)
   pointer ptr
   character c

   integer i

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   while (ref (ptr) >= OS)
      ptr = ref (ptr) - OS
   if (ref (ptr) ~= EOS) {
      ref (ptr) = c
      ptr += 1
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

   integer i, j, flag

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   flag = NO
   repeat {
      if (ho + len + 2 <= top) {
         ptr = ho + 1
         ho += len + 1
         for (i = ptr; i < ho; i += 1)
            ref (i) = LSVOID
         ref (ho) = EOS
         lsallo = ptr
         return
         }
      j = 0
      for (i = na; ref (i) ~= EOS; i += 1) {
         while (ref (i) >= OS)
            i = ref (i) - OS
         if (ref (i) == EOS)
            break
         j += 1
         if (j > len) {
            ptr = na
            ref (i) = EOS
            na = i + 1
            lsallo = ptr
            return
            }
         }

      if (flag == YES) {
         call remark ("Too many linked strings"s)
         call lsdump
         call error ("program terminated"s)
         }

      flag = YES

      call lsfree (na, ALL)
      for (; ref (ho) == LSNULL; ho -= 1)
         ;
      i = ho
      ho += 1
      ref (ho) = EOS
      na = ho
      while (i > 1) {
         for (; ref (i) ~= LSNULL; i -= 1)
            ;
         if (i <= 1)
            break 2
         ref (i) = na + OS
         for (i -= 1; ref (i) == LSNULL & i > 1; i -= 1)
            ref (i) = LSVOID
         na = i + 1
         }
      }
   return
   end


# lsfree --- free linked string space
   subroutine lsfree (ptr, len)
   pointer ptr
   integer len

   integer i, j, k

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   if (ptr == 0 || ref (ptr) == LSNULL)   # Just in case
      return
   k = 0
   for (i = ptr; k < len; i += 1) {
      while (ref (i) >= OS) {
         j = i
         i = ref (j) - OS
         ref (j) = LSNULL
         }
      if (ref (i) == EOS) {
         ref (i) = LSNULL
         ptr = 0
         return
         }
      ref (i) = LSNULL
      k += 1
      }
   ptr = i
   return
   end


# lsinit --- initialize linked string space
   subroutine lsinit

   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   top = MAXLSBUF - 1
   ho = 1
   na = 1
   ref (1) = EOS
   return
   end


# lsdump --- dump linked string space for debugging
   subroutine lsdump

   integer i, j, pos
   integer top, na, ho, ref (MAXLSBUF)
   common /ls$buf/ top, na, ho, ref

   call print (ERROUT, "Top=*i  HO=*i  NA=*i*n"s, top, ho, na)
   for (i = 1; i <= ho; i += 1) {
      call print (ERROUT, "Loc *i:  "s, i)
      pos = 0
      select
         when (ref (i) == LSVOID) {
            j = 0
            for (; i <= ho & ref (i) == LSVOID; i += 1)
               j += 1
            call print (ERROUT, "LSVOID (*i)*n"s, j)
            i -= 1
            }
         when (ref (i) == LSNULL) {
            j = 0
            for (; i <= ho & ref (i) == LSNULL; i += 1)
               j += 1
            call print (ERROUT, "LSNULL (*i)*n"s, j)
            i -= 1
            }
         when (ref (i) < OS) {
            call print (ERROUT, ">>"s)
            for (; i <= ho & ref (i) < OS; i += 1) {
               if (ref (i) >= ' 'c & ref (i) <= '~'c)
                  call putch (ref (i), ERROUT)
               else
                  call print (ERROUT, "<*i>"s, ref (i))
               pos += 1
               if (pos > 20) {
                  call print (ERROUT, "*n> > > > > >"s)
                  pos = 0
                  }
               if (ref (i) == EOS) {
                  i += 1
                  break
                  }
               }
            call print (ERROUT, "<<*n"s)
            i -= 1
            }
     else
         call print (ERROUT, "Ptr *i*n"s, ref (i) - OS)
     }
   return
   end
