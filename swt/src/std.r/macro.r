# macro --- expand macros with arguments

   include ARGUMENT_DEFS

   define(ALPHA,-100)
   define(MAXTBL,32000)
   define(MAXPTR,500)
   define(CALLSIZE,20)
   define(ARGSIZE,100)
   define(MAXDEF,400)
   define(MAXTOK,MAXLINE)
   define(MAXIFILES,10)
   define(MAXOFILES,10)

   define(ARGFLAG,'$'c)

# builtins:
   define(DEFTYPE,-10)
   define(IFTYPE,-11)
   define(INCTYPE,-12)
   define(SUBTYPE,-13)
   define(INCLTYPE,-14)
   define(DIVTYPE,-15)
   define(DNLTYPE,-16)
   define(UNDEFTYPE,-17)

   define(EVALSIZE,2000)
   define(BUFSIZE,500)

   include "macro_com.r.i"

   ARG_DECL
   character defn(MAXDEF), t, token(MAXTOK)
   character gettok

   integer ap, argstk(ARGSIZE), callst(CALLSIZE), nlb, plev(CALLSIZE)
   integer lookup, push

   integer table (MAXTBL)
   common /ds$mem/ table         # for dynamic storage manager

   integer deftyp(2), inctyp(2), subtyp(2), iftyp(2), incltyp (2),
      divtyp (2), dnltyp (2), undeftyp (2)

   data deftyp /DEFTYPE, EOS/,
      inctyp /INCTYPE, EOS/,
      subtyp /SUBTYPE, EOS/,
      iftyp /IFTYPE, EOS/,
      incltyp /INCLTYPE, EOS/,
      divtyp /DIVTYPE, EOS/,
      dnltyp /DNLTYPE, EOS/,
      undeftyp /UNDEFTYPE, EOS/

   PARSE_COMMAND_LINE ("[-e]"s, "Usage: macro [-e]"s)

   bp = 0
   lastp = 0

   call dsinit (MAXTBL)             # initialize managed memory area

   ifp = 1; ifst (ifp) = STDIN1
   ofp = 1; ofst (ofp) = STDOUT1

   call instal ("define"s, deftyp)
   call instal ("incr"s, inctyp)
   call instal ("substr"s, subtyp)
   call instal ("ifelse"s, iftyp)
   call instal ("incl"s, incltyp)
   call instal ("divert"s, divtyp)
   call instal ("dnl"s, dnltyp)
   call instal ("undefine"s, undeftyp)

   cp = 0
   ap = 1
   ep = 1

   for (t=gettok(token, MAXTOK); t ~= EOF; t=gettok(token, MAXTOK)) {

      if (t == ALPHA) {
         if (lookup(token, defn) == NO)
            call puttok(token)
         else {            # defined; put it in eval stack
            cp += 1
            if (cp > CALLSIZE)
               call error("call stack overflow"p)
            callst(cp) = ap
            ap = push(ep, argstk, ap)
            call puttok(defn)   # stack definition
            call putchr(EOS)
            ap = push(ep, argstk, ap)
            call puttok(token)   # stack name
            call putchr(EOS)
            ap = push(ep, argstk, ap)
            t = gettok(token, MAXTOK)   # peek at next
            call pbstr(token)
            if (t ~= '('c)   # add ( ) if not present
               call pbstr("()"s)
            plev(cp) = 0
            }
         }

      elif (t == '['c) {      # strip one level of [ ]
         nlb = 1
         repeat {
            t = gettok(token, MAXTOK)
            if (t == '['c)
               nlb += 1
            elif (t == ']'c) {
               nlb -= 1
               if (nlb == 0)
                  break
               }
            elif (t == EOF)
               call error("EOF in string"p)
            call puttok(token)
            }
         }

      elif (cp == 0)         # not in a macro at all
         call puttok(token)

      elif (t == '('c) {
         if (plev(cp) > 0)
            call puttok(token)
         plev(cp) += 1
         }

      elif (t == ')'c) {
         plev(cp) -= 1
         if (plev(cp) > 0)
            call puttok(token)
         else {            # end of argument list
            call putchr(EOS)
            call eval(argstk, callst(cp), ap-1)
            ap = callst(cp)   # pop eval stack
            ep = argstk(ap)
            cp -= 1
            }
         }

      elif (t == ','c && plev(cp) == 1) {   # new arg
         call putchr(EOS)
         ap = push(ep, argstk, ap)
         }

      elif (t == ESCAPE && ARG_PRESENT(e)) {
         call ngetc(t)
         call putchr(t)
         }

      else
         call puttok(token)      # just stack it
      }

   if (cp ~= 0)
      call error("unexpected EOF"p)

   for (; ofp > 1; ofp -= 1)   # close 'divert' and 'include' files
      call close (ofst (ofp))
   for (; ifp > 1; ifp -= 1)
      call close (ifst (ifp))

   stop
   end



