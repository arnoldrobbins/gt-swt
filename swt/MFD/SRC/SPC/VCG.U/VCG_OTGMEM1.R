# otg_mem --- otg memory management routines for literal & label storage
#             hacked directly from the vcg memory management routines
#

include OTG_DEFS

define(DB,#)

define (LIT_COMMON,"otg_lit_com.r.i")
define (LIT_HASH_TAB_SIZE,43)
define (locate_lit,lit$01)

#             Literal table nodes look like this:
#   _____________       ________________
#   | hash slot | ==>   |    ===>      | pointer to next node
#   -------------       +--------------+
#                       |  AD_MODE     |
#                       |  AD_LIT1     |
#                       |  AD_LIT2     |  literal descriptor
#                       |  AD_LIT3     |
#                       |  AD_LIT4     |
#                       +--------------+
#                       |  AD_MODE     |
#                       |  AD_BASE     |
#                       |  AD_OFFSET   | address descriptor
#                       |  AD_RESOLVED |
#                       |              |
#                       ----------------
#

# clear_lit --- initialize literal/address-descriptor storage

   subroutine clear_lit

   include LIT_COMMON

   integer i

   for (i = 1; i <= LIT_HASH_TAB_SIZE; i += 1)
      Lmem (i) = 0

   Lfree = 0
   Lnext = LIT_HASH_TAB_SIZE + 1

   return
   end



# enter_lit --- associate literal description and address descriptor
#
#               'lit' is an address descriptor with AD_MODE = LITERAL_AM
#               (actually, it is a data descriptor, but so what?)
#               while 'ad' is an address descriptor telling where the
#               literal is stashed.

   subroutine enter_lit (lit, ad)
   integer lit (ADDR_DESC_SIZE), ad (ADDR_DESC_SIZE)

   include LIT_COMMON

   lpointer ptr, pred

   integer i, j, locate_lit

DB call print (ERROUT, "enter_lit*n"p)
   if (locate_lit (lit, ptr, pred) == NO) {
      # should never try to enter it if it's there already

      if (Lfree ~= 0) {    # pull a node off the free list
         ptr = Lfree
         Lfree = Lmem (Lfree)
         }
      else {               # allocate more space in Lmem
         if (Lnext + 1 + 2 * ADDR_DESC_SIZE > MAX_LIT_MEMORY)
            call panic ("enter_lit: out of space*nincrease MAX_LIT_MEMORY in otg_def.r.i*n"p)
         ptr = Lnext
         Lnext += 1 + 2 * ADDR_DESC_SIZE
         }

      Lmem (ptr) = 0          # set link-to-next-literal field
      Lmem (pred) = ptr       # link in the new node
                              # copy literal descriptor
      for ({j = ptr + 1; i = 1}; i <= ADDR_DESC_SIZE; {i+=1; j +=1})
         {
DB       call print (ERROUT, "      lit (*i) = *i*n"s, i, lit (i))
         Lmem (j) = lit (i)
         }
      }

   # copy the literal's address descriptor
   for ({j = ptr + ADDR_DESC_SIZE + 1; i = 1}; i <= ADDR_DESC_SIZE;
                                                      {i += 1; j += 1})
      {
DB    call print (ERROUT, "      ad (*i) = *i*n"s, i, ad (i))
      Lmem (j) = ad (i)
      }

   return
   end



# locate_lit --- find place for literal in appropriate hash list
#
#                'lit' is the literal descriptor:  unused fields
#                should be zeroed so we get decent comparisons

   integer function locate_lit (lit, ptr, pred)
   integer lit (ADDR_DESC_SIZE)
   lpointer ptr, pred

   include LIT_COMMON

   integer hash

DB call print (ERROUT, "locate_lit*n"p)
   # cheap hash - AD_LIT1 is guaranteed to always be there
   # we add AD_LIT2 to help hashing small long ints
   hash = AD_LIT1 (lit) + AD_LIT2 (lit)
   pred = mod (iabs (hash), LIT_HASH_TAB_SIZE) + 1
DB call print (ERROUT, "   hash = *i, lit1 = *i, lit2 = *i*n"s,
DB    pred, AD_LIT1 (lit), AD_LIT2 (lit))
   ptr = Lmem (pred)

   # search the hash list for the right entry
   while (ptr ~= 0)
      {
DB    call print (ERROUT, "      ptr = *i*n"s, ptr)
      if   (Lmem (ptr + 1) ~= AD_MODE (lit)
         || Lmem (ptr + 2) ~= AD_LIT1 (lit)
         || Lmem (ptr + 3) ~= AD_LIT2 (lit)
         || Lmem (ptr + 4) ~= AD_LIT3 (lit)
         || Lmem (ptr + 5) ~= AD_LIT4 (lit))
         {
         pred = ptr
         ptr = Lmem (ptr)
         }
      else
         break             # found it
      }

   if (ptr == 0)
      return (NO)
   else
      return (YES)

   end



# lookup_lit --- get address descriptor associated with literal, if possible
#
#                'ad' describes the actual location of 'lit'

   integer function lookup_lit (lit, ad)
   integer lit (ADDR_DESC_SIZE), ad (ADDR_DESC_SIZE)

   include LIT_COMMON

   integer i, j
   integer locate_lit

   lpointer ptr, pred

DB call print (ERROUT, "lookup_lit*n"p)
   if (locate_lit (lit, ptr, pred) == NO)
      {
DB    call print (ERROUT, "   not found*n"p)
      return (NO)
      }
   else {
      # found it, now copy it over
DB    call print (ERROUT, "  found*n"p)
      for ({j = ptr +1 + ADDR_DESC_SIZE; i = 1}; i <= ADDR_DESC_SIZE;
                                                   {i += 1; j += 1})
         ad (i) = Lmem (j)
      return (YES)
      }

   end


# delete_lit --- remove association between literal and address descriptor

   subroutine delete_lit (lit)
   integer lit (ADDR_DESC_SIZE)

   include LIT_COMMON

   integer locate_lit

   lpointer ptr, pred

DB call print (ERROUT, "delete_lit*n"p)
   if (locate_lit (lit, ptr, pred) == YES) {
      Lmem (pred) = Lmem (ptr)        # unlink node from hash chain
      Lmem (ptr) = Lfree              # link onto freelist
      Lfree = ptr
      }

   return
   end


# resolve_lit --- get the next unresolved literal from the literal table
#
#                 If there is an unresolved literal left in the table
#                 return YES, the literal descriptor, and its address
#                 descriptor.

   integer function resolve_lit (lit, ad)
   integer lit (ADDR_DESC_SIZE), ad (ADDR_DESC_SIZE)

   include LIT_COMMON

   integer i, j, ptr

DB call print (ERROUT, "resolve_lit*n"p)
   for (j = 1; j <= LIT_HASH_TAB_SIZE; j += 1)
      {
      ptr = Lmem (j)
      while (ptr ~= 0 && Lmem (ptr + 9) == YES) # check AD_RESOLVED
         ptr = Lmem (ptr)

      if (ptr ~= 0)
         # found one, now copy it over
         {
         Lmem (ptr + 9) = YES                   # set AD_RESOLVED
         for ({ptr += 1; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; ptr += 1})
            lit (i) = Lmem (ptr)
         for (i = 1; i <= ADDR_DESC_SIZE; {i += 1; ptr += 1})
            ad (i) = Lmem (ptr)
         return (YES)
         }
      }

   return (NO)
   end



# get_lit_addr --- get address info for a literal

   subroutine get_lit_addr (lit_desc, addr, fwd_ref, reach)
   integer lit_desc (ADDR_DESC_SIZE), addr (ADDR_DESC_SIZE), reach
   bool fwd_ref

   include OTG_COMMON

   integer lad (ADDR_DESC_SIZE)

DB call print (ERROUT, "get_lit_addr*n"p)
   fwd_ref = FALSE

   # literal never seen before
   if (lookup_lit (lit_desc, lad) == NO)
      {
DB    call print (ERROUT, "   new literal*n"s)
      AD_MODE (lad) = DIRECT_AM
      AD_BASE (lad) = PB_REG
      AD_OFFSET (lad) = PB_here        # addr of 1-wd mr instr
      if (reach == LONG)
         AD_OFFSET (lad) += 1          # addr of 2-wd mr instr offset
#
#     Here's where we force a mr instr referencing a literal
#     to be short if necessary
#
      AD_RESOLVED (lad) = NO

      AD_OFFSET (addr) = 0       # end of fwd ref chain
      fwd_ref = TRUE             # somebody else fixes this up so
                                 # the loader knows when to stop

      call enter_lit (lit_desc, lad)
      }

   # literal referenced before but not defined
   else if (AD_RESOLVED (lad) == NO)
      {
DB    call print (ERROUT, "   old literal, fwd ref*n"s)
      call delete_lit (lit_desc)
      AD_OFFSET (addr) = AD_OFFSET (lad)
      AD_OFFSET (lad) = PB_here        # addr of 1-wd mr instr
      if (reach == LONG)
         AD_OFFSET (lad) += 1          # addr of 2-wd mr instr offset
#
#     Here's where we force a mr instr referencing a literal
#     to be short if necessary
#
      fwd_ref = TRUE

      call enter_lit (lit_desc, lad)
      }

   # just an ordinary reference to a defined literal
   else
      {
DB    call print (ERROUT, "   defined literal*n"s)
      AD_OFFSET (addr) = AD_OFFSET (lad)
      }

   AD_BASE (addr) = PB_REG           # always
   AD_MODE (addr) = DIRECT_AM

   return
   end


undefine (LIT_COMMON)
undefine (LIT_HASH_TAB_SIZE)
undefine (locate_lit)



define (EXT_COMMON,"otg_ext_com.r.i")
define (locate_ext,ext$01)
define (EXT_HASH_TAB_SIZE,29)

# external name table management routines
#
# The name table node looks like this:
#
#   _____________       ________________
#   | hash slot | ==>   |    ===>      | pointer to next node
#   -------------       +--------------+
#                       |     n        |
#                       |     a        |
#                       |     m        | name
#                       |     e        |
#                       |    EOS       |
#                       |              |
#                       |              |
#                       +--------------+
#                       |  AD_MODE     |
#                       |  AD_BASE     |
#                       |  AD_OFFSET   | address descriptor
#                       |  AD_RESOLVED |
#                       |              |
#                       ----------------

# clear_ext --- clear the external name table

   subroutine clear_ext

   include EXT_COMMON

   integer i

   for (i = 1; i <= EXT_HASH_TAB_SIZE; i +=1)
      Nmem (i) = 0

   Nfree = 0
   Nnext = EXT_HASH_TAB_SIZE + 1

   return
   end


# enter_ext --- enter a name and its addr desc into external name table
#
#               'name' is the address of the 1st char of an EOS -
#               terminated string.... we assume that it's only
#               PMA_NAME_LEN characters long like a good PMA name

   subroutine enter_ext (name, addr)
   character name (ARB)
   integer addr (ARB)


   include EXT_COMMON

   integer i, j, locate_ext, pred, ptr, length, len

DB call print (ERROUT, "enter_ext: EXT *s*n"p, name)
   if (locate_ext (name, ptr, pred) == NO)
      {

      if (Nfree ~= 0)      # get a node from free list
         {
         ptr = Nfree
         Nfree = Nmem (Nfree)
         }
      else
         {
         if (Nnext + 1 + PMA_NAME_LEN + ADDR_DESC_SIZE > MAX_EXT_MEMORY)
            call panic ("enter_ext: out of space*nincrease MAX_EXT_MEMORY in otg_def.r.i*n"p)

         ptr = Nnext
         Nnext += 1 + PMA_NAME_LEN + ADDR_DESC_SIZE
         }

      len = length (name) + 1
      for ({j = ptr + 1; i = 1}; i <= len; {i += 1; j += 1})
         {
         Nmem (j) = name (i)
         }
      for ({j = ptr + 1 + PMA_NAME_LEN;i = 1}; i <= ADDR_DESC_SIZE; {i += 1; j += 1})
         Nmem (j) = addr (i)

      Nmem (ptr) = 0
      Nmem (pred) = ptr
      }

   return
   end



# delete_ext --- remove external name & its address descriptor

   subroutine delete_ext (name)
   integer name (ARB)

   include EXT_COMMON

   integer locate_ext

   lpointer ptr, pred

DB call print (ERROUT, "delete_ext: EXT *s*n"p, name)
   if (locate_ext (name, ptr, pred) == YES) {
      Nmem (pred) = Nmem (ptr)        # unlink node from hash chain
      Nmem (ptr) = Nfree              # link onto freelist
      Nfree = ptr
      }

   return
   end


# locate_ext --- find a name in the external name table

   integer function locate_ext (name, ptr, pred)
   character name (ARB)
   integer pred, ptr

   include EXT_COMMON

   integer i, hash, mod, strcmp
DB character search (PMA_NAME_LEN)

DB call print (ERROUT, "locate_ext: EXT *s*n"p, name)
   hash = 0
   for (i = 1; name (i) ~= EOS; i += 1)
      hash = mod ((hash + name (i)), EXT_HASH_TAB_SIZE) + 1

   pred = hash
   ptr = Nmem (hash)

   while (ptr ~= 0)
      {
DB    for (i = 1; Nmem (ptr + i) ~= EOS; i += 1)
DB       search (i) = Nmem (ptr + i)
DB    search (i) = EOS

DB    call print (ERROUT, "   search = *s*n"s, search)
      if (strcmp (name, Nmem (ptr + 1)) ~= 2)
         {
DB       call print (ERROUT, "   trying next one*n"s)
         pred = ptr
         ptr = Nmem (ptr)
         }
      else
         break
      }

   if (ptr == 0)
      return (NO)
   else
      return (YES)

   end


# lookup_ext --- look up an external name and return its address desc

   integer function lookup_ext (name, ad)
   character name (ARB)
   integer ad (ADDR_DESC_SIZE)

   include EXT_COMMON

   integer locate_ext, pred, ptr, length, i

DB call print (ERROUT, "lookup_ext: EXT *s*n"p, name)
   if (locate_ext (name, ptr, pred) == NO)
      return (NO)
   else
      {
      for ({ptr += 1 + PMA_NAME_LEN;i = 1}; i <= ADDR_DESC_SIZE;
                                                   {i += 1; ptr += 1})
         ad (i) = Nmem (ptr)
      return (YES)
      }

   end

# resolve_ext --- get the next unresolved external name & its addr desc
#
#                 If there is an unresolved external left in the table
#                 return YES, the external name, and its address descriptor.

   integer function resolve_ext (name, addr)
   integer name (ARB), addr (ADDR_DESC_SIZE)

   include EXT_COMMON

   integer i, j, ptr

DB call print (ERROUT, "resolve_ext:*n"p)
   for (j = 1; j <= EXT_HASH_TAB_SIZE; j += 1)
      {
      ptr = Nmem (j)
      while (ptr ~= 0 && Nmem (ptr + 1 + PMA_NAME_LEN + 3) == YES) # check AD_RESOLVED
         ptr = Nmem (ptr)

      if (ptr ~= 0)
         # found one, now copy it over
         {
         for ({i = 1;j = ptr + 1};i <= PMA_NAME_LEN;{i += 1; j += 1})
            name (i) = Nmem (j)
DB       call print (ERROUT, "   EXT *s*n"p, name)
         ptr += 1 + PMA_NAME_LEN
         Nmem (ptr + 3) = YES                     # set resolved flag
         for (i = 1; i <= ADDR_DESC_SIZE; {i += 1; ptr += 1})
            addr (i) = Nmem (ptr)
         return (YES)
         }
      }

   return (NO)
   end


# get_ext_addr --- get address info for an external name

   subroutine get_ext_addr (name, addr, fwd_ref)
   integer name (ARB), addr (ADDR_DESC_SIZE)
   bool fwd_ref

   include OTG_COMMON

   integer ad (ADDR_DESC_SIZE)

DB call print (ERROUT, "get_ext_addr: EXT *s*n"p, name)
   fwd_ref = FALSE

   # external never seen before
   if (lookup_ext (name, ad) == NO)
      {
      AD_MODE (ad) = INDIRECT_AM
      AD_BASE (ad) = LB_REG
      AD_OFFSET (ad) = PB_here   # points to last referencing instr
      AD_RESOLVED (ad) = NO

      AD_OFFSET (addr) = 0       # end of fwd ref chain
      fwd_ref = TRUE

      call enter_ext (name, ad)
      }

   # external referenced before but not defined
   else if (AD_RESOLVED (ad) == NO)
      {
      call delete_ext (name)
      AD_OFFSET (addr) = AD_OFFSET (ad)
      AD_OFFSET (ad) = PB_here       # stick onto fwd-ref chain
      fwd_ref = TRUE

      call enter_ext (name, ad)
      }

   # just an ordinary reference to a defined literal
   else
      AD_OFFSET (addr) = AD_OFFSET (ad)

   AD_BASE (addr) = LB_REG           # always
   AD_MODE (addr) = INDIRECT_AM

   return
   end



undefine (lookup_ext)
undefine (EXT_COMMON)
undefine (EXT_HASH_TAB_SIZE)



define (ENT_COMMON,"otg_ent_com.r.i")
define (locate_ent,ent$01)

# entry point name table management routines
#
# The name table node looks like this:
#
#   ________       ________________
#   | root | ==>   |    ===>      | pointer to next node
#   --------       +--------------+
#                  |     n        |
#                  |     a        |
#                  |     m        | name
#                  |     e        |
#                  |    EOS       |
#                  |              |
#                  |              |
#                  +--------------+
#                  |  obj_id      |
#                  ----------------

# clear_ent --- clear the entry point name table

   subroutine clear_ent

   include ENT_COMMON

   Emem (1) = 0
   Enext = 2

   return
   end


# enter_ent --- put an entry point name and its object id into the ent table
#
#               'name' is the address of the 1st char of an EOS -
#               terminated string.... we assume that it's only
#               PMA_NAME_LEN characters long like a good PMA name.
#               Names are entered on a linear list so we can get
#               them back in the order they were seen.

   subroutine enter_ent (name, obj_id)
   character name (ARB)
   integer obj_id

   include ENT_COMMON

   integer i, j, locate_ent, pred, ptr, length, len

DB call print (ERROUT, "enter_ent: ENT *s*n"p, name)
   if (locate_ent (name, pred) == NO)
      {
DB    call print (ERROUT, "   pred = *i*n"p, pred)
      if (Enext + 1 + PMA_NAME_LEN + 1 > MAX_ENT_MEMORY)
         call panic ("enter_ent: out of space*nincrease MAX_ENT_MEMORY in otg_def.r.i*n"p)

      ptr = Enext
DB    call print (ERROUT, "   ptr = *i*n"p, ptr)
      Enext += 1 + PMA_NAME_LEN + 1

      len = length (name) + 1
      for ({j = ptr + 1; i = 1}; i <= len; {i += 1; j += 1})
         Emem (j) = name (i)
      Emem (ptr + 1 + PMA_NAME_LEN) = obj_id

      Emem (ptr) = 0
      Emem (pred) = ptr
      }

   return
   end


# locate_ent --- find a name in the entry point name table

   integer function locate_ent (name, pred)
   character name (ARB)
   integer pred

   include ENT_COMMON

   integer strcmp, ptr, i
DB character search (PMA_NAME_LEN)

DB call print (ERROUT, "locate_ent: ENT *s*n"p, name)
   pred = 1
   ptr = Emem (1)

   while (ptr ~= 0)
      {
DB    for (i = 1; Emem (ptr + i) ~= EOS; i +=1)
DB       search (i) = Emem (ptr + i)
DB    search (i) = EOS
DB    call print (ERROUT, "   search = *s*n"p, search)

      if (strcmp (name, Emem (ptr + 1)) ~= 2)
         {
DB       call print (ERROUT, "   trying next name *n"s)
         pred = ptr
         ptr = Emem (ptr)
         }
      else
         break
      }

   if (ptr == 0)
      {
DB    call print (ERROUT, "   not found*n"s)
      return (NO)
      }
   else
      return (YES)

   end


undefine(DB)
