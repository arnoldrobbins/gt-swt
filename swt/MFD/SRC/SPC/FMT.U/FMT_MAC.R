# apndmac --- append to a macro

   subroutine apndmac (buf)
   character buf (ARB)

   include FMT_COMMON

   character macnam (3)
   integer strtmac, i, macloc
   integer findmac

   ### find macro

   call getnam (buf, macnam)
   macloc = findmac (macnam)
   if (macloc == ERR) {
      call print (ERROUT,
         "macro (*s) cannot be appended, it does not exist*n"s, macnam)
      stop
      }

   if (First_macro == macloc) {  #macro need not be moved
      First_macro = Macbuf (macloc + FLINK)
      Mactop = macloc - 2
      strtmac = Macbuf (macloc + MACSTART)
      }
   else {  # the macro must be moved to obtain a contiguous area

      ### see if there is enough space to move the macro
      if ((MACBUFSIZE - Mactop) <
         ((macloc + 6) - Macbuf (macloc + MACSTART))) {
         call macgc    # collect garbage
         macloc = findmac (macnam)  # refind macro

         ### see if there is enough space to move the macro
         if ((MACBUFSIZE - Mactop) <
            ((macloc + 6) - Macbuf (macloc + MACSTART)))
            call error ("not enough space to append to macro"s)
         }
      ### move macro
      strtmac = Mactop
      for (i = Macbuf (macloc + MACSTART); i <= macloc - 3;
         {i += 1; Mactop += 1})
         Macbuf (Mactop) = Macbuf (i)
      call macrel (macloc)
      }

   ### read in the appending information
   call macinp (macnam, strtmac)

   return
   end



# defmac --- define a macro

   subroutine defmac (buf)
   character buf (ARB)

   include FMT_COMMON

   character macnam (3)
   integer strtmac, macloc
   integer findmac

   call getnam (buf, macnam)
   strtmac = Mactop
   macloc = findmac (macnam)
   if (macloc ~= ERR) call macrel (macloc)
   call macinp (macnam, strtmac)

   return
   end



# domac --- invoke a macro specified by buf

   integer function domac (buf)
   character buf (ARB)

   include FMT_COMMON

   integer i

   domac = OK
   for (i = First_macro; i ~= ENDOFLIST; i = Macbuf (i + FLINK))
      if (Macbuf (i) == buf (2) && Macbuf (i + 1) == buf (3)) {
         F_ptr += 1
         if (F_ptr > MAXFILES) {
            call reset_files
            call putlin (buf, ERROUT)
            call error ("Too many macros/input files.")
            }
         F_list (F_ptr) = Macbuf (i + MACSTART)
         F_type (F_ptr) = MACRO
         call emargs (buf)    # enter macro arguments into argbuf
         return
         }

   domac = ERR

   return
   end



# emargs --- enter macro arguments in argbuf

   subroutine emargs (buf)
   character buf (ARB)

   include FMT_COMMON

   integer i, j, k
   character args (MAXLINE)

   j = 1
   i = 2
   repeat {
      SKIPBL (buf, i)
      if (buf (i) == NEWLINE || buf (i) == EOS)
         break
      repeat {
         while (buf (i) == '"'c) {
            for (i += 1; buf (i) ~= '"'c; i += 1) {
               if (buf (i) == NEWLINE || buf (i) == EOS) {
                  call reset_files
                  call putlin (buf, ERROUT)
                  call error ("missing quote"s)
                  }
               args (j) = buf (i)
               j += 1
               }
            i += 1
            if (buf (i) == '"'c) {
               args (j) = '"'c
               j += 1
               }
            }
         for ( ; buf (i) ~= ' 'c && buf (i) ~= TAB && buf (i) ~= '"'c
               && buf (i) ~= NEWLINE && buf (i) ~= EOS; i += 1) {
            args (j) = buf (i)
            j += 1
            }
         } until (buf (i) ~= '"'c)
      args (j) = EOS
      j += 1
      }

   if (Argtop + j > ARGBUFSIZE) {
      call reset_files
      call putlin (buf, ERROUT)
      call error ("Too many macro arguments"s)
      }

   Maclvl += 1
   if (Maclvl > MAXMACLVL) {
      call reset_files
      call putlin (buf, ERROUT)
      call error ("Too many nested macro calls"s)
      }
   Argv (Maclvl) = Argtop
   for (k = 1; k < j; k += 1) {
      Argbuf (Argtop) = args (k)
      Argtop += 1
      }

   return
   end



