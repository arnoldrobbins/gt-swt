# getkn --- get mark name from lin (i), increment i

   integer function getkn (lin, i, kname, dfltnm)
   character lin (ARB), kname
   integer i, dfltnm

   if (lin (i) == NEWLINE || lin (i) == EOS) {
      kname = dfltnm
      getkn = EOF
      }
   else {
      kname = lin (i)
      i += 1
      getkn = OK
      }

   return
   end
