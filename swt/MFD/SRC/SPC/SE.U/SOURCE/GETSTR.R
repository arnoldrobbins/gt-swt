# getstr --- get string from lin at i, copy to dst, bump i

### this routine only called in relation to the join command.
### be careful if you want to use it for something else

   integer function getstr (lin, i, dst, maxdst)
   character lin (MAXLINE), dst (maxdst)
   integer i, maxdst

   include SE_COMMON

   character delim
   character esc
   integer j, k, d

   j = i
   getstr = ERR
   Errcode = EBADSTR

   delim = lin (j)

   if (delim == NEWLINE) {
      lin (j) = '/'c
      lin (j + 1) = ' 'c     # join lines with a single blank
      lin (j + 2) = '/'c
      lin (j + 3) = NEWLINE
      lin (j + 4) = EOS
      delim = lin (j)
      Peekc = SKIP_RIGHT
      # now fall thru

      # return  # old way
      }
   else if ((delim == 'p'c || delim == 'P'c) && lin (j + 1) == NEWLINE) { # jp
      lin (j) = '/'c
      lin (j + 1) = ' 'c     # join lines with a single blank
      lin (j + 2) = '/'c
      lin (j + 3) = delim    # 'p' or 'P'
      lin (j + 4) = NEWLINE
      lin (j + 5) = EOS
      delim = lin (j)
      Peekc = SKIP_RIGHT
      # now fall thru
      }

   if (lin (j + 1) == NEWLINE) { # treat "j/" same as "j//"
      dst (1) = EOS
      Errcode = ENOERR
      return (OK)

      # return    # old way
      }

   # stuff there in the string, try to allow for missing final delimiter

   for (k = j + 1; lin (k) ~= NEWLINE; k += 1)
      ;  # find end

   k -= 1   # k points to char before newline

   if (lin (k) == 'p'c || lin (k) == 'P'c) {
      k -= 1
      if (lin (k) == delim &&
         (lin (k-1) ~= ESCAPE || lin (k-2) == ESCAPE))
         ;  # it's ok, leave it alone
      else {
         # ESCAPE delim p NEWLINE is the join string
         # supply  missing delim
         k += 2
         lin (k) = delim
         lin (k+1) = NEWLINE
         lin (k+2) = EOS
         Peekc = SKIP_RIGHT
         }
      }
   else if (lin (k) ~= delim           # no delim, and no p
            || (lin (k-1) == ESCAPE    # or last char is escaped delim
               && lin (k-2) ~= ESCAPE)) {
      # simply missing trailing delimiter
      # supply it
      k += 1
      lin (k) = delim
      lin (k+1) = NEWLINE
      lin (k+2) = EOS
      Peekc = SKIP_RIGHT
      }
   # else
      # delim is there
      # leave well enough alone

   for (k = j + 1; lin (k) ~= delim; k += 1) {  # find end
      if (lin (k) == NEWLINE || lin (k) == EOS)
         if (delim == ' 'c)
            break
         else
            return
      call esc (lin, k)
      }

   if (k - j > maxdst)  # string is too long for dst
      return

   for ({d = 1; j += 1}; j < k; {d += 1; j += 1})
      dst (d) = esc (lin, j)
   dst (d) = EOS

   i = j
   Errcode = EEGARB     # the default

   return (OK)

   end