# endmac --- close out an invocation of a macro

   subroutine endmac

   include FMT_COMMON

   Argtop = Argv (Maclvl)
   Maclvl -= 1

   return
   end



# eval_fcn --- evaluate a function call

   integer function eval_fcn (fbuf, buf, maxbuf)
   character fbuf (ARB), buf (maxbuf)
   integer maxbuf

   include FMT_COMMON

   character name (MAXLINE), str (MAXOUT), fcn_buf (MAXOUT)
   character mapup, tempstr (MAXOUT)
   character str1 (MAXLINE), str2 (MAXLINE), rel (4)
   integer i, j, k, nr, amount, fnum, val, opnd1, opnd2, r, v, s1, s2
   integer itoc, ctoi, gctoi, lookup, ctoc, itorom, trnarg, index
   integer strlsr, strcmp
   string_table relx, relt,
      / 1, 2, "<=",
      / 1, 2, "=<",
      / 1, 0, "<",
      / 2, 0, "==",
      / 2, 0, "=",
      / 1, 3, "~=",
      / 1, 3, "<>",
      / 1, 3, "><",
      / 2, 3, ">=",
      / 2, 3, "=>",
      / 3, 0, ">"

   integer underl, boface, itolet, italic
   character vert (16)
   data vert/8r020,8r021,8r022,8r023,8r024,8r025,8r026,8r027,8r030,
      8r031,8r032,8r033,8r034,8r035,8r036,8r037/

   call massin (fbuf, fcn_buf, MAXOUT)    # evaluate nested calls
   i = 1
   SKIPBL (fcn_buf, i)
   for (j = 1; fcn_buf (i) ~= EOS && fcn_buf (i) ~= ' 'c;
         {j += 1; i += 1})
      name (j) = fcn_buf (i)

   name (j) = EOS

   j = 1                   # check for macro argument call: [<integer>]
   nr = ctoi (name, j)
   if (name (j) == EOS && Maclvl > 1)
      return (trnarg (nr, buf, maxbuf))

   SKIPBL (fcn_buf, i)
   if (lookup (name, fnum, Fn_table) == NO) {   # not a function name
      if (lookup (name, fnum, Spchar_table) == YES) { # special character
         j = ctoi (fcn_buf, i)   # get repeat count, if any
         j = min0 (max0 (1, j), maxbuf - 1)  # apply limits
         do k = 1, j
            buf (k) = fnum
         buf (j + 1) = EOS
         return (j)
         }
      else {   # neither a function name nor a special character
         buf (1) = '['c
         j = ctoc (fcn_buf, buf (2), maxbuf - 2) + 2
         buf (j) = ']'c
         buf (j + 1) = EOS
         return (j)
         }
      }
   else  # it's a function name
      select (fnum)     # these functions yield a numeric result
         when (ns_FN)
            val = Nospace
         when (pl_FN)
            val = Plval
         when (pn_FN, tcpn_FN)
            val = Curpag
         when (ln_FN)
            val = Lineno
         when (po_FN)
            val = Poval
         when (ls_FN)
            val = Lsval
         when (in_FN)
            val = Inval
         when (rm_FN)
            val = Rmval
         when (ti_FN)
            val = Tival
         when (lm_FN)
            val = Lmval
         when (ml_FN)
            val = Maclvl
         when (m1_FN)
            val = M1val
         when (m2_FN)
            val = M2val
         when (m3_FN)
            val = M3val
         when (m4_FN)
            val = M4val
         when (lt_FN)
            val = Tiwidth
         when (plus_FN) {
            opnd1 = gctoi (fcn_buf, i, 10)
            opnd2 = gctoi (fcn_buf, i, 10)
            val = opnd1 + opnd2
            }
         when (minus_FN) {
            opnd1 = gctoi (fcn_buf, i, 10)
            opnd2 = gctoi (fcn_buf, i, 10)
            val = opnd1 - opnd2
            }
         when (bottom_FN)
            val = Bottom
         when (top_FN)
            val = M1val + M2val + 1
         when (num_FN) {
            select (fcn_buf (i))
               when ('+'c)
                  amount = +1
               when ('-'c)
                  amount = -1
               ifany
                  i += 1
            else
               amount = 0
            nr = ctoi (fcn_buf, i)
            if (nr >= 1 && nr <= MAXNUMREGS) {
               Numreg (nr) += amount         # pre-incr or -decr
               val = Numreg (nr)
               select (fcn_buf (i))
                  when ('+'c)
                     Numreg (nr) += 1
                  when ('-'c)
                     Numreg (nr) -= 1
               }
            else        # register number out of range, use 0
               val = 0
            }
         ifany {
            k = itoc (val, str, 32)
            if (k < 4 && fnum == tcpn_FN)    # right justify tcpn
               for (j = 5; j > 0; {j -= 1; k -= 1})
                  if (k >= 0)
                     str (j) = str (k + 1)
                  else
                     str (j) = PHANTOMBL
            eval_fcn = ctoc (str, buf, maxbuf)
            }
      else select (fnum)   # these functions yield a character result
         when (cc_FN)
            str (1) = Cmdch
         when (c2_FN)
            str (1) = Nbcch
         when (tc_FN)
            str (1) = Tabch
         when (even_FN) {
            val = ctoi (fcn_buf, i)
            if (and (val, 1) == 0)  # even number
               str (1) = '1'c
            else   # odd number
               str (1) = '0'c
            }
         when (odd_FN) {
            val = ctoi (fcn_buf, i)
            if (and (val, 1) == 0)  # even number
               str (1) = '0'c
            else   # odd number
               str (1) = '1'c
            }
         when (cmp_FN) {
            for (j = 1; fcn_buf (i) ~= ' 'c; {i += 1; j += 1})
               str1 (j) = fcn_buf (i)
            str1 (j) = EOS
            SKIPBL (fcn_buf, i)
            for (j = 1; fcn_buf (i) ~= ' 'c; {i += 1; j += 1})
               rel (j) = fcn_buf (i)
            rel (j) = EOS
            SKIPBL (fcn_buf, i)
            for (j = 1; fcn_buf (i) ~= ' 'c && fcn_buf (i) ~= EOS; {i += 1; j += 1})
               str2 (j) = fcn_buf (i)
            str2 (j) = EOS
            r = strlsr (relx, relt, 2, rel)
            if (r == EOF)
               call error ("cmp: bad relational operator.")
            v = strcmp (str1, str2)
            if (relt (relx (r)) == v || relt (relx (r) + 1) == v)
               str (1) = '1'c # true
            else
               str (1) = '0'c # false
            }
         when (icmp_FN) {
            s1 = gctoi (fcn_buf, i, 10)
            SKIPBL (fcn_buf, i)
            for (j = 1; fcn_buf (i) ~= ' 'c; {i += 1; j += 1})
               rel (j) = fcn_buf (i)
            rel (j) = EOS
            s2 = gctoi (fcn_buf, i, 10)
            r = strlsr (relx, relt, 2, rel)
            if (r == EOF)
               call error ("icmp: bad relational operator.")
            select (r - 1)
               when (1, 2)
                  if (s1 <= s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
               when (3)
                  if (s1 < s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
               when (4, 5)
                  if (s1 == s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
               when (6, 7, 8)
                  if (s1 ~= s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
               when (9, 10)
                  if (s1 >= s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
               when (11)
                  if (s1 > s2)
                     str (1) = '1'c
                  else
                     str (1) = '0'c
            }
         ifany {
            str (2) = EOS
            eval_fcn = ctoc (str, buf, maxbuf)
            }
      else select (fnum)   # these functions yield a string result
         when (day_FN) {
            call date (5, str)
            str (1) = mapup (str (1))
            }
         when (date_FN)
            call date (1, str)
         when (time_FN)
            call date (2, str)
         when (ldate_FN) {
            call date (7, str)
            call sdrop (str, str, index (str, ' 'c))
            }
         when (rn_FN, RN_FN) {
            val = ctoi (fcn_buf, i)
            call itorom (val, str, 32)
            if (fnum == RN_FN)
               call mapstr (str, UPPER)
            }
         when (letter_FN, LETTER_FN) {
            val = ctoi (fcn_buf, i)
            call itolet (val, str)
            if (fnum == LETTER_FN)
               call mapstr (str, UPPER)
            }
         when (vertspace_FN) {
            val = ctoi (fcn_buf, i)
            if (val < 1 || val > 16)
               call error ("fmt error:  illegal verticle spacing"s)
            str (1) = vert (val)
            str (2) = EOS
            }
         when (even_FN) {
            val = ctoi (fcn_buf, i)
            if (and (val, 1) == 0)  # even number
               str (1) = '1'c
            else   # odd number
               str (1) = '0'c
            str (2) = EOS
            }
         when (odd_FN) {
            val = ctoi (fcn_buf, i)
            if (and (val, 1) == 0)  # even number
               str (1) = '0'c
            else   # odd number
               str (1) = '1'c
            str (2) = EOS
            }
         when (header_FN) {
            if (and (Curpag, 1) == 0)  # this is an even-numbered page
               call massin (Even_header, tempstr, MAXOUT)
            else
               call massin (Odd_header, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         when (evenheader_FN) {
            call massin (Even_header, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         when (oddheader_FN) {
            call massin (Odd_header, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         when (footer_FN) {
            if (and (Curpag, 1) == 0)  # this is an even-numbered page
               call massin (Even_footer, tempstr, MAXOUT)
            else
               call massin (Odd_footer, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         when (evenfooter_FN) {
            call massin (Even_footer, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         when (oddfooter_FN) {
            call massin (Odd_footer, tempstr, MAXOUT)
            call mktl (tempstr, Curpag, str, MAXOUT)
            }
         ifany
            eval_fcn = ctoc (str, buf, maxbuf)
      else select (fnum)
         when (bf_FN)
            eval_fcn = boface (fcn_buf (i), buf, maxbuf)
         when (it_FN)
            eval_fcn = italic (fcn_buf (i), buf, maxbuf)
         when (ul_FN)
            eval_fcn = underl (fcn_buf (i), buf, maxbuf, NO)
         when (cu_FN)
            eval_fcn = underl (fcn_buf (i), buf, maxbuf, YES)
         when (sub_FN) {
            buf (1) = hlf
            eval_fcn = ctoc (fcn_buf (i), buf (2), maxbuf - 2) + 2
            buf (eval_fcn) = hlr
            buf (eval_fcn + 1) = EOS
            }
         when (sup_FN) {
            buf (1) = hlr
            eval_fcn = ctoc (fcn_buf (i), buf (2), maxbuf - 2) + 2
            buf (eval_fcn) = hlf
            buf (eval_fcn + 1) = EOS
            }
         when (cap_FN) {
            call mapstr (fcn_buf (i), UPPER)
            eval_fcn = ctoc (fcn_buf (i), buf, maxbuf)
            }
         when (small_FN) {
            call mapstr (fcn_buf (i), LOWER)
            eval_fcn = ctoc (fcn_buf (i), buf, maxbuf)
            }
      else select (fnum)   # these functions yield no result
         when (set_FN, add_FN) {
            nr = ctoi (fcn_buf, i)
            val = gctoi (fcn_buf, i, 10)
            if (1 <= nr && nr <= MAXNUMREGS)
               if (fnum == set_FN)
                  Numreg (nr) = val
               else
                  Numreg (nr) += val
            }
         ifany {
            buf (1) = EOS
            eval_fcn = 0
            }
      else {
         buf (1) = EOS
         eval_fcn = 0
         call remark ("in eval_fcn: can't happen"s)
         }

   return
   end



# extract_fcn --- isolate the text between balanced square brackets

   integer function extract_fcn (buf, index, fcn_buf, size)
   integer index, size
   character buf (ARB), fcn_buf (size)

   integer i, j, level

   j = 1
   level = 1
   for (i = index + 1; buf (i) ~= EOS && buf (i) ~= NEWLINE; i += 1) {
      select (buf (i))
         when ('@'c)
            if (buf (i + 1) ~= EOS && buf (i + 1) ~= NEWLINE)
               i += 1
         when ('['c)
            level += 1
         when (']'c) {
            level -= 1
            if (level <= 0)
               break
            }
      if (j < size) {
         fcn_buf (j) = buf (i)
         j += 1
         }
      else
         break
      }

   fcn_buf (j) = EOS
   if (level == 0) {
      index = i
      extract_fcn = OK
      }
   else
      extract_fcn = ERR

   return
   end



# findmac --- locate the start of a macro in Macbuf

   integer function findmac (macnam)
   character macnam (3)

   include FMT_COMMON

   integer i

   findmac = ERR
   for (i = First_macro; i ~= ENDOFLIST; i = Macbuf (i + FLINK))
      if (Macbuf (i) == macnam (1) && Macbuf (i + 1) == macnam (2)) {
         findmac = i
         break
         }

   return
   end



# getnam --- get macro name after command (.de or .en)

   subroutine getnam (buf, name)
   character buf (ARB), name (3)

   integer i, j

   i = 1
   SKIPCM (buf, i)
   for (j = 1; j <= 2 && buf (i) ~= ' 'c && buf (i) ~= TAB
         && buf (i) ~= NEWLINE; j += 1) {
      name (j) = buf (i)
      i += 1
      }
   for (; j <= 2; j += 1)
      name (j) = ' 'c
   name (3) = EOS                # insure name is blank padded to two chars

   return
   end



# itolet --- convert a number between 1 and 26 to its letter equivalent

   subroutine itolet (num, let)
   integer num
   character let (ARB)

   if (num < 1 || num > 26)
      let (1) = '?'c
   else
      let (1) = 'a'c + num - 1
   let (2) = EOS

   return
   end



# itorom --- convert integer to roman numerals

   integer function itorom (val, str, size)
   integer val, size
   character str (size)

   integer int, out

   define (putchar(ch),{if(out<size){str(out)='ch'c;out+=1}})

   out = 1
   int = iabs (val)
   if (val < 0)
      putchar (-)

   while (int >= 1000) {
      putchar (m)
      int -= 1000
      }
   if (int >= 900) {
      putchar (c)
      putchar (m)
      int -= 900
      }
   elif (int >= 500) {
      putchar (d)
      int -= 500
      }

   if (int >= 400) {
      putchar (c)
      putchar (d)
      int -= 400
      }
   else
      while (int >= 100) {
         putchar (c)
         int -= 100
         }
   if (int >= 90) {
      putchar (x)
      putchar (c)
      int -= 90
      }
   elif (int >= 50) {
      putchar (l)
      int -= 50
      }

   if (int >= 40) {
      putchar (x)
      putchar (l)
      int -= 40
      }
   else
      while (int >= 10) {
         putchar (x)
         int -= 10
         }
   if (int >= 9) {
      putchar (i)
      putchar (x)
      int -= 9
      }
   elif (int >= 5) {
      putchar (v)
      int -= 5
      }

   if (int >= 4) {
      putchar (i)
      putchar (v)
      int -= 4
      }
   else
      while (int >= 1) {
         putchar (i)
         int -= 1
         }

   str (out) = EOS

   return (out - 1)

   end



# macinp --- read in the body of a macro

   subroutine macinp (macnam, strtmac)
   character macnam (3)
   integer strtmac

   include FMT_COMMON

   character ennam (3), line (MAXOUT)
   integer len
   integer readln, scopy

   repeat {
      len = readln (line, MAXOUT)
      if (len == EOF) {
         call reset_files
         call putlin (macnam, ERROUT)
         call error (": missing end of definition"s)
         }
      if ((line (1) == Cmdch || line (1) == Nbcch) &&
         line (2) == 'e'c && line (3) == 'n'c) {
         call getnam (line, ennam)
         if (macnam (1) == ennam (1) && macnam (2) == ennam (2))
            break
         }
      if (Mactop + len > MACBUFSIZE)
         call macgc    # collect garbage
      Mactop += scopy (line, 1, Macbuf, Mactop) + 1
      }

   if (Mactop + 8 > MACBUFSIZE)
      call macgc    # collect garbage
   Macbuf (Mactop) = EOF
   Macbuf (Mactop + 1) = EOS
   Macbuf (Mactop + 2) = macnam (1)
   Macbuf (Mactop + 3) = macnam (2)
   Macbuf (Mactop + 4) = EOS
   Macbuf (Mactop + 5) = First_macro
   Macbuf (Mactop + 6) = ENDOFLIST
   Macbuf (Mactop + 7) = strtmac
   if (Macbuf (Mactop + 2 + FLINK) ~= ENDOFLIST)
      Macbuf (Macbuf (Mactop + 2 + FLINK) + BLINK) = Mactop + 2
   First_macro = Mactop + 2
   Mactop += 8

   return
   end



# macgc --- garbage collection and compaction of macro space

   subroutine macgc

   include FMT_COMMON

   integer sgarb, egarb, smac, emac, i, j, k

   ### find first garbage area
   for (sgarb = 1; sgarb <= MACBUFSIZE &&
      Macbuf (sgarb) ~= MACRELEASEMARK; sgarb += 1) ;
   if (sgarb == MACBUFSIZE)
      call error ("space for macros exhausted"s)
   for (egarb = sgarb + 1; Macbuf (egarb) ~= MACRELEASEMARK;
      egarb += 1) ;

   ### compact
   smac = egarb + 1
   repeat {

      ### find macro
      for (emac = smac; emac <= MACBUFSIZE &&
         Macbuf (emac) ~= EOF; emac += 1) ;
      if (Macbuf (emac) == EOF)
         emac += 7
      else
         emac = Mactop - 1

      ### move macro
      for ({i = sgarb; j = smac}; j <= emac; {i += 1; j += 1})
         Macbuf (i) = Macbuf (j)

      ### relink
      k = sgarb
      sgarb = i
      if (emac < MACBUFSIZE && Macbuf (emac + 1) == MACRELEASEMARK)
         for (egarb = emac + 2; Macbuf (egarb) ~= MACRELEASEMARK;
            egarb += 1) ;
      else
         egarb = emac
      if (emac == Mactop - 1 && First_macro ~= emac - 5)
         next     # this is the last but incomplete macro
      j -= 5   # let j point to macro name of macro just moved
      if (emac ~= Mactop - 1)
         First_macro = j   # this is not the last macro so keep going
      Macbuf (j + MACSTART) = k
      if (Macbuf (j + FLINK) ~= ENDOFLIST)
         Macbuf (Macbuf (j + FLINK) + BLINK) = j
      if (Macbuf (j + BLINK) ~= ENDOFLIST)
         Macbuf (Macbuf (j + BLINK) + FLINK) = j
      smac = j
      }

   until (emac == Mactop - 1)

   if (Mactop + 10 > MACBUFSIZE)
      call error ("macro area exceeded"s)
   Mactop = sgarb

   return
   end



# macrel --- release storage used by a macro

   subroutine macrel (macloc)
   integer macloc

   include FMT_COMMON

   integer i, prv, nxt

   ### relink macros around free space
   nxt = Macbuf (macloc + FLINK)
   prv = Macbuf (macloc + BLINK)
   if (nxt ~= ENDOFLIST)
      Macbuf (nxt + BLINK) = prv
   if (prv ~= ENDOFLIST)
      Macbuf (prv + FLINK) = nxt

   ### clear area and combine adjacent free areas
   i = Macbuf (macloc + MACSTART)
   if (i ~= 1 && Macbuf (i - 1) == MACRELEASEMARK)
      Macbuf (i - 1) = ' 'c  # clear mark to combine adjacent areas
   else   # no adjacent area on top
      Macbuf (i) = MACRELEASEMARK
   i = macloc + 6
   if (i < MACBUFSIZE && Macbuf (i) == MACRELEASEMARK)
      Macbuf (i) = ' 'c  # clear mark to combine adjacent areas
   else  # no adjacent area on bottom
      Macbuf (macloc + 5) = MACRELEASEMARK

   return
   end



# massin --- massage a line of input; evaluate functions, etc.

   integer function massin (buf, obuf, size)
   integer size
   character buf (ARB), obuf (size)

   integer i, j
   integer extract_fcn, eval_fcn
   character fcn_buf (MAXLINE)

   j = 1
   for (i = 1; buf (i) ~= EOS; i += 1)
      if (buf (i) == '['c && extract_fcn (buf, i, fcn_buf, MAXLINE) == OK)
         j += eval_fcn (fcn_buf, obuf (j), size - j + 1)
      else {
         if (buf (i) == ESCAPE
               && (buf (i + 1) == ESCAPE || buf (i + 1) == '['c))
            i += 1
         if (j < size) {
            obuf (j) = buf (i)
            j += 1
            }
         }

   obuf (j) = EOS

   return (j - 1)

   end



# rdmac --- transfer line from a macro definition to a buffer

   integer function rdmac (buf, i, size)
   integer i, size
   character buf (size)

   include FMT_COMMON

   integer ctoc

   rdmac = ctoc (Macbuf (i), buf, size)
   i += rdmac + 1
   if (buf (1) == EOF)
      rdmac = EOF

   return
   end



# trnarg --- transfer macro argument to buf

   integer function trnarg (argno, buf, maxbuf)
   integer argno, maxbuf
   character buf (ARB)

   include FMT_COMMON

   integer j, k
   integer ctoc

   trnarg = 0
   if (argno >= 0) {
      for ({j = argno; k = Argv (Maclvl)}; k < Argtop && j > 0; j -= 1) {
         while (Argbuf (k) ~= EOS)
            k += 1
         k += 1
         }
      if (k < Argtop)
         trnarg = ctoc (Argbuf (k), buf, maxbuf)
      }

   return
   end
