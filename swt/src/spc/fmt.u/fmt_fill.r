define (ADDCHAR(c,s,i),{s(i)=c;i+=1})

# boface --- print a line in boldface

   integer function boface (buf, tbuf, size)
   integer size
   character buf (ARB), tbuf (size)

   integer i, j, k, size_minus_1

   j = 1
   size_minus_1 = size - 1
   for (i = 1; buf (i) ~= EOS; i += 1) {
      if (buf (i) > ' 'c)    # if character is printable
         do k = 1, OVERSTRIKES
            if (j < size_minus_1) {
               ADDCHAR (buf (i), tbuf, j)
               ADDCHAR (BACKSPACE, tbuf, j)
               }
            else
               break
      if (j < size)
         ADDCHAR (buf (i), tbuf, j)
      else
         break
      }

   tbuf (j) = EOS

   return (j - 1)

   end



# brk --- end current filled line

   subroutine brk

   include FMT_COMMON

   if (Nobreak == YES)
      return
   if (Outp > 1) {
      repeat {
         Outp -= 1
         Outw -= 1
         } until (Outbuf (Outp) ~= ' 'c && Outbuf (Outp) ~= PHANTOMBL
               || Outp < 1)
      Outp += 1
      Outw += 1
      if (Adjust == 'r'c)
         Tival = Rmval - Lmval - Outw + 1
      elif (Adjust == 'c'c)
         Tival = (Rmval - Lmval - Outw + 1) / 2
      Outbuf (Outp) = NEWLINE
      Outbuf (Outp + 1) = EOS
      call put (Outbuf)
      }

   Outp = 1
   Outw = 0
   Outwds = 0
   Word_last = NO

   return
   end



# center --- center a line by setting tival

   subroutine center (buf)
   character buf (ARB)

   include FMT_COMMON

   integer width

   call tailbl (buf)
   Tival = max0 ((Rmval - Lmval - width (buf) + 1) / 2, 0)

   return
   end



# divok --- returns OK if word is divisible at i, i - 1

   integer function divok (word, i)
   character word (ARB)
   integer i

   integer k1, k2, k3, j, count1, count2
   integer suffix, index
   character lc, rc, c
   character mapdn
   bits lck (26, 2)

                  #   abehkn                 qrux
   data lck ( 1, 1) /:000000/, lck ( 1, 2) /:000000/,  # a
        lck ( 2, 1) /:073555/, lck ( 2, 2) /:133500/,  # b
        lck ( 3, 1) /:073155/, lck ( 3, 2) /:133500/,  # c
        lck ( 4, 1) /:072575/, lck ( 4, 2) /:133500/,  # d
        lck ( 5, 1) /:000000/, lck ( 5, 2) /:000000/,  # e
        lck ( 6, 1) /:071555/, lck ( 6, 2) /:123500/,  # f
        lck ( 7, 1) /:073171/, lck ( 7, 2) /:133500/,  # g
        lck ( 8, 1) /:073575/, lck ( 8, 2) /:173500/,  # h
        lck ( 9, 1) /:000000/, lck ( 9, 2) /:000000/,  # i
        lck (10, 1) /:073575/, lck (10, 2) /:173500/,  # j
        lck (11, 1) /:073575/, lck (11, 2) /:173500/,  # k
        lck (12, 1) /:073575/, lck (12, 2) /:171500/,  # l
        lck (13, 1) /:073575/, lck (13, 2) /:173500/,  # m
        lck (14, 1) /:052565/, lck (14, 2) /:143500/,  # n
        lck (15, 1) /:000000/, lck (15, 2) /:000000/,  # o
        lck (16, 1) /:073155/, lck (16, 2) /:133500/,  # p
        lck (17, 1) /:073575/, lck (17, 2) /:173500/,  # q
        lck (18, 1) /:073524/, lck (18, 2) /:123500/,  # r
        lck (19, 1) /:053114/, lck (19, 2) /:161500/,  # s
        lck (20, 1) /:053175/, lck (20, 2) /:112500/,  # t
        lck (21, 1) /:000000/, lck (21, 2) /:000000/,  # u
        lck (22, 1) /:073575/, lck (22, 2) /:173500/,  # v
        lck (23, 1) /:073155/, lck (23, 2) /:133500/,  # w
        lck (24, 1) /:073575/, lck (24, 2) /:173500/,  # x
        lck (25, 1) /:000000/, lck (25, 2) /:000000/,  # y
        lck (26, 1) /:073575/, lck (26, 2) /:173500/   # z
                  #   abehkn                 qrux

   divok = ERR
   count1 = 0
   for (j = 1; j <= i - 1; j += 1) {
      c = word (j)
      if (c == '-'c || c == '/'c || c == '_'c || c == '<'c || c == '>'c
            || c == hlf || c == hlr)
         return
      if (IS_LETTER (c))
         count1 += 1
      }

   count2 = 0
   for (j = i; word (j) ~= EOS; j += 1) {
      c = word (j)
      if (c == '-'c || c == '/'c || c == '_'c || c == '<'c || c == '>'c
            || c == hlf || c == hlr)
         return
      if (IS_LETTER (c))
         count2 += 1
      }

   if (count1 < 3 || count2 < 3)
      return             # must be >= 3 letters on each side of division

   for (j = 1; ; j += 1) {    # check for vowel in each side
      if (index ("eaoiuyEAOIUY"s, word (j)) ~= 0)
         break
      elif (j >= i - 1)
         return
      }

   for (j = i; ; j += 1) {
      if (index ("eaoiuyEAOIUY"s, word (j)) ~= 0)
         break
      elif (word (j) == EOS)
         return
      }

   if (suffix (word (i)) == YES && word (i - 2) ~= word (i - 1)) {
      divok = OK
      return
      }

   lc = mapdn (word (i - 1))
   rc = mapdn (word (i))

   if (~ IS_LETTER (lc) || ~ IS_LETTER (rc))
      return

   k1 = lc - 'a'c + 1
   k2 = (rc - 'a'c) div BITS_PER_WORD + 1
   k3 = mod (rc - 'a'c, BITS_PER_WORD) + 1
   if (and (rs (lck (k1, k2), BITS_PER_WORD - k3), 1) ~= 1)
      return   # division cannot occur between these letters

   divok = OK

   return
   end



