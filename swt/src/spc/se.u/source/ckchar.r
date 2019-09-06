# ckchar --- look for ch or altch on lin at i, set flag

   integer function ckchar (ch, altch, lin, i, flag, status)
   character ch, altch
   integer lin (ARB), i, flag, status

   if (lin (i) == ch || lin (i) == altch) {
      i += 1
      flag = YES
      }
   else
      flag = NO

   status = OK
   ckchar = OK

   return
   end
