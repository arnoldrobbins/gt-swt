# getvdn --- return the name of a file in the user's variables directory

   subroutine getvdn (fn, pn, un)
   character fn (ARB), pn (ARB), un (ARB)

   integer i
   integer length, equal, ctoc, scopy
   character name (MAXLINE)
   logical missin

   include SWT_COMMON

   i = ctoc ("=vars=/"s, pn, MAXLINE)

   call date (SYS_USERID, name)
   if (missin (un) || equal (un, name) == YES) {
      i += scopy (name, 1, pn, i + 1)
      if (length (Passwd) ~= 0) {
         pn (i + 1) = ':'c
         i += scopy (Passwd, 1, pn, i + 2) + 1
         }
      }
   else
      i += scopy (un, 1, pn, i + 1)
   pn (i + 1) = '/'c
   call scopy (fn, 1, pn, i + 2)

   return
   end
