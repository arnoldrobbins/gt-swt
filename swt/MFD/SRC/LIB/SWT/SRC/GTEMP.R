# gtemp --- parse a template and its definition

   integer function gtemp (str, nm, repl)
   character str (ARB), nm (MAXARG), repl (MAXARG)

   integer i, j, l

   l = 1                         # throw away comments
   while (str (l) ~= EOS && str (l) ~= '#'c && str (l) ~= NEWLINE)
      l += 1
   repeat l -= 1                 # strip trailing blanks
      until (l <= 0 || str (l) ~= ' 'c)
   if (l <= 0)                   # this is a blank line
      return (EOF)

   l += 1                        # remember where end of text is

   i = 1
   SKIPBL (str, i)               # grab the name
   for (j = 1; j < MAXARG && i < l && str (i) ~= ' 'c; {j += 1; i += 1})
      nm (j) = str (i)
   nm (j) = EOS

   SKIPBL (str, i)               # grab the replacement value
   for (j = 1; j < MAXARG && i < l; {j += 1; i += 1})
      repl (j) = str (i)
   repl (j) = EOS

   return (OK)
   end
