#  cset --- display character in a variety of formats

   include ARGUMENT_DEFS

   define (USAGE, "Usage: cset [-i <int> | -k <key> | -m <mnemonic>] [-o (i | k | m)]"s)

   define (INTEGER,1)
   define (KEYCODE,2)
   define (MNEMONIC,3)
   define (VERBOSE,4)

   define (MN (i),mn (1, i-127))
   define (KC (i),kc (1, i-127))

   ARG_DECL

   integer getarg, equal
   integer ch, first, last, format
   character arg (4), mn (4, 128), st (3), kc (3, 128)

   PARSE_COMMAND_LINE ("i<ri>k<rs>m<rs>o<rs>"s, USAGE)

   if (ARG_PRESENT (i)) {
      if (ARG_PRESENT (k) || ARG_PRESENT (m))
         call error (USAGE)
      }
   elif (ARG_PRESENT (k)) {
      if (ARG_PRESENT (m))
         call error (USAGE)
      }
   elif (getarg (1, arg, 2) ~= EOF)
      call error (USAGE)

   if (ARG_PRESENT (o)) {
      call ctoc (ARG_TEXT (o), arg, 2)
      call mapstr (arg, LOWER)

      if (arg (1) == 'i'c)
         format = INTEGER
      elif (arg (1) == 'k'c)
         format = KEYCODE
      elif (arg (1) == 'm'c)
         format = MNEMONIC
      else
         call error (USAGE)
      }
   else
      format = VERBOSE

   do ch = NUL, DEL; {
      call ctomn (ch, MN (ch))

      if (ch < ' 'c || ch == DEL) {
         st (1) = '^'c
         if (ch == DEL)
            st (2) = '#'c
         else
            st (2) = ch + '@'c - NUL
         st (3) = EOS
         }
      else {
         st (1) = ch
         st (2) = EOS
         }

      call scopy (st, 1, KC (ch), 1)
      }

   if (ARG_PRESENT (i)) {
      first = ARG_VALUE (i)
      if (first >= 0 && first < NUL)
         first += NUL
      last = first

      if (first < NUL || first > DEL) {
         first = NUL
         last = first - 1
         }
      }
   elif (ARG_PRESENT (k)) {
      call ctoc (ARG_TEXT (k), arg, 3)
      if (arg (1) == '^'c)
         call mapstr (arg, UPPER)

      first = NUL
      last = first - 1

      do ch = NUL, DEL
         if (equal (arg, KC (ch)) == YES) {
            first = ch
            last = ch
            break
            }
      }
   elif (ARG_PRESENT (m)) {
      call ctoc (ARG_TEXT (m), arg, 4)
      call mapstr (arg, UPPER)

      first = NUL
      last = first - 1

      do ch = NUL, DEL
         if (equal (arg, MN (ch)) == YES) {
            first = ch
            last = ch
            break
            }
      }
   else {
      first = NUL
      last = DEL
      }

   select (format)
      when (INTEGER)
         for (ch = first; ch <= last; ch += 1)
            call print (STDOUT, "*i*n"s, ch)

      when (KEYCODE)
         for (ch = first; ch <= last; ch += 1)
            call print (STDOUT, "*s*n"s, KC (ch))

      when (MNEMONIC)
         for (ch = first; ch <= last; ch += 1)
            call print (STDOUT, "*s*n"s, MN (ch))

      when (VERBOSE)
         for (ch = first; ch <= last; ch += 1)
            call print (STDOUT,
               " *i decimal, *,8i octal, *,16i hex.  keycode = *-2s, mnemonic = *s.*n"s,
                 ch,          ch,         ch,                 KC (ch),         MN (ch))

   stop
   end
