# mntoc --- translate ASCII mnemonic into a character

   character function mntoc (buf, p, default)
   character buf (ARB), default
   integer p

   integer i, tp
   integer strbsr
   character c, tmp (MAXLINE)

   string_table pos, text
      ACK, "ack"/ BEL, "bel"/ BS,  "bs"/  CAN, "can"/
      CR,  "cr"/  DC1, "dc1"/ DC2, "dc2"/ DC3, "dc3"/
      DC4, "dc4"/ DEL, "del"/ DLE, "dle"/ EM,  "em"/
      ENQ, "enq"/ EOT, "eot"/ ESC, "esc"/ ETB, "etb"/
      ETX, "etx"/ FF,  "ff"/  FS,  "fs"/  GS,  "gs"/
      HT,  "ht"/  LF,  "lf"/  NAK, "nak"/ NUL, "nul"/
      RS,  "rs"/  SI,  "si"/  SO,  "so"/  SOH, "soh"/
      SP,  "sp"/  STX, "stx"/ SUB, "sub"/ SYN, "syn"/
      US,  "us"/  VT,  "vt"

   if (buf (p) == EOS)
      return (default)

   tp = 1
   repeat {
      tmp (tp) = buf (p)
      tp += 1
      p += 1
      } until (~ (IS_LETTER (buf (p)) || IS_DIGIT (buf (p)))
                  || tp >= MAXLINE)
   tmp (tp) = EOS

   if (tp == 2)
      c = tmp (1)
   else {
      call mapstr (tmp, LOWER)
      i = strbsr (pos, text, 1, tmp)
      if (i ~= EOF)
         c = text (pos (i))
      else
         c = default
      }

   return (c)
   end