# getwrd --- get non-blank word from in (i) into  out, increment i

   integer function getwrd (in, i, out)
   integer in (ARB), out (ARB)
   integer i

   include FMT_COMMON

   integer j
   character c

   while ((in (i) == ' 'c || in (i) == TAB) && in (i) ~= Tabch)
      i += 1

   j = 1
   if (in (i) == Tabch) {
      out (j) = Tabch
      i += 1
      j += 1
      }
   else
      repeat {
         c = in (i)
         if (c == ' 'c || c == TAB || c == Tabch || c == NEWLINE
               || c == EOS)
            break
         out (j) = c
         i += 1
         j += 1
         }

   out (j) = EOS
   getwrd = j - 1

   return
   end



# hynate --- divide a word for hyphenation

   integer function hynate (word, room, left, right)
   character word (ARB), left (ARB), right (ARB)
   integer room

   include FMT_COMMON

   integer i, j, l
   integer divok, length, width

   hynate = Hyphenation
   if (hynate == NO)
      return

   l = length (word)
   for (i = l - 1; i > 2; i -= 1)
      if (divok (word, i) == OK) {
         for (j = 1; j < i; j += 1)
            left (j) = word (j)
         left (j) = '-'c
         left (j + 1) = EOS
         if (width (left) <= room) {
            call scopy (word, i, right, 1)
            return
            }
         }
      elif (word (i) == '-'c)      # attempt to divide on hyphen
         if (l - i >= 2) {   # make sure word is long enough
            for (j = 1; j <= i; j += 1)
               left (j) = word (j)
            left (j) = EOS
            if (width (left) <= room) {
               call scopy (word, i + 1, right, 1)
               return
               }
            }

   hynate = NO

   return
   end



# leadbl --- delete leading blanks, set tival

   subroutine leadbl (buf)
   character buf (MAXLINE)

   include FMT_COMMON

   integer i, j

   call brk
   for (i = 1; buf (i) == ' 'c; i += 1)   # find 1st non-blank
      ;
   if (buf (i) ~= NEWLINE)
      Tival = i - 1 + Inval
   for (j = 1; buf (i) ~= EOS; j += 1) {   # move line to left
      buf (j) = buf (i)
      i += 1
      }
   buf (j) = EOS

   return
   end