# gettok - get alphanumeric string or single non-alpha for define

   character function gettok(token, toksiz)
   integer toksiz
   character token(toksiz)

   integer i

   character ngetc, type

   for (i = 1; i < toksiz; i += 1) {
      gettok = type(ngetc(token(i)))
      if (gettok ~= LETTER && gettok ~= DIGIT && gettok ~= '_'c)
         break
      }

   if (i >= toksiz)
      call error("token too long"p)

   if (i > 1) {         # some alpha was seen
      call putbak(token(i))
      i -= 1
      gettok = ALPHA
      }

   # else single character token
   token(i+1) = EOS
   return
   end



# lookup - locate name, extract definition from table

   integer function lookup(name, defn)
   character name (MAXTOK), defn (MAXDEF)

   include "macro_com.r.i"

   integer i, j, k

   integer table (MAXTBL)
   common /ds$mem/ table         # for memory manager

   for (i = lastp; i > 0; i -= 1) {
      j = namptr(i)
      for (k = 1; name(k) == table(j) && name(k) ~= EOS; k += 1)
         j += 1
      if (name(k) == table(j)) {      # got one
         call scopy(table, j+1, defn, 1)
         lookup = YES
         return
         }
      }

   lookup = NO
   return
   end



# instal --- add name and definition to table

   subroutine instal (name, defn)
   character name (MAXTOK), defn (MAXDEF)

   include "macro_com.r.i"

   integer table (MAXTBL)
   common /ds$mem/ table            # for memory manager

   integer nlen
   integer length

   pointer p
   pointer dsget

   call uninstal (name)             # remove from table if already there

   if (lastp >= MAXPTR) {
      call putlin (name, ERROUT)
      call remark (": too many definitions"p)
      return
      }

   nlen = length (name) + 1         # +1 for EOS
   p = dsget (nlen + length (defn) + 1)
   lastp = lastp + 1
   namptr (lastp) = p
   call scopy (name, 1, table, p)
   call scopy (defn, 1, table, p + nlen)

   return
   end



# push - push ep onto argstk, return new pointer ap

   integer function push(ep, argstk, ap)
   integer ep, argstk(ARGSIZE), ap

   if (ap > ARGSIZE)
      call error("arg stack overflow"p)
   argstk(ap) = ep
   push = ap + 1

   return
   end



# puttok - put a token either on output or into evaluation stack

   subroutine puttok(str)
   character str(MAXTOK)

   integer i

   for (i = 1; str(i) ~= EOS; i += 1)
      call putchr(str(i))

   return
   end



# putchr - put single char on output or into evaluation stack

   subroutine putchr(c)
   character c

   include "macro_com.r.i"

   if (cp == 0)
      call putch(c, ofst (ofp))
   else {
      if (ep > EVALSIZE)
         call error("evaluation stack overflow"p)
      evalst(ep) = c
      ep += 1
      }

   return
   end



# eval - expand args i through j: evaluate builtin or push back defn

   subroutine eval(argstk, i, j)
   integer argstk (ARGSIZE), i, j

   include "macro_com.r.i"

   integer argno, k, m, n, t
   integer index, length

   t = argstk(i)
   select (evalst (t))
      when (DEFTYPE)
         call dodef(argstk, i, j)
      when(INCTYPE)
         call doincr(argstk, i, j)
      when(SUBTYPE)
         call dosub(argstk, i, j)
      when(IFTYPE)
         call doif(argstk, i, j)
      when(INCLTYPE)
         call doinclude (argstk, i, j)
      when(DIVTYPE)
         call dodivert (argstk, i, j)
      when(DNLTYPE)
         call dodnl
      when(UNDEFTYPE)
         call doundef (argstk, i, j)
   else {
      for (k = t + length (evalst (t)) - 1; k > t; k -= 1)
         if (evalst(k-1) ~= ARGFLAG)
            call putbak(evalst(k))
         elif (evalst(k) == ARGFLAG) {
            call putbak (ARGFLAG)
            k -= 1      # convert $$ to single $
            }
         else {
            argno = index("0123456789"s, evalst(k)) - 1
            if (argno >= 0 && argno < j-i) {
               n = i + argno + 1
               m = argstk(n)
               call pbstr(evalst(m))
               }
            k -= 1      # skip over $
            }

      if (k == t)         # do last character
         call putbak(evalst(k))
      }

   return
   end



# dodef - install definition in table

   subroutine dodef(argstk, i, j)
   integer argstk(ARGSIZE), i, j

   include "macro_com.r.i"

   integer a2, a3

   if (j - i > 2) {
      a2 = argstk(i+2)
      a3 = argstk(i+3)
      call instal(evalst(a2), evalst(a3))   # subarrays
      }

   return
   end



# doincr - increment argument by 1

   subroutine doincr(argstk, i, j)
   integer argstk(ARGSIZE), i, j

   include "macro_com.r.i"

   integer k
   integer ctoi

   k = argstk(i+2)
   call pbnum(ctoi(evalst, k)+1)

   return
   end



# pbnum - convert number to string, push back on input

   subroutine pbnum(n)
   integer n

   integer m, num
   integer mod

   string digits "0123456789"

   num = n
   repeat {
      m = mod(num, 10)
      call putbak(digits(m+1))
      num = num / 10
      } until (num == 0)

   return
   end



