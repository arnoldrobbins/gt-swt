# parse --- convert the argument string into RPN

   integer function parse (rd, pos2, arg, rpn, cbuf)
   relation_des rd (RDSIZE)
   integer pos2
   character arg (ARB)
   integer rpn (RPNSIZE), cbuf (RDATASIZE)

   define (DB,#)
   define (SYNERR (m), call psyner (m s, YES))

   include "rdb_com.r.i"

   call mklb$f ($1, Errlab)      # set up for syntax error return

   call move$ (rd, Rd, RDLEN (rd))
   Pos2 = pos2
   call ctoc (arg, Arg, MAXARG)

   Ap = 1
   Rpnlen = 1
   Cbuflen = 1

   call getsym

   call expr

   if (Arg (Ap) ~= EOS)
      SYNERR ("Invalid expression")

   call push (EOS)
   call move$ (Rpn, rpn, Rpnlen)
   call move$ (Cbuf, cbuf, Cbuflen)

   return (OK)

1  return (ERR)

   end



# expr --- parse production <expr> ::= <term> { | <term> }

   subroutine expr

   include "rdb_com.r.i"

   call term
   while (Symtype == '|'c) {
      call getsym
      call term
      call push ('|'c)
      }

   return
   end



# term --- parse production <term> ::= <factor> { & <factor> }

   subroutine term

   include "rdb_com.r.i"

   call factor
   while (Symtype == '&'c) {
      call getsym
      call factor
      call push ('&'c)
      }

   return
   end



# factor --- parse production <factor> ::= ~ <factor> | <primary>

   subroutine factor

   include "rdb_com.r.i"

   if (Symtype == '~'c) {
      call getsym
      call factor
      call push ('~'c)
      }
   else
      call primary

   return
   end



# primary --- parse production <primary> ::= ( <expr> ) | <field> <rel> <val>

   subroutine primary

   include "rdb_com.r.i"

   integer ft1, ft2, p1, p2, op, type1, type2
   integer get_qual_field, convert
   character s1 (MAXLINE), s2 (MAXLINE)

   if (Symtype == '('c) {
      call getsym
      call expr
      if (Symtype ~= ')'c)
         SYNERR ("unbalanced parentheses")
      call getsym
      }
   else {
      call field (ft1, s1)
      if (Symtype ~= '<'c && Symtype ~= '>'c && Symtype ~= GESYM
        && Symtype ~= LESYM && Symtype ~= NESYM && Symtype ~= '='c)
         SYNERR ("missing relational operator")
      op = Symtype
      call getsym
      call field (ft2, s2)

      type1 = STRING_TYPE
      type2 = STRING_TYPE
      select (ft1)
         when (IDSYM) {
            p1 = get_qual_field (s1)
            type1 = RFTYPE (Rd, p1)
            select (ft2)
               when (IDSYM) {
                  p2 = get_qual_field (s2)
                  type2 = RFTYPE (Rd, p2)
                  }
               when (NUSYM) {
                  p2 = convert (s2, type1)
                  type2 = type1
                  }
               when (QTSYM) {
                  type2 = STRING_TYPE
                  p2 = convert (s2, STRING_TYPE)
                  }
            }
         when (NUSYM) {
            select (ft2)
               when (IDSYM) {
                  p2 = get_qual_field (s2)
                  type2 = RFTYPE (Rd, p2)
                  type1 = RFTYPE (Rd, p2)
                  p1 = convert (s1, type1)
                  }
               when (NUSYM, QTSYM)
                  SYNERR ("Comparing two literals is bogus!")
            }
         when (QTSYM) {
            type1 = STRING_TYPE
            p1 = convert (s1, STRING_TYPE)
            select (ft2)
               when (IDSYM) {
                  p2 = get_qual_field (s2)
                  type2 = RFTYPE (Rd, p2)
                  }
               when (NUSYM, QTSYM)
                  SYNERR ("Comparing two literals is bogus!")
            }

DB    call print (ERROUT, "in primary: f=*i *i p=*i *i t=*i *i*n"s,
DB                         ft1, ft2, p1, p2, type1, type2)

      if (type1 ~= type2)
         SYNERR ("types to be compared are not compatible")

      call push (op)
      call push (ft1)
      call push (p1)
      call push (ft2)
      call push (p2)
      }

   return
   end



# field --- parse a single field in a selection expresion

   subroutine field (ft, s)
   character ft
   character s (MAXLINE)

   include "rdb_com.r.i"

   if (Symtype ~= IDSYM && Symtype ~= NUSYM && Symtype ~= QTSYM)
      SYNERR ("expected domain name or literal")

   ft = Symtype
   call ctoc (Symtext, s, MAXLINE)

   call getsym

   return
   end



# get_qual_field --- get a qualified field name; print error if not found

   integer function get_qual_field (name)
   character name (ARB)

   include "rdb_com.r.i"

   integer i
   integer find_qual_field

   i = find_qual_field (Rd, name, Pos2)
   if (i == 0) {
      call print (ERROUT, "*s"p, name)
      call psyner (": domain not found or ambiguous"s, NO)
      }

   return (i)
   end



# find_qual_field --- find a qualified data base index into Rd

   integer function find_qual_field (rd, name, pos2)
   relation_des rd (RDSIZE)
   character name (ARB)
   integer pos2

   integer p, i
   integer equal
   character rname (RFNAMESIZE)

   for (i = 1; name (i) ~= EOS && name (i) ~= '.'c && i < RFNAMESIZE; i += 1)
      rname (i) = name (i)
   rname (i) = EOS

DB call print (ERROUT, "in fqf: n=*s r=*s i=*i p=*i*n"s, name, rname, i, pos2)
   p = 0

   if (name (i) == EOS || pos2 == 0) {           # unqualified name
      for (i = FIRSTRF (rd); ISLASTRF (rd, i); i = NEXTRF (rd, i))
         if (equal (rname, RFNAME (rd, i)) == YES)
            if (p == 0)
               p = i
            else {
               p = 0
               break
               }
      }
   else if (equal (name (i), ".1"s) == YES) {   # in first half
      for (i = FIRSTRF (rd); i ~= pos2; i = NEXTRF (rd, i))
         if (equal (rname, RFNAME (rd, i)) == YES) {
            p = i
            break
            }
      }
   else if (equal (name (i), ".2"s) == YES) {   # in second half
      for (i = pos2; ISLASTRF (rd, i); i = NEXTRF (rd, i))
         if (equal (rname, RFNAME (rd, i)) == YES) {
            p = i
            break
            }
      }

   return (p)
   end



# convert --- convert string in dynamic storage to internal representation

   integer function convert (s, type)
   character s (ARB)
   integer type, p

   include "rdb_com.r.i"

   integer i, p
   integer length
   longint l
   longint gctol
   longreal d
   longreal ctod

   p = Cbuflen

   select (type)
      when (INTEGER_TYPE) {
         Cbuflen += 2
         if (Cbuflen > RDATASIZE)
            SYNERR ("Too many literals")
         i = 1
         l = gctol (s, i, 10)
         if (s (i) ~= EOS) {
            call print (ERROUT, "*s"s, s)
            call psyner ("Invalid integer constant"s, NO)
            }
         call move$ (l, Cbuf (p), 2)
         }
      when (REAL_TYPE) {
         Cbuflen += 4
         if (Cbuflen > RDATASIZE)
            SYNERR ("Too many literals")
         i = 1
         d = ctod (s, i)
         if (s (i) ~= EOS) {
            call print (ERROUT, "*s"s, s)
            call psyner ("Invalid real constant"s, NO)
            }
         call move$ (d, Cbuf (p), 4)
         }
      when (STRING_TYPE) {
         i = length (s) + 1      # + EOS
         Cbuflen += i
         if (Cbuflen > RDATASIZE)
            SYNERR ("Too many literals")
         call move$ (s, Cbuf (p), i)
         }

   return (p)
   end



# getsym --- obtain a symbol for the parser

   subroutine getsym

   include "rdb_com.r.i"

   integer l
   character quote

   SKIPBL (Arg, Ap)

   l = 1
   select (Arg (Ap))
      when (SET_OF_LETTERS) {
         Symtext (l) = Arg (Ap)
         for ({Ap += 1; l += 1}; IS_LETTER (Arg (Ap)) || IS_DIGIT (Arg (Ap))
                     || Arg (Ap) == '_'c || Arg (Ap) == '.'c;
                     {Ap += 1; l += 1})
            Symtext (l) = Arg (Ap)
         Symtype = IDSYM
         }
      when ('-'c, SET_OF_DIGITS, '+'c) {
         Symtext (l) = Arg (Ap)
         for ({Ap += 1; l += 1}; IS_DIGIT (Arg (Ap)) || Arg (Ap) == '.'c
                     || Arg (Ap) == '+'c || Arg (Ap) == '-'c
                     || Arg (Ap) == 'e'c || Arg (Ap) == 'E'c
                     || Arg (Ap) == 'r'c || Arg (Ap) == 'R'c;
                        {Ap += 1; l += 1})
            Symtext (l) = Arg (Ap)
         Symtype = NUSYM
         }
      when ('"'c, "'"c) {
         quote = Arg (Ap)
         for ({Ap += 1; l = 1}; Arg (Ap) ~= EOS && Arg (Ap) ~= quote; _
              {Ap += 1; l += 1})
            Symtext (l) = Arg (Ap)
         Symtext (l) = EOS
         if (Arg (Ap) == EOS)
            SYNERR ("Missing quote")
         else
            Ap += 1
         Symtype = QTSYM
         }
      when ('('c, ')'c, '&'c, '|'c, '.'c) {
         Symtype = Arg (Ap)
         Symtext (1) = Arg (Ap)
         Ap += 1
         l += 1
         }
      when ('<'c) {
         Symtext (1) = '<'c
         Ap += 1
         l += 1
         select (Arg (Ap))
            when ('>'c)
               Symtype = NESYM
            when ('='c)
               Symtype = LESYM
         ifany {
            Symtext (2) = Arg (Ap)
            Ap += 1
            l += 1
            }
         else
            Symtype = '<'c
         }
      when ('>'c) {
         Symtext (1) = '>'c
         Ap += 1
         l += 1
         select (Arg (Ap))
            when ('<'c)
               Symtype = NESYM
            when ('='c)
               Symtype = GESYM
         ifany {
            Symtext (2) = Arg (Ap)
            Ap += 1
            l += 1
            }
         else
            Symtype = '>'c
         }
      when ('='c) {
         Symtext (1) = '='c
         Ap += 1
         l += 1
         select (Arg (Ap))
            when ('='c)
               Symtype = '='c
            when ('>'c)
               Symtype = GESYM
            when ('<'c)
               Symtype = LESYM
         ifany {
            Symtext (2) = Arg (Ap)
            Ap += 1
            l += 1
            }
         else
            Symtype = '='c
         }
      when ('~'c) {
         Symtext (1) = '~'c
         Ap += 1
         l += 1
         if (Arg (Ap) == '='c) {
            Symtype = NESYM
            Symtext (2) = '='c
            Ap += 1
            l += 1
            }
         else
            Symtype = '~'c
         }
      when (EOS)
         Symtype = EOS
   else
      SYNERR ("Illegal character")

   Symtext (l) = EOS

DB call print (ERROUT, "in getsym: *i (*i) '*s' Ap=*i*n"s,
DB                      Symtype, Symtype, Symtext, Ap)

   return
   end



# push --- push a word onto the RPN list

   subroutine push (w)
   integer w

   include "rdb_com.r.i"

   if (Rpnlen >= RPNSIZE)
      SYNERR ("Selection expression too complicated")
   else {
      Rpn (Rpnlen) = w
      Rpnlen += 1
      }

   return
   end



# psyner --- print a parser syntax error and return to Errlab

   subroutine psyner (m, c)
   character m (ARB)
   integer c

   include "rdb_com.r.i"

   if (c == YES)
      call print (ERROUT, "*s: *s*n*#x^*n"s, Arg, m, Ap - 2)
   else
      call print (ERROUT, "*s*n"s, m)

   call pl1$nl (Errlab)    # go back to 'parse'

   end



# eval --- evaluate a selection expression on a row

   integer function eval (rd, row, rpn, cbuf)
   relation_des rd (RDSIZE)
   integer row (ARB), rpn (ARB), cbuf (RDATASIZE)

   integer sp, rp, i1, i2, r
   integer buf1 (MAXLINE), buf2 (MAXLINE), stack (RPNSIZE)
   integer eval_rel
   pointer p1, p2

   sp = 0
   for (rp = 1; rpn (rp) ~= EOS; rp += 1)
      select (rpn (rp))
         when ('&'c) {
            if (stack (sp) == YES && stack (sp - 1) == YES)
               stack (sp - 1) = YES
            else
               stack (sp - 1) = NO
            sp -= 1
            }
         when ('|'c) {
            if (stack (sp) == YES || stack (sp - 1) == YES)
               stack (sp - 1) = YES
            else
               stack (sp - 1) = NO
            sp -= 1
            }
         when ('~'c) {
            if (stack (sp) == YES)
               stack (sp) = NO
            else
               stack (sp) = YES
            }

      else {
         i1 = rpn (rp + 1)
         p1 = rpn (rp + 2)
         i2 = rpn (rp + 3)
         p2 = rpn (rp + 4)
         if (i1 == IDSYM && i2 == IDSYM) {
            call get_data (rd, p1, row, buf1)
            call get_data (rd, p2, row, buf2)
            r = eval_rel (rpn (rp), RFTYPE (rd, p1), buf1, buf2)
            }
         else if (i1 == IDSYM) {
            call get_data (rd, p1, row, buf1)
            r = eval_rel (rpn (rp), RFTYPE (rd, p1), buf1, cbuf (p2))
            }
         else if (i2 == IDSYM) {
            call get_data (rd, p2, row, buf2)
            r = eval_rel (rpn (rp), RFTYPE (rd, p2), cbuf (p1), buf2)
            }
         else
            r = eval_rel (rpn (rp), 0, cbuf (p1), cbuf (p2))
         sp += 1
         stack (sp) = r
         rp += 4
         }

   if (sp ~= 1)
      call print (ERROUT, "in eval: stack messed up *i*n"s, sp)
   return (stack (1))
   end



# eval_rel --- evaluate a relational operator

   integer function eval_rel (op, type, buf1, buf2)
   integer op, type, buf1 (ARB), buf2 (ARB)
   integer r
   integer compare_field

   select (op)
      when ('<'c)
         if (compare_field (type, buf1, buf2) == 1)
            r = YES
         else
            r = NO
      when ('='c)
         if (compare_field (type, buf1, buf2) == 2)
            r = YES
         else
            r = NO
      when ('>'c)
         if (compare_field (type, buf1, buf2) == 3)
            r = YES
         else
            r = NO
      when (LESYM)
         if (compare_field (type, buf1, buf2) ~= 3)
            r = YES
         else
            r = NO
      when (NESYM)
         if (compare_field (type, buf1, buf2) ~= 2)
            r = YES
         else
            r = NO
      when (GESYM)
         if (compare_field (type, buf1, buf2) ~= 1)
            r = YES
         else
            r = NO
   else
      call print (ERROUT, "in eval_rel: bogus entry *i*n"s, op)

   return (r)
   end
