# tsort --- topological sort

   include "tsort_def.r.i"
   include ARGUMENT_DEFS
   include TSORT_COMMON

   ARG_DECL
   pointer t, i, j
   pointer dsget, index
   integer input
   character precedes (MAXLINE), follows (MAXLINE)
   logical found
   logical present, anypred

   PARSE_COMMAND_LINE ("v"s, "Usage: tsort [ -v ]"s)
   call dsinit (MEMSIZE)
   firstnode = dsget (NODELISTSIZE)
   nextnode (firstnode) = NULL
   inedges (firstnode) = NULL
   name (firstnode) = NULL
   live (firstnode) = DEAD
   ispred (firstnode) = NO

# The first for loop reads in the graph,
# the second prints out the ordering.

   repeat  {
      if (input (STDIN, "*s*s"s, precedes, follows) == EOF)
         break
      if (precedes (1) == EOS || follows (1) == EOS) {
         call print (ERROUT, '"*s,*s" input error*n's, precedes, follows)
         next
         }
      i = index (precedes)
      j = index (follows)
      ispred (i) = YES
      if (i == j || present (i, j))
         next
      t = dsget (PREDLISTSIZE)
      nextpred (t) = inedges (j)
      pred (t) = i
      inedges (j) = t
      }

   repeat  {
      found = FALSE
      for (i = firstnode; nextnode (i) ~= NULL; i = nextnode (i)) {
         if (live (i) == LIVE) {
            found = TRUE
            if (~anypred (i))
               break    # found a live node with no predecessors
            }
         }
      if (~found)
         break
      if (nextnode (i) == NULL)
         call findloop (i)
      if (ARG_PRESENT (v) || ispred (i) == YES)
         call print (STDOUT, "*s*n"s, name (i))
      live (i) = DEAD
      }

   stop
   end


# present --- is i present on j's predecessor list?

   logical function present (i, j)
   pointer i, j

   include TSORT_COMMON
   pointer t

   for (t = inedges (j); t ~= NULL; t = nextpred (t))
      if (pred (t) == i)
         return (TRUE)

   return (FALSE)
   end


# anypred --- is there any live predecessor for i?

   logical function anypred (i)
   pointer i

   include TSORT_COMMON
   pointer t

   for (t = inedges (i); t ~= NULL; t = nextpred (t))
      if (live (pred (t)) == LIVE)
         return (TRUE)

   return (FALSE)
   end


# index --- turn a string into a node pointer

   pointer function index (s)
   character s (ARB)

   include TSORT_COMMON
   pointer i, t
   pointer dsget
   integer length, equal

   for (i = firstnode; nextnode (i) ~= NULL; i = nextnode (i))
      if (equal (s, name (i)) == YES)
         return (i)
   t = dsget (length (s)   +  1)
   nextnode (i) = dsget (NODELISTSIZE)
   nameptr (i) = t
   live (i) = LIVE
   nextnode (nextnode (i)) = NULL
   inedges (nextnode (i)) = NULL
   live (nextnode (i)) = DEAD
   call ctoc (s, name (i), MAXLINE)

   return (i)
   end


# findloop --- given that there is a cycle, find some node in it

   subroutine findloop (ptr)
   pointer ptr

   include TSORT_COMMON
   pointer i, j, p

   for (i = firstnode; nextnode (i) ~= NULL; i = nextnode (i))
      if (live (i) == LIVE)
         break
   call print (ERROUT, "cycle (in reverse order):"s)
   while (live (i) == LIVE) {
      live (i) = ONCE
      for (p = inedges (i); ; p = nextpred (p)) {
         if (p == NULL)
            call error ("error 1"s)
         i = pred (p)
         if (live (i) ~= DEAD)
            break
         }
      }
   while (live (i) == ONCE) {
      live (i) = TWICE
      call print (ERROUT, " *s"s, name (i))
      for (p = inedges (i); ; p = nextpred (p)) {
         if (p == NULL)
            call error ("error 2"s)
         i = pred (p)
         if (live (i) ~= DEAD)
            break
         }
      }
   call putch (NEWLINE, ERROUT)
   for (j = firstnode; nextnode (j) ~= NULL; j = nextnode (j))
      if (live (j) ~= DEAD)
         live (j) = LIVE

   ptr = i

   return
   end
