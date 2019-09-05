# crypt --- reversibly encrypt text from STDIN to STDOUT

   integer i, j, keylen, inc
   integer getlin, getarg, prmptq
   character line (MAXLINE), key (MAXLINE)

   keylen = getarg (1, key, MAXLINE)
   if (keylen == EOF)
      keylen = prmptq ("Key: "s, key, MAXLINE)
   if (keylen == EOF)
      call error ("Usage: crypt <key>"p)

   for (j = 1; j <= keylen; j += 1)    # massage the key:
      key (j) = xor (ls (and (key (j), 2r00011), 3),
                     rs (and (key (j), 2r11100), 2))

   j = keylen
   inc = -1
   while (getlin (line, STDIN) ~= EOF) {
      if (keylen > 0)
         for (i = 1; line (i) ~= EOS; i += 1) {
            if (line (i) ~= NEWLINE)
               line (i) ^= key (j)
            j += inc
            if (j > keylen || j < 1) {
               j -= inc * 2
               inc = - inc
               }
            }
      call putlin (line, STDOUT)
      }

   stop
   end


# prmptq --- disable echo and prompt for a string

   integer function prmptq (prompt, reply, max_reply)
   character prompt (ARB), reply (ARB)
   integer max_reply

   integer lword
   integer getlin, duplx$

   lword = duplx$ (-1)
   call duplx$ (or (lword, :140000))   # disable echo

   call putlin (prompt, TTY)
   prmptq = getlin (reply, TTY, max_reply)
   call putch (NEWLINE, TTY)
   if (prmptq > 0 && reply (prmptq) == NEWLINE) {
      reply (prmptq) = EOS
      prmptq -= 1
      }

   call duplx$ (lword)

   return
   end
