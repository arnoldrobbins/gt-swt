# nodes --- return the names of all system nodes

   include "=incl=/x$keys.r.i"

   integer num, arr1 (1024), len1, arr2 (128), len2, code, time
   integer prime (128), plen
   integer pos, i
   character node (7)

   call x$stat (XI$ADR, num, arr1, len1, arr2, len2, code, time)
   if (code == XS$NET)
      call error ("networks not configured"p)
   elif (code ~= XS$CMP)
      call error ("x$stat error. Shouldn't happen"p)

   for ({pos = 1; i = 1}; i <= len2; {pos += (arr2 (i) + 1) / 2; i += 1}) {
      call x$stat (XI$XTP, num, arr1 (pos), arr2 (i), prime, plen, code, time)
      call ptoc (prime, ' 'c, node, plen + 1)
      call mapstr (node, LOWER)
      call print (STDOUT, "*s*n"s, node)
      }

   stop
   end
