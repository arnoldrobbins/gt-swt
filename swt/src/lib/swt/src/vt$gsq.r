# vt$gsq --- get a delimited sequence of characters

   integer function vt$gsq (msg, delim, seq, max)
   character msg (ARB), delim, seq (ARB)
   integer max

   include SWT_COMMON

   integer sp, tp
   integer encode, ctomn
   character c
   character text (MAXCOLS), dtext (4)

   call ctomn (delim, dtext)
   tp = 1 + encode (text, MAXCOLS, "*s (*s):"s, msg, dtext)
   call vtmsg (text, CHAR_MSG)
   call vtupd (NO)

   call c1in (c)
   for (sp = 1; c ~= delim && sp < max; sp += 1) {

      if (tp < MAXCOLS - 5) {
         text (tp) = ' 'c
         tp += 1 + ctomn (c, text (tp + 1))
         call vtmsg (text, CHAR_MSG)
         call vtupd (NO)
         }

      seq (sp) = c
      call c1in (c)
      }

   if (sp >= max) {
      call vt$err ("Too long"s)
      seq (1) = EOS
      return (ERR)
      }
   if (sp <= 1) {
      call vt$err ("Empty sequence illegal"s)
      seq (1) = EOS
      return (ERR)
      }

   seq (sp) = EOS
   return (sp - 1)
   end