# dosub - select substring

   subroutine dosub(argstk, i, j)
   integer argstk (ARGSIZE), i, j

   include "macro_com.r.i"

   integer ap, fc, k, nc
   integer ctoi, length, min0

   if (j - i < 3)
      return
   if (j - i < 4)
      nc = MAXTOK
   else {
      k = argstk(i+4)
      nc = ctoi(evalst, k)      # number of characters
      }

   k = argstk(i+3)         # origin
   ap = argstk(i+2)         # target string
   fc = ap + ctoi(evalst, k) - 1   # first char of substring
   if (fc >= ap && fc < ap + length(evalst(ap))) {   # subarrays
      k = fc + min0(nc, length(evalst(fc))) - 1
      for ( ; k >= fc; k -= 1)
         call putbak(evalst(k))
      }

   return
   end



# doif - select one of two arguments

   subroutine doif(argstk, i, j)
   integer argstk (ARGSIZE), i, j

   include "macro_com.r.i"

   integer a2, a3, a4, a5
   integer equal

   if (j - i < 5)
      return
   a2 = argstk(i+2)
   a3 = argstk(i+3)
   a4 = argstk(i+4)
   a5 = argstk(i+5)
   if (equal(evalst(a2), evalst(a3)) == YES)   # subarrays
      call pbstr(evalst(a4))
   else
      call pbstr(evalst(a5))

   return
   end



# ngetc - get a (possibly pushed back) character

   character function ngetc(c)
   character c

   include "macro_com.r.i"

   character getch

   if (bp > 0)
      c = buf(bp)
   else {
      bp = 1
      repeat {
         buf (bp) = getch (c, ifst (ifp))
         if (ifp == 1 || c ~= EOF)
            break
         call close (ifst (ifp))
         ifp -= 1
         }
      }
   if (c ~= EOF)
      bp -= 1

   ngetc = c
   return
   end



# pbstr - push string back onto input

   subroutine pbstr(in)
   character in(MAXLINE)

   integer i
   integer length

   for (i = length(in); i > 0; i -= 1)
      call putbak(in(i))

   return
   end



# putbak - push character back onto input

   subroutine putbak(c)
   character c

   include "macro_com.r.i"

   bp += 1
   if (bp > BUFSIZE)
      call error("too many characters pushed back"p)
   buf(bp) = c

   return
   end



# doinclude --- open new input file, stack descriptor

   subroutine doinclude (argstk, i, j)
   integer i, j, argstk (ARGSIZE)

   include "macro_com.r.i"

   integer fd, nm
   integer open

   if (j - i < 2)
      return            # need at least one argument
   nm = argstk (i + 2)  #   namely, the filename to include
   fd = open (evalst (nm), READ)
   if (fd == ERR) {
      call putlin (evalst (nm), ERROUT)
      call remark (": can't open include"p)
      }
   else {
      ifp += 1
      ifst (ifp) = fd
      }

   return
   end



# dodivert --- open new output file, stack descriptor

   subroutine dodivert (argstk, i, j)
   integer i, j, argstk (ARGSIZE)

   include "macro_com.r.i"

   integer fd, nm
   integer open, create

   nm = argstk (i + 2)

   if (evalst (nm) == EOS) {  # reset to last output file
      if (ofp > 1) {
         call close (ofst (ofp))
         ofp -= 1
         }
      return
      }

   if (ofp >= MAXOFILES) {
      call putlin (evalst (nm), ERROUT)
      call remark (": too many output files"p)
      return
      }

   if (j - i == 2)
      fd = create (evalst (nm), READWRITE)
   else
      fd = open (evalst (nm), READWRITE)

   if (fd == ERR) {
      call putlin (evalst (nm), ERROUT)
      call remark (": can't open for output"p)
      }
   else {
      call wind (fd)
      ofp += 1
      ofst (ofp) = fd
      }

   return
   end



# dodnl --- delete blanks and tabs up to a newline, and the newline

   subroutine dodnl

   character c
   character ngetc

   repeat {
      c = ngetc (c)
      } until (c ~= ' 'c && c ~= TAB)

   if (c ~= NEWLINE)
      call putbak (c)

   return
   end



# uninstal --- remove name and its associated definition from table

   subroutine uninstal (name)
   character name (MAXTOK)

   integer table (MAXTBL)
   common /ds$mem/ table            # for memory manager

   include "macro_com.r.i"

   integer i, j, k
   integer equal

   for (i = lastp; i > 0; i -= 1) {
      j = namptr (i)
      if (equal (table (j), name) == YES) {
         call dsfree (namptr (i))
         for (k = i + 1; k <= lastp; k += 1)
            namptr (k - 1) = namptr (k)
         lastp -= 1
         return
         }
      }

   return
   end



# doundef --- remove definition from table

   subroutine doundef (argstk, i, j)
   integer i, j, argstk (ARGSIZE)

   include "macro_com.r.i"

   integer nam

   nam = argstk (i + 2)
   call uninstal (evalst (nam))

   return
   end
