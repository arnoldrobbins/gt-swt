# alloc --- allocate space for a new pointer block

   integer function alloc (ptr)
   pointer ptr

   include SE_COMMON

   longint last

   if (Free == NOMORE) {   # no free list, expand into unallocated space
      last = and(:00177777, intl(Lastbf)) # kludge to use all 16 bits!
      if (last <= MAXBUF) {    # see if there's room
         ptr = Lastbf
         Lastbf += BUFENT
         }
      else                 # out of pointer space
         ptr = NOMORE
      }
   else {
      ptr = Free           # remove a block from the free list
      Free = Prevline (Free)
      }

   return (ptr)

   end
