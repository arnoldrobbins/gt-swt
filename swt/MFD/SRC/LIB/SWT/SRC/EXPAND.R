# expand --- convert a template into an EOS-terminated string

   integer function expand (template, str, strlen)
   integer strlen
   character template (ARB), str (strlen)

   integer ji, ti, si, pi, xi
   integer lutemp
   character c

   character jig (MAXLINE), pbuf (MAXLINE), xbuf (MAXLINE)

   procedure getchar forward

   si = 1            # 'str' index
   pi = 1            # 'pbuf' index
   ti = 1            # 'template' index

   for (getchar; si <= strlen && c ~= EOS; getchar) {
      if (c == '='c) {     # start of a template?
         getchar
         for (ji = 1; ji <= MAXLINE && c ~= '='c && c ~= EOS; ji += 1) {
            jig (ji) = c
            getchar
            }
         jig (ji) = EOS
         if (c ~= '='c) {
            str (si) = EOS
            return (ERR)
            }
         if (ji <= 1) {       # empty template .. expand to '='c
            str (si) = '='c
            si += 1
            }
         else {
            xi = lutemp (jig, xbuf, MAXLINE)
            if (xi == EOF || xi + pi >= MAXLINE) {
               str (si) = EOS
               return (ERR)
               }
            for (; xi > 0; {xi -= 1; pi += 1})
               pbuf (pi) = xbuf (xi)
            }
         }
      else {
         str (si) = c
         si += 1
         }
      }

   str (si) = EOS

   if (c ~= EOS)
      return (ERR)

   return (si - 1)


   # getchar --- get a character from the template or pushback buffer
      procedure getchar {

         if (pi > 1) {
            pi -= 1
            c = pbuf (pi)
            }
         else if (template (ti) ~= EOS) {
            c = template (ti)
            ti += 1
            }
         else
            c = EOS

         }

   end
