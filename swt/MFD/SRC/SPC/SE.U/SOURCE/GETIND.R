# getind --- locate line index in buffer

   pointer function getind (line)
   integer line

   include SE_COMMON

   integer j
   pointer k

   for ({k = Line0; j = 0}; j < line; {k = Nextline (k); j += 1})
      ;

   return (k)

   end