# nxblnk --- determine if an extra blank is needed after a word

   integer function nxblnk (buf, i)
   character buf (ARB)
   integer i

   include FMT_COMMON

   nxblnk = Extra_blank_mode
   if (nxblnk == NO)
      return

   if (buf (i) == '.'c               # does word have sentence punctuation?
         || buf (i) == '!'c
         || buf (i) == '?'c
         || buf (i) == ':'c)
      nxblnk = YES
   elif ((buf (i) == '"'c            # or is it enclosed,
            || buf (i) == "'"c
            || buf (i) == ')'c
            || buf (i) == ']'c
            || buf (i) == '}'c
            || buf (i) == '>'c)
         && (buf (i - 1) == '.'c     # with punctuation inside?
            || buf (i - 1) == '!'c
            || buf (i - 1) == '?'c
            || buf (i - 1) == ':'c))
      nxblnk = YES
   else
      nxblnk = NO

   return
   end



# pfoot --- put out page footer

   subroutine pfoot

   include FMT_COMMON

   character title (MAXOUT)

   call skip (M3val)

   if (M4val > 0) {
      if (and (Curpag, 1) == 0)  # this is an even page
         call massin (Even_footer, title, MAXOUT)
      else
         call massin (Odd_footer, title, MAXOUT)
      call puttl (title, Curpag)

      call skip (M4val-1)
      }
   Lineno = 0
   Nospace = YES

   return
   end



# phead --- put out page header

   subroutine phead

   include FMT_COMMON

   character c, title (MAXOUT)

   Curpag = Newpag            # these lines moved to effect
   Newpag += 1                # starting/ending page options
   Lineno = M1val + M2val + 1
   CHECK_PAGE_RANGE
   if (Stop_mode == YES) {
      call putch (BELL, ERROUT)
      call getch (c, ERRIN)
      }
   if (M1val > 0) {
      call skip (M1val-1)
      if (and (Curpag, 1) == 0)  # this is an even-numbered page
         call massin (Even_header, title, MAXOUT)
      else
         call massin (Odd_header, title, MAXOUT)
      call puttl (title, Curpag)
      }

   call skip (M2val)

   return
   end



# put --- put out line with proper spacing and indenting

   subroutine put (buf)
   character buf (ARB)

   include FMT_COMMON

   integer i, j, w, numbl, offset
   character buffer (MAXOUT)

   Nospace = NO

   if (Lineno == 0 || Lineno > Bottom)
      call phead

   if (Curpag >= Start_page && Curpag <= End_page) {  # if printing
      # use buffered i/o to handle page offset, margin, and indentation:
      offset = Poval
      if (and (Curpag, 1) ~= 0)  # an odd page
         offset += Ooval
      else
         offset += Eoval
      numbl = offset + Lmval + Tival + Moval - 1
      for (i = 1; i <= numbl; i += 1)
         buffer (i) = ' 'c
      buffer (i) = EOS
      if (Moval > 0)                   # set the marginal character
         buffer (offset + 1) = Tmcch
      if (numbl > 0)
         call putlin (buffer, STDOUT)
      }

   Tival = Inval
   Tmcch = Mcch
   Mcout = YES
   w = 1
   j = 1

   if (Curpag >= Start_page && Curpag <= End_page) {
      for (i = 1; buf (i) ~= EOS; i += 1)
         if (buf (i) == Tabch) {
            repeat {
               buffer (j) = Replch
               j += 1
               w += 1
               } until (Tabs (w) == YES || w > MAXLINE)
            }
         else {
            if (buf (i) == BACKSPACE)
               w -= 1
            else
               w += 1
            buffer (j) = buf (i)
            j += 1
            }
      buffer (j) = EOS
      call putlin (buffer, STDOUT)
      }

   call skip (min0 (Lsval-1, Bottom-Lineno))
   Lineno += Lsval
   if (Lineno > Bottom)
      call pfoot

   return
   end



