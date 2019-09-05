# settab --- set tab stops

   integer function settab (str)
   character str (ARB)

   include SE_COMMON

   integer i, j, n, maxstop, last, inc
   integer ctoi

   for (i = 1; i <= MAXLINE; i += 1)   # clear all tab stops
      Tabstops (i) = NO

   settab = OK
   maxstop = 0
   last = 1

   i = 1
   SKIPBL (str, i)
   while (str (i) ~= EOS && str (i) ~= NEWLINE) {

      if (str (i) == '+'c) {     # increment
         i += 1
         inc = YES
         }
      else
         inc = NO

      n = ctoi (str, i)

      if (n <= 0 || n >= MAXLINE) {
         settab = ERR
         Errcode = ENONSENSE
         break
         }

      if (str (i) ~= ' 'c && str (i) ~= '+'c &&
                  str (i) ~= NEWLINE && str (i) ~= EOS) {
         settab = ERR
         Errcode = EBADTABS
         break
         }

      if (inc == YES) {
         for (j = last + n; j < MAXLINE; j += n) {
            Tabstops (j) = YES
            maxstop = max (j, maxstop)
            }
         }
      else {
         Tabstops (n) = YES
         last = n
         maxstop = max (n, maxstop)
         }

      SKIPBL (str, i)

      }  # while ...

   if (settab == ERR)
      maxstop = 0

   if (maxstop == 0) {   # no tab stops specified, use defaults
      for (i = 4; i < MAXLINE; i += 3)
         Tabstops (i) = YES
      maxstop = i - 3
      }

   Tabstops (1) = YES         # always set to YES

   for (i = maxstop + 1; i <= MAXLINE; i += 1)
      Tabstops (i) = YES

   return
   end
