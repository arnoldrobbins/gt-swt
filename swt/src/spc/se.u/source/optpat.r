# optpat --- make pattern specified at lin (i)

   integer function optpat (lin, i)
   character lin (MAXLINE)
   integer i

   include SE_COMMON

   integer makpat

   if (lin (i) == EOS)
      i = ERR
   elif (lin (i + 1) == EOS)
      i = ERR
   elif (lin (i + 1) == lin (i))   # repeated delimiter
      i = i + 1         # leave existing pattern alone
   else
      i = makpat (lin, i + 1, lin (i), Pat)

   if (Pat (1) == EOS) {
      optpat = ERR
      Errcode = ENOPAT
      }
   elif (i == ERR) {
      Pat (1) = EOS
      optpat = ERR
      Errcode = EBADPAT
      }
   else
      optpat = OK

   return
   end