# puttab --- evaluate tabs into outbuf

   subroutine puttab

   include FMT_COMMON

   integer i, llval

   llval = Rmval - Tival - Lmval + 1
   for (i = 1; i < Outp; i += 1) # fix output to this point (no filling)
      if (Outbuf (i) == ' 'c)
         Outbuf (i) = PHANTOMBL

   repeat {
      if (Outw >= llval)
         break
      Outbuf (Outp) = Replch
      Outp += 1
      Outw += 1
      } until (Tabs (Outw + 1) == YES)

   Outwds = 1
   Word_last = NO

   return
   end



# puttl --- put out title line with optional page number

   subroutine puttl (buf, pageno)
   character buf (ARB)
   integer pageno

   include FMT_COMMON

   character title (MAXOUT)
   integer i

   CHECK_PAGE_RANGE
   i = Poval + Moval + Lmval - 1
   if (and (Curpag, 1) ~= 0)
      i += Ooval
   else
      i += Eoval
   call print (STDOUT, "*#x"s, i)
   call mktl (buf, pageno, title, MAXOUT)
   call putlin (title, STDOUT)

   return
   end



# putw --- insert a word in outbuf, bump counters

   subroutine putw (word, ww, wl)
   character word (ARB)
   integer ww, wl

   include FMT_COMMON

   integer nxblnk

   if (Word_last == YES || Outp == 1)
      Outwds += 1
   call scopy (word, 1, Outbuf, Outp)
   Outp += wl
   Outw += ww
   if (nxblnk (Outbuf, Outp - 1) == YES) {
      Outbuf (Outp) = PHANTOMBL
      Outp += 1
      Outw += 1
      }

   return
   end



# putwrd --- put a word in outbuf, handle tabs

   subroutine putwrd (wrdbuf)
   character wrdbuf (ARB)

   include FMT_COMMON

   character left (INSIZE), right (INSIZE)
   integer ww, llval, room
   integer width, length, hynate

   if (wrdbuf (1) == Tabch)
      call puttab
   else {
      llval = Rmval - Tival - Lmval + 1
      ww = width (wrdbuf)
      if (Word_last == YES) {
         Outbuf (Outp) = ' 'c    # blank between words
         Outp += 1
         Outw += 1
         }
      room = llval - Outw
      if (ww <= room)
         call putw (wrdbuf, ww, length (wrdbuf))
      elif (hynate (wrdbuf, room, left, right) == YES) {
         call putw (left, width (left), length (left))
         if (Adjust == 'b'c)
            call spread (Outbuf, Outp, llval - Outw, Outwds)
         call brk
         call putw (right, width (right), length (right))
         }
      else {
         repeat {
            Outp -= 1
            Outw -= 1
            } until (Outp < 1
                  || Outbuf (Outp) ~= ' 'c && Outbuf (Outp) ~= PHANTOMBL)
         Outp += 1
         Outw += 1
         if (Adjust == 'b'c)
            call spread (Outbuf, Outp, llval - Outw, Outwds)
         call brk
         call putw (wrdbuf, ww, length (wrdbuf))
         }
      Word_last = YES
      }

   return
   end



# set --- set parameter and check range

   subroutine set (param, val, argtyp, defval, minval, maxval)
   integer param, val, argtyp, defval, minval, maxval

   if (argtyp == NEWLINE)     # defaulted
      param = defval
   elif (argtyp == '+'c)      # relative +
      param += val
   elif (argtyp == '-'c)      # relative -
      param -= val
   else                       # absolute
      param = val
   if (param > maxval)
      param = maxval
   elif (param < minval)
      param = minval

   return
   end



# settab --- set tab stops after a .ta command

   subroutine settab (buf)
   character buf (ARB)

   include FMT_COMMON

   integer i, n, l
   integer ctoi

   l = 1
   for (i = 1; i <= MAXLINE; i += 1)
      Tabs (i) = NO
   for (i = 1; buf (i) ~= ' 'c && buf (i) ~= TAB && buf (i) ~= NEWLINE;
         i += 1)
      ;
   repeat {
      n = ctoi (buf, i)
      if (n == 0)
         if (buf (i) == NEWLINE)
            break
         else {
            i += 1
            next
            }
      if (n >= 1 && n <= MAXLINE) {
         Tabs (n) = YES
         if (l < n)
            l = n
         }
      }

   for (; l <= MAXLINE; l += 1)
      Tabs (l) = YES

   return
   end



