# parscl --- parse command line arguments

   integer function parscl (str, buf)
   character str (ARB), buf (MAXARGBUF)

   integer ap, bp, cp, sp, lc, i, l, k, at, status
   integer argtype (26)
   integer getarg, gctoi, ctoc, strbsr
   character arg (MAXARG)
   character mapdn

   string_table atx, att,
      / ARG_FLAG,             "f" _
      / ARG_FLAG,             "flag" _
      / ARG_IGNORED,          "ign" _
      / ARG_IGNORED,          "ignored" _
      / ARG_NOT_ALLOWED,      "na" _
      / ARG_OPT_INT,          "oi" _
      / ARG_OPT_INT,          "opt int" _
      / ARG_OPT_STR,          "opt str" _
      / ARG_OPT_STR,          "os" _
      / ARG_REQ_INT,          "req int" _
      / ARG_REQ_STR,          "req str" _
      / ARG_REQ_INT,          "ri" _
      / ARG_REQ_STR,          "rs"

   procedure get_argtype forward
   procedure next_argument forward

   do i = 1, 26
      argtype (i) = ARG_NOT_ALLOWED

  ### Parse the command string
   for (sp = 1; str (sp) ~= EOS; sp += 1)
      if (IS_LETTER (str (sp))) {
         lc = mapdn (str (sp)) - 'a'c + 1
         get_argtype
         argtype (lc) = at
         }

   ### Initialize the argument buffer
   do i = 1, 26
      buf (i) = ARG_NOT_SEEN
   do i = 27, 52
      buf (i) = 0

   ### Examine the argument list
   bp = 54
   ap = 1
   next_argument
   while (status ~= EOF) {

      l = mapdn (arg (cp)) - 'a'c + 1
      if (l < 1 || l > 26)
         return (ERR)

      buf (l) = ARG_LETTER_SEEN

      select (argtype (l))

         when (ARG_NOT_ALLOWED)
            return (ERR)

         when (ARG_IGNORED) {
            if (cp ~= 2)         # ignored args can only be first letters
               return (ERR)
            ap += 1
            next_argument
            }

         when (ARG_REQ_INT, ARG_OPT_INT)
            if (arg (cp + 1) == EOS) {
               call delarg (ap)
               if (getarg (ap, arg, MAXARG) ~= EOF
                     && (IS_DIGIT (arg (1))
                        || arg (1) == '-'c && IS_DIGIT (arg (2)))) {
                  cp = 1
                  buf (l + 26) = gctoi (arg, cp, 10)
                  if (arg (cp) ~= EOS)
                     return (ERR)
                  buf (l) = ARG_VALUE_SEEN
                  call delarg (ap)
                  }
               else if (argtype (l) == ARG_REQ_INT)
                  return (ERR)
               next_argument
               }
            else {
               cp += 1
               k = cp
               buf (l + 26) = gctoi (arg, cp, 10)
               if (k == cp) {    # no number here
                  if (argtype (l) == ARG_REQ_INT)
                     return (ERR)
                  }
               else     # indicate that value was given
                  buf (l) = ARG_VALUE_SEEN
               }

         when (ARG_REQ_STR, ARG_OPT_STR)
            if (arg (cp + 1) == EOS) {
               call delarg (ap)
               if (getarg (ap, arg, MAXARG) ~= EOF && arg (1) ~= '-'c ) {
                  buf (l + 26) = bp
                  bp += 1 + ctoc (arg, buf (bp), MAXARGBUF - bp)
                  call delarg (ap)
                  buf (l) = ARG_VALUE_SEEN
                  }
               else if (argtype (l) == ARG_REQ_STR)
                  return (ERR)
               next_argument
               }
            else {
               buf (l + 26) = bp
               bp += 1 + ctoc (arg (cp + 1), buf (bp), MAXARGBUF - bp)
               buf (l) = ARG_VALUE_SEEN
               call delarg (ap)
               next_argument
               }

         when (ARG_FLAG)
            cp += 1

      if (arg (cp) == EOS) {  # bump the argument pointer if necessary
         call delarg (ap)
         next_argument
         }

      }

   do i = 1, 26
      if (buf (i) ~= ARG_VALUE_SEEN    # ensure string opts are defined
            && (argtype (i) == ARG_OPT_STR || argtype (i) == ARG_REQ_STR))
         buf (i + 26) = bp

   buf (bp) = EOS
   bp += 1

   buf (53) = bp
   return (OK)

   # get_argtype --- get and parse an argument type
      procedure get_argtype {

      local tbuf, tp, x
      character tbuf (MAXLINE)
      integer tp, x

      at = ARG_FLAG

      while (str (sp + 1) ~= '<'c && ~ IS_LETTER (str (sp + 1))
               && str (sp + 1) ~= EOS)
         sp += 1

      if (str (sp + 1) == '<'c) {
         tp = 1
         sp += 1
         while (str (sp + 1) ~= '>'c && str (sp + 1) ~= EOS) {
            tbuf (tp) = str (sp + 1)
            sp += 1
            tp += 1
            }
         tbuf (tp) = EOS
         x = strbsr (atx, att, 1, tbuf)
         if (x == EOF) {
            call putlin (tbuf, ERROUT)
            call error (": unrecognized argument type in parscl"p)
            }
         at = att (atx (x))
         }
     }


   # next_argument --- obtain the next argument to parse

      procedure next_argument {

      status = getarg (ap, arg, MAXARG)
      while (status ~= EOF && (arg (1) ~= '-'c || ~ IS_LETTER (arg (2)))) {
         ap += 1
         status = getarg (ap, arg, MAXARG)
         }
      cp = 2

      }

   end
