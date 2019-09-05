# vcg_mem --- code generator memory management routines


define (DB,#)

define (MEM_COMMON,"vcg_mem_com.r.i")

define (UTOL(u),rt(intl(u),16))     # convert from unsigned to long

define (OBJ_HASH_TAB_SIZE, 43)      # must be prime

define (locate_obj, mem$01)         # routine is local to module



# ialloc --- allocate space for an instruction node in instruction store

   ipointer function ialloc (size)
   integer size

   include MEM_COMMON

   if (UTOL (size) + UTOL (Nexti) > MAX_INS_MEMORY)
      call panic ("out of instr storage memory*n"p)

   ialloc = Nexti
   Nexti += size

   return
   end



# talloc --- allocate space for a tree node in tree store

   tpointer function talloc (size)
   integer size

   include MEM_COMMON

   if (UTOL (size) + UTOL (Nextt) > intl(MAX_TREE_MEMORY))
      call panic ("out of tree storage memory*n"p)

   talloc = Nextt
   Nextt += size

   return
   end



# clear_instr --- initialize instruction-storage memory

   subroutine clear_instr

   include MEM_COMMON

   Nexti = 1

   return
   end



# clear_str --- initialize string storage

   subroutine clear_str

   include MEM_COMMON
   include VCG_COMMON

   spointer strsave

   Nexts = 1

   return
   end



# clear_tree --- initialize tree-storage memory

   subroutine clear_tree

   include MEM_COMMON

   Nextt = 1

   return
   end



# ifree --- deallocate space assigned to an instruction node

   subroutine ifree (node)
   ipointer node

   # does nothing in present implementation

   return
   end



# tfree --- deallocate space assigned to a tree node

   subroutine tfree (node)
   tpointer node

   # does nothing in present implementation

   return
   end



# strsave --- save character string in string memory, return its location

   spointer function strsave (str)
   character str (ARB)

   include MEM_COMMON
   include VCG_COMMON

   integer len
   integer length

   len = length (str)
   if (Nexts + len + 1 > MAX_STR_MEMORY)
      call panic ("out of string storage memory*n"p)
   call scopy (str, 1, Smem, Nexts)
   strsave = Nexts
   Nexts += len + 1

   return
   end



# clear_obj --- initialize object/address-descriptor storage

   subroutine clear_obj

   include MEM_COMMON

   integer i

   for (i = 1; i <= OBJ_HASH_TAB_SIZE; i += 1)
      Omem (i) = 0

   Ofree = 0
   Onext = OBJ_HASH_TAB_SIZE + 1

   return
   end



# enter_obj --- associate object id and address descriptor

   subroutine enter_obj (obj, ad)
   integer obj, ad (ADDR_DESC_SIZE)

   include MEM_COMMON

   opointer loc, pred

   integer i
   integer locate_obj

DB call print (ERROUT, "enter_obj: obj id = *i*n"p, obj)
   if (locate_obj (obj, loc, pred) == NO) {

      if (Ofree ~= 0) {    # pull a node off the free list
         loc = Ofree
         Ofree = Omem (Ofree)
         }
      else {               # allocate more space in Omem
         if (Onext + 2 + ADDR_DESC_SIZE > MAX_OBJ_MEMORY)
            call panic ("enter_obj: out of space*nincrease MAX_OBJ_MEMORY in vcg_def.i*n"p)
         loc = Onext
         Onext += 2 + ADDR_DESC_SIZE
         }

      Omem (loc) = 0          # set link-to-next-object field
      Omem (loc + 1) = obj    # set object id field
      Omem (pred) = loc       # link in the new node
      }

DB call print (ERROUT, "     set to copy*n"s)
   for ({loc += 2; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; loc += 1})
      Omem (loc) = ad (i)
DB call print (ERROUT, "      copy complete*n"s)

   return
   end



# locate_obj --- find place for object in appropriate hash list

   integer function locate_obj (obj, loc, pred)
   integer obj
   opointer loc, pred

   include MEM_COMMON

DB call print (ERROUT, "locate_obj: obj id = *i*n"p, obj)
   pred = mod (iabs (obj), OBJ_HASH_TAB_SIZE) + 1
   loc = Omem (pred)

   while (loc ~= 0 && Omem (loc + 1) ~= obj) {
      pred = loc
      loc = Omem (loc)
      }

DB call print (ERROUT, "     locate_obj returns*n"p)
   if (loc == 0)
      return (NO)
   else
      return (YES)

   end



# lookup_obj --- get address descriptor associated with object, if possible

   integer function lookup_obj (obj, ad)
   integer obj, ad (ADDR_DESC_SIZE)

   include MEM_COMMON

   integer i
   integer locate_obj

   opointer loc, pred

DB call print (ERROUT, "lookup_obj: obj id = *i*n"p, obj)
   if (locate_obj (obj, loc, pred) == NO)
      return (NO)
   else {
DB call print (ERROUT, "   object found*n"p)
      for ({loc += 2; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; loc += 1})
         ad (i) = Omem (loc)
DB call print (ERROUT, "   address copied*n"p)
      return (YES)
      }

   end



# delete_obj --- remove association between object and address descriptor

   subroutine delete_obj (obj)
   integer obj

   include MEM_COMMON

   integer locate_obj

   opointer loc, pred

DB call print (ERROUT, "delete_obj: obj id = *i*n"p, obj)
   if (locate_obj (obj, loc, pred) == YES) {
      Omem (pred) = Omem (loc)         # unlink node from hash chain
      Omem (loc) = Ofree               # link onto freelist
      Ofree = loc
      }

   return
   end




undefine (MEM_COMMON)
undefine (UTOL)
undefine (OBJ_HASH_TAB_SIZE)
undefine (locate_obj)
undefine (DB)