# space --- space  n  lines or to bottom of page

   subroutine space (n)
   integer n

   include FMT_COMMON

   if (Lineno > Bottom)
      return
   if (Lineno == 0)
      call phead
   call skip (min0 (n, Bottom+1-Lineno))
   Lineno += n
   if (Lineno > Bottom)
      call pfoot

   return
   end



# spread --- spread words to justify right margin

   subroutine spread (buf, outp, nextra, outwds)
   character buf (ARB)
   integer outp, nextra, outwds

   integer dir, i, j, nb, num_e, nholes
   data dir /0/

   if (nextra <= 0 || outwds <= 1)
      return
   dir = 1 - dir   # reverse previous direction
   num_e = nextra
   nholes = outwds - 1
   i = outp - 1
   j = min0 (MAXOUT-2, i+num_e)   # leave room for NEWLINE, EOS
   while (i < j) {
      buf (j) = buf (i)
      if (buf (i) == ' 'c) {
         if (dir == 0)
            nb = (num_e-1) / nholes + 1
         else
            nb = num_e / nholes
         num_e -= nb
         nholes -= 1
         for ( ; nb > 0; nb -= 1) {
            j -= 1
            buf (j) = ' 'c
            }
         }
      i -= 1
      j -= 1
      }
   outp += nextra

   return
   end



# suffix --- return YES if str is a suffix, NO otherwise

   integer function suffix (str)
   character str (ARB)

   integer i
   integer strbsr
   character lcstr (MAXLINE)
   character mapdn

   string_table sufptr, suffixes _
      / "ing" _
      / "tion"

   for (i = 1; str (i) ~= EOS; i += 1)
      lcstr (i) = mapdn (str (i))
   lcstr (i) = EOS

   if (strbsr (sufptr, suffixes, 0, lcstr) ~= EOF)
      suffix = YES
   else
      suffix = NO

   return
   end



# italic --- italicize a line

   integer function italic (buf, tbuf, size)
   integer size
   character buf (ARB), tbuf (size)

   include FMT_COMMON

   integer i, j, size_minus_1

call print (ERROUT, "<<*s>> <<*i>>*n"s, buf, size)

   j = 1
   size_minus_1 = size - 1
   for (i = 1; buf (i) ~= EOS; i += 1)
   {
      if (buf (i) ~= Tabch && buf (i) >= ' 'c && buf (i) ~= ' 'c)
      {
         if (j < size_minus_1)
         {
            ADDCHAR (buf (i), tbuf, j)
            ADDCHAR (BACKSPACE, tbuf, j)
         }
         else
            break
      }
      if (j < size)
      {
         if (buf (i) == ' 'c)
            ADDCHAR (buf (i), tbuf, j)
         else if (buf (i) >= ' 'c)
            ADDCHAR ('_'c, tbuf, j)
      }
      else
         break
   }

   tbuf (j) = EOS

   return (j - 1)

   end



# underl --- underline a line

   integer function underl (buf, tbuf, size, cflag)
   integer size, cflag
   character buf (ARB), tbuf (size)

   include FMT_COMMON

   integer i, j, size_minus_1
   integer index

   string schars "#$%&'=-~^@+*"

   j = 1
   size_minus_1 = size - 1
   for (i = 1; buf (i) ~= EOS; i += 1) {
      if (buf (i) ~= Tabch
            && buf (i) >= ' 'c
            && (cflag ~= NO || IS_LETTER (buf (i)) || IS_DIGIT (buf (i))
                      || index (schars, buf (i)) ~= 0)) {
         if (j < size_minus_1) {
            ADDCHAR ('_'c, tbuf, j)
            ADDCHAR (BACKSPACE, tbuf, j)
            }
         else
            break
         }
      if (j < size)
         ADDCHAR (buf (i), tbuf, j)
      else
         break
      }

   tbuf (j) = EOS

   return (j - 1)

   end
