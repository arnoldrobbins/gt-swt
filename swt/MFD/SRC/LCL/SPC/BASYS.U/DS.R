define(LOC_MEMEND,1)    # pointer to end of memory
define(LOC_AVAIL,2)     # start of available space list
define(LAMBDA,0)        # null link (end of avail list)
define(C,8)             # threshhold for close-fitting blocks

define(LINK,0)          # link field of storage block
define(SIZE,1)          # size field of storage block
define(OVERHEAD,2)      # total words of overhead per block
# alloc --- get pointer to block of at least w available words

   pointer function alloc (w)
   integer w

   integer mem (1)
   common /dsmem$/ mem

   pointer p, q, l

   integer n, k

   character c

   n = w + OVERHEAD
   q = LOC_AVAIL

   repeat {
      p = mem (q + LINK)
      if (p == LAMBDA) {
         call remark ("in alloc: out of storage space.")
         call remark ("type 'c' or 'i' for char or integer dump.")
         call getch (c, ERRIN)
         if (c == 'c'c | c == 'C'c)
            call dsdump (LETTER)
         else if (c == 'i'c | c == 'I'c)
            call dsdump (DIGIT)
         call error ("program terminated.")
         }
      if (mem (p + SIZE) >= n)
         break
      q = p
      }

   k = mem (p + SIZE) - n
   if (k < C) {
      mem (q + LINK) = mem (p + LINK)
      l = p
      }
   else {
      mem (p + SIZE) = k
      l = p + k
      mem (l + SIZE) = n
      }

   alloc = l + OVERHEAD
   return
   end
# free --- return a block of storage to the available space list

   subroutine free (block)
   pointer block

   integer mem (1)
   common /dsmem$/ mem

   pointer p0, p, q

   integer n

   p0 = block - OVERHEAD
   n = mem (p0 + SIZE)
   q = LOC_AVAIL

   repeat {
      p = mem (q + LINK)
      if (p == LAMBDA | p > p0)
         break
      q = p
      }

   if (p0 + n == p & p ~= LAMBDA) {
      n = n + mem (p + SIZE)
      mem (p0 + LINK) = mem (p + LINK)
      }
   else
      mem (p0 + LINK) = p

   if (q + mem (q + SIZE) == p0) {
      mem (q + SIZE) = mem (q + SIZE) + n
      mem (q + LINK) = mem (p0 + LINK)
      }
   else {
      mem (q + LINK) = p0
      mem (p0 + SIZE) = n
      }

   return
   end
# dsdump --- produce semi-readable dump of storage

   subroutine dsdump (form)
   character form

   integer mem (1)
   common /dsmem$/ mem

   pointer p, t, q

   t = LOC_AVAIL

   call print (ERROUT, "** DYNAMIC STORAGE DUMP ***n.")
   call print (ERROUT, "*5i   *i words in use*n.", 1, OVERHEAD + 1)

   p = mem (t + LINK)
   while (p ~= LAMBDA) {
      call print (ERROUT, "*5i   *i words available*n.",
         p, mem (p + SIZE))
      q = p + mem (p + SIZE)
      while (q ~= mem (p + LINK) & q < mem (LOC_MEMEND))
         call dsdbiu (q, form)
      p = mem (p + LINK)
      }

   call print (ERROUT, "** END DUMP ***n.")
   return
   end
# dsdbiu --- dump contents of block-in-use

   subroutine dsdbiu (b, form)
   pointer b
   character form

   integer mem (1)
   common /dsmem$/ mem

   integer l, s, lmax

   call print (ERROUT, "*5i   *i words in use*n.", b, mem (b + SIZE))

   l = 0
   s = b + mem (b + SIZE)
   if (form == DIGIT)
      lmax = 5
   else
      lmax = 50

   for (b = b + OVERHEAD; b < s; b = b + 1) {
      if (l == 0)
         call print (ERROUT, "          .")
      if (form == DIGIT)
         call print (ERROUT, " *10i.", mem (b))
      else if (form == LETTER)
         call print (ERROUT, "*c.", mem (b))
      l = l + 1
      if (l >= lmax) {
         l = 0
         call print (ERROUT, "*n.")
         }
      }

   if (l ~= 0)
      call print (ERROUT, "*n.")

   return
   end
# dsinit --- initialize dynamic storage space to w words

   subroutine dsinit (w)
   integer w

   integer mem (1)
   common /dsmem$/ mem

   pointer t

   if (w < 2 * OVERHEAD + 2)
      call error ("in dsinit: unreasonably small memory size.")

   # set up avail list:
   t = LOC_AVAIL
   mem (t + SIZE) = 0
   mem (t + LINK) = LOC_AVAIL + OVERHEAD

   # set up first block of space:
   t = LOC_AVAIL + OVERHEAD
   mem (t + SIZE) = w - OVERHEAD - 1     # -1 for MEMEND
   mem (t + LINK) = LAMBDA

   # record end of memory:
   mem (LOC_MEMEND) = w

   return
   end
