# Miscellaneous I/O routines for 'moot':

# ask --- ask a question, obtain a reply

   subroutine ask (quest, reply)
   packed_char quest (ARB)
   character reply (MAXLINE)

   include commonblocks

   integer i, l
   integer getlin

   repeat {    # until we get some real input
      SKIPBL (Inbuf, Ibp)
      if (Inbuf (Ibp) == EOS) {
         call print (STDOUT, "*p"s, quest)
         l = getlin (Inbuf, STDIN)
         if (l == EOF)
            next
         Inbuf (l) = EOS
         Ibp = 1
         SKIPBL (Inbuf, Ibp)
         }
      i = 1
      for (; Inbuf (Ibp) ~= ';'c & Inbuf (Ibp) ~= EOS; Ibp += 1) {
         reply (i) = Inbuf (Ibp)
         i += 1
         }
      reply (i) = EOS
      if (Inbuf (Ibp) == ';'c)
         Ibp += 1
      if (reply (1) == '?'c)
         next
      break
      }

   return
   end



# getcmd --- read command, select from a list of alternatives

   integer function getcmd (prompt, strpos, alts)
   packed_char prompt (ARB)
   integer strpos (ARB)
   character alts (ARB)

   include commonblocks

   character curch

   integer i, j, count, val, p
   integer getlin

   logical equnam

   repeat {    # until an acceptable response is made

      repeat {    # until we've got some input text
         SKIPBL (Inbuf, Ibp)
         if (Inbuf (Ibp) == EOS) {
            call print (STDOUT, "*p"s, prompt)
            i = getlin (Inbuf, STDIN)
            if (i == EOF)
               next
            Inbuf (i) = EOS
            Ibp = 1
            SKIPBL (Inbuf, Ibp)
            }
         break
         }

      p = Ibp     # record beginning of command
      repeat {    # until we've located a command
         SKIPBL (Inbuf, Ibp)
         if (Inbuf (Ibp) == '?'c) {      # print the menu
            Ibp += 1
            call print (STDOUT, "Please enter one of the following:*n*n"s)
            for (i = 2; i <= strpos (1) + 1; i += 1) {
               j = strpos (i)
               call print (STDOUT, "     *s*n"s, alts (j + 1))
               }
            call putch (NEWLINE, STDOUT)
            Inbuf (Ibp) = EOS             # toss the input buffer
            next 2
            }
         if (Inbuf (Ibp) == EOS)          # no unique command...
            break
         if (Inbuf (Ibp) == ';'c) {       # multiple commands on line
            Ibp += 1
            next 2
            }
         while (Inbuf (Ibp) ~= ' 'c & Inbuf (Ibp) ~= TAB
          & Inbuf (Ibp) ~= ';'c & Inbuf (Ibp) ~= EOS)
            Ibp += 1
         curch = Inbuf (Ibp)              # remember this char
         Inbuf (Ibp) = EOS                # temporarily end the string

         count = 0
         for (i = 2; i <= strpos (1) + 1; i += 1) {
            j = strpos (i)
            if (equnam (Inbuf (p), alts (j + 1))) {
               val = alts (j)
               count += 1
               }
            }

         if (count == 0) {          # what?
            call print (STDOUT, "Unrecognized command*n"s)
            Inbuf (Ibp) = EOS       # toss the input buffer
            next 2
            }
         Inbuf (Ibp) = curch        # reinsert the remembered char
         if (count == 1) {          # found it !
            getcmd = val
            return
            }

         }  # repeat until command is located

     # if we're here, the input is ambiguous
      call print (STDOUT, "You must differentiate between*n*n"s)
      for (i = 2; i <= strpos (1) + 1; i += 1) {
         j = strpos (i)
         if (equnam (Inbuf (p), alts (j + 1)))
            call print (STDOUT, "     *s*n"s, alts (j + 1))
         }
      call putch (NEWLINE, STDOUT)
      Inbuf (Ibp) = EOS          # toss the input buffer

      }  # repeat until we get recognizable, unambiguous input

   end



# getyn --- prompt, print old value, get YES or NO response

   subroutine getyn (inx, defalt, prompt, array)
   integer inx
   character defalt, prompt (ARB), array (ARB)

   character buf (MAXLINE)

   integer getlin

   repeat {    # until we get reasonable input
      call print (STDOUT, "*s (*c) "s, prompt, array (inx))
      call ask (""p, buf)
      select (buf (1))
         when ('y'c, 'Y'c)
            array (inx) = 'y'c
         when ('n'c, 'N'c)
            array (inx) = 'n'c
         when ('d'c, 'D'c)
            array (inx) = defalt
         when (EOS)
            ;
         when ('?'c)
            next
      else {
         call errmsg ("Unacceptable input, please try again"p)
         next
         }
      break
      }

   return
   end
