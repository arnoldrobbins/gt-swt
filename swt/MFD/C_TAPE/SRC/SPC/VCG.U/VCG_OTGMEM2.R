# otg_mem2 --- otg memory management routines for literal & label storage
#             hacked directly from the vcg memory management routines
#
#     This has been split into 2 parts because so many symbols
#     cause 'rp' to barf on insufficient dynamic memory (it only
#     has 32K of dynamic space). Any extra routines should be
#     placed in a seperate file.

include OTG_DEFS

define(DB,#)

define (ENT_COMMON,"otg_ent_com.r.i")
define (locate_ent,ent$01)


# resolve_ent --- get the next entry point name and its obj id
#
#                 If there is an entry point name left in the table
#                 return YES, the name, and its id number
#                 Automatically deletes the name.

   integer function resolve_ent (name, base, offset)
   integer name (ARB), base, offset

   include ENT_COMMON

   integer ptr, i, j, obj_id, lookup_lab, ad (ADDR_DESC_SIZE)

DB call print (ERROUT, "resolve_ent:*n"p)

   ptr = Emem (1)
DB call print (ERROUT, "   ptr = *i*n"s, ptr)
   if (ptr ~= 0)
      {
      # found one, now copy it over
      for ({i = 1; j = ptr + 1};i <= PMA_NAME_LEN; {i += 1; j += 1})
         name (i) = Emem (j)
DB    call print (ERROUT, "   ENT *s*n"p, name)

      obj_id = Emem (ptr + 1 + PMA_NAME_LEN)
      if (lookup_lab (obj_id, ad) == NO)
         call panic ("resolve_ent: obj *i not found*n"p, obj_id)
      base = AD_BASE (ad)
      offset = AD_OFFSET (ad)

      Emem (1) = Emem (ptr)               # chop it off the list
      return (YES)
      }

DB call print (ERROUT, "   not found*n"s)
   return (NO)
   end

undefine (ENT_COMMON)
undefine (lookup_ent)

define (LAB_HASH_TAB_SIZE,43)      # must be prime
define (LAB_COMMON,"otg_lab_com.r.i")
define (locate_lab,lab$01)         # routine is local to module

# label (object) memory management routines
#
# The object node looks look like this:
#   _____________       ________________
#   | hash slot | ==>   |    ===>      | pointer to next node
#   -------------       +--------------+
#                       |  obj_id      |
#                       +--------------+
#                       |  AD_MODE     |
#                       |  AD_BASE     |
#                       |  AD_OFFSET   | address descriptor
#                       |  AD_RESOLVED |
#                       |              |
#                       ----------------
#


# clear_lab --- initialize label/address-descriptor storage

   subroutine clear_lab

   include LAB_COMMON

   integer i

   for (i = 1; i <= LAB_HASH_TAB_SIZE; i += 1)
      Lbmem (i) = 0

   Lbfree = 0
   Lbnext = LAB_HASH_TAB_SIZE + 1

   return
   end



# enter_lab --- associate label id and address descriptor

   subroutine enter_lab (lab, ad)
   integer lab, ad (ADDR_DESC_SIZE)

   include LAB_COMMON

   integer loc, pred

   integer i
   integer locate_lab

DB call print (ERROUT, "enter_lab: lab id = *i*n"p, lab)
   if (locate_lab (lab, loc, pred) == NO) {

      if (Lbfree ~= 0) {    # pull a node off the free list
         loc = Lbfree
         Lbfree = Lbmem (Lbfree)
         }
      else {               # allocate more space in Lbmem
         if (Lbnext + 2 + ADDR_DESC_SIZE > MAX_LAB_MEMORY)
            call panic ("enter_lab: out of space*nincrease MAX_LAB_MEMORY in vcg_def.i*n"p)
         loc = Lbnext
         Lbnext += 2 + ADDR_DESC_SIZE
         }

      Lbmem (loc) = 0         # set link-to-next-label field
      Lbmem (loc + 1) = lab   # set label id field
      Lbmem (pred) = loc      # link in the new node
      }

   # copy address descriptor
   for ({loc += 2; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; loc += 1})
      Lbmem (loc) = ad (i)

   return
   end



# locate_lab --- find place for label in appropriate hash list

   integer function locate_lab (lab, loc, pred)
   integer lab
   integer loc, pred

   include LAB_COMMON

DB call print (ERROUT, "locate_lab: lab id = *i*n"p, lab)
   pred = mod (iabs (lab), LAB_HASH_TAB_SIZE) + 1
   loc = Lbmem (pred)

   while (loc ~= 0 && Lbmem (loc + 1) ~= lab) {
      pred = loc
      loc = Lbmem (loc)
      }

DB call print (ERROUT, "     locate_lab returns"p)
   if (loc == 0)
      {
DB    call print (ERROUT, " NO*n"p)
      return (NO)
      }
   else
      {
DB    call print (ERROUT, " YES*n"p)
      return (YES)
      }

   end



# lookup_lab --- get address descriptor associated with label, if possible

   integer function lookup_lab (lab, ad)
   integer lab, ad (ADDR_DESC_SIZE)

   include LAB_COMMON

   integer i
   integer locate_lab

   integer loc, pred

DB call print (ERROUT, "lookup_lab: lab id = *i*n"p, lab)
   if (locate_lab (lab, loc, pred) == NO)
      return (NO)
   else {
DB call print (ERROUT, "   label found*n"p)
      for ({loc += 2; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; loc += 1})
         ad (i) = Lbmem (loc)
DB call print (ERROUT, "   address copied*n"p)
      return (YES)
      }

   end



# delete_lab --- remove association between label and address descriptor

   subroutine delete_lab (lab)
   integer lab

   include LAB_COMMON

   integer locate_lab

   integer loc, pred

DB call print (ERROUT, "delete_lab: lab id = *i*n"p, lab)
   if (locate_lab (lab, loc, pred) == YES) {
      Lbmem (pred) = Lbmem (loc)          # unlink node from hash chain
      Lbmem (loc) = Lbfree                # link onto freelist
      Lbfree = loc
      }

   return
   end




# get_label_addr --- get address info for a label

   subroutine get_label_addr (l_desc, addr, fwd_ref, oneword)
   integer l_desc (ADDR_DESC_SIZE), addr (ADDR_DESC_SIZE), oneword
   bool fwd_ref, missin

   include OTG_COMMON

   integer lad (ADDR_DESC_SIZE), l_base, label_id, fwd_offset

   fwd_ref = FALSE

   if (missin (oneword) || oneword == NO)
      fwd_offset = 1
   else
      fwd_offset = 0
#  pointer to address that needs to be fixed up

   l_base = AD_BASE (l_desc)
   if (l_base == SB_REG || l_base == XB_REG)      # for now
      call panic ("get_label_addr: bad base reg.*n"p)

   label_id = AD_LABEL (l_desc)
DB call print (ERROUT, "get_label_addr: L*,-10i_*n"s, label_id)

   # target label is not defined yet (forward reference)
   if (lookup_lab (label_id, lad) == NO)
      {
DB    call print (ERROUT, "   new label*n"s)
      AD_MODE (lad) = DIRECT_AM
      AD_BASE (lad) = l_base

      AD_OFFSET (lad) = PB_here + fwd_offset
      # references always made from PB%; this is back-ptr to 1st ref
      # from next in chain if any

      # don't need refs from LB% (eg., IP's to labels)
      # since they are illegal right now (see otg_misc)

      AD_RESOLVED (lad) = NO
      AD_OFFSET (addr) = 0                   # end of fwd-ref chain
      fwd_ref = TRUE

      call enter_lab (label_id, lad)
      }

   # target label has been defined, but not resolved
   # current instr. is next in a chain of fwd refs to target
   else if (AD_RESOLVED (lad) == NO)
      {
DB    call print (ERROUT, "   old label, fwd. ref*n"s)
      call delete_lab (label_id)
      AD_OFFSET (addr) = AD_OFFSET (lad)    # link into backwards chain

      AD_OFFSET (lad) = PB_here + fwd_offset
      # references always made from PB%; this is back-ptr to prev ref

      fwd_ref = TRUE
      call enter_lab (label_id, lad)
      }

   # label has already been defined so we just use its address
   else
      {
DB    call print (ERROUT, "   label defined*n"s)
      AD_OFFSET (addr) = AD_OFFSET (lad)
      }

   AD_BASE (addr) = AD_BASE (lad)
   AD_MODE (addr) = AD_MODE (lad)

DB call print (ERROUT, "   label address fetched*n"s)
   return
   end

undefine (LAB_COMMON)
undefine (LAB_HASH_TAB_SIZE)
undefine (locate_lab)

undefine (DB)
