# getlst --- collect line numbers (if any) at lin (i), increment i

   integer function getlst (lin, i, status)
   character lin (MAXLINE)
   integer i, status

   include SE_COMMON

   integer num
   integer getone

   Line2 = 0
   for (Nlines = 0; getone (lin, i, num, status) == OK; ) {
      Line1 = Line2
      Line2 = num
      Nlines += 1
      if (lin (i) ~= ','c && lin (i) ~= ';'c)
         break
      if (lin (i) == ';'c)
         Curln = num
      i += 1
      }

   if (Nlines > 2)
      Nlines = 2

   if (Nlines <= 1)
      Line1 = Line2

   if (Line1 > Line2) {
      status = ERR
      Errcode = EBACKWARD
      }

   if (status ~= ERR)
      status = OK

   return (status)

   end
