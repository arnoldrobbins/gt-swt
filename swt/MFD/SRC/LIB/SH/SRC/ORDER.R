# order --- determine preferred execution order of nodes in a net

   integer function order (a, n, v)
   integer n, v (n), a (MAXNODES, MAXNODES)

   integer d (MAXNODES), i, j, t
   integer ckex

   order = ckex (a, n)           # check executability of net
   if (order == ERR)
      return

   if (n == 1) {
      v (1) = 1                  # exclude singleton net from sort
      return
      }

   do i = 1, n; {
      d (i) = 0
      v (i) = i
      do j = 1, n
         d (i) += a (i, j)
      }

   for (i = n; i > 1; i -= 1)       # sort order and dependence vectors
      for (j = 1; j < i; j += 1)
         if (d (j) < d (j + 1)) {
            t = d (j)
            d (j) = d (j + 1)
            d (j + 1) = t
            t = v (j)
            v (j) = v (j + 1)
            v (j + 1) = t
            }

   return      # v (*) contains preferred execution order
   end



# ckex --- check serial executability of net whose matrix is 'a';
#          convert 'a' from connectivity matrix to reachability matrix

   integer function ckex (a, n)
   integer n, a (MAXNODES, MAXNODES)

   integer i

   call warsh (a, n)         # convert to reachability matrix
   do i = 1, n
      if (a (i, i) == 1)     # does net contain a loop?
         return (ERR)

   return (OK)               # net contains no loops

   end



# warsh --- compute transitive closure of 'a' by Warshall's algorithm

   subroutine warsh (a, n)
   integer n, a (MAXNODES, MAXNODES)

   integer i, j, k

   do i = 1, n
      do j = 1, n
         if (a (j, i) == 1)
            do k = 1, n
               a (j, k) |= a (i, k)

   return
   end
