# vcg_frames --- link and stack frame management module for code generator



define(MAX_LOCAL_OBJECTS,100)    # objects active at any given time
define(FIRST_STACK,34)           # offset of first free word in frame
define(FIRST_LINK,:400)          # offset of first free word in link frame
define(MAX_STACK_OFFSET,65535)   # maximum stack frame size
define(MAX_LINK_OFFSET,65535)    # maximum link frame size
define(IN_USE,0)                 # indicating an object "in use"
define(AVAILABLE,1)              # indicating an object "available"

define(FRAMES_COMMON,"vcg_frames_com.r.i")

define(UTOL(u),rt(intl(u),16))   # convert unsigned to long



# clear_stack --- initialize internal stack frame description

   subroutine clear_stack

   include FRAMES_COMMON

   Obs = 0
   Fsize = FIRST_STACK

   return
   end



# clear_link --- initialize internal link frame description

   subroutine clear_link

   include FRAMES_COMMON

   Next_link = FIRST_LINK

   return
   end



# rsv_stack --- allocate space in stack frame for an object

   unsigned function rsv_stack (size)
   unsigned size

   include FRAMES_COMMON

   integer i, j

   unsigned offset

   offset = FIRST_STACK
   for (i = 1; i <= Obs; i += 1) {     # search for free space
      if (Obstat (i) == AVAILABLE)
         if (Obsize (i) == size) {     # exact fit?
            Obstat (i) = IN_USE
            return (offset)
            }
         else if (UTOL (Obsize (i)) > UTOL (size)) {  # room left over?
            for (j = Obs + 1; j > i; j -= 1) {     # shuffle others up
               Obsize (j) = Obsize (j - 1)
               Obstat (j) = Obstat (j - 1)
               }
            Obs += 1                   # create new block,
            Obstat (i) = IN_USE
            Obsize (i) = size
            Obsize (i + 1) -= size     # reduce size of old block
            return (offset)
            }
      offset += Obsize (i)
      }

   # upon reaching this point, we must add to the stack frame size.
   if (Obs ~= 0 && Obstat (Obs) == AVAILABLE) {    # add to last object
      offset -= Obsize (Obs)           # back up to last object
      Fsize += size - Obsize (Obs)     # stretch top of frame to make room
      Obsize (Obs) = size
      Obstat (Obs) = IN_USE
      return (offset)
      }

   # upon reaching this point, we must add a new object to the frame
   if (Obs >= MAX_LOCAL_OBJECTS) {
      call warning ("too many objects allocated in stack frame*n"p)
      return (0)
      }

   if (UTOL (offset) + UTOL (size) > MAX_STACK_OFFSET) {
      call warning ("stack frame too small to meet storage request*n"p)
      return (0)
      }

   Obs += 1
   Fsize += size
   Obsize (Obs) = size
   Obstat (Obs) = IN_USE
   return (offset)

   end



# rsv_link --- return offset to link frame object of given size

   unsigned function rsv_link (size)
   unsigned size

   include FRAMES_COMMON

   if (UTOL (Next_link) + UTOL (size) > MAX_LINK_OFFSET) {
      call warning ("link frame too small to meet storage request*n"p)
      return (0)
      }

   rsv_link = Next_link
   Next_link += size

   return
   end



# stack_size --- return total space required for stack frame

   unsigned function stack_size (size)
   unsigned size

   include FRAMES_COMMON

   size = Fsize
   return (Fsize)

   end



# link_size --- return total space required for link frame

   unsigned function link_size (size)
   unsigned size

   include FRAMES_COMMON

   size = Next_link - FIRST_LINK

   return (size)
   end



# free_stack --- free storage allocated to object in stack frame

   subroutine free_stack (obj)
   unsigned obj

   include FRAMES_COMMON

   integer i, j

   unsigned offset

   offset = FIRST_STACK
   for (i = 1; i <= Obs; i += 1) {
      if (offset == obj) {       # found the block of mem being freed
         Obstat (i) = AVAILABLE

         # merge with block above, if it is not in use:
         if (i < Obs && Obstat (i + 1) == AVAILABLE) {
            Obsize (i) += Obsize (i + 1)
            for (j = i + 1; j < Obs; j += 1) {
               Obsize (j) = Obsize (j + 1)
               Obstat (j) = Obstat (j + 1)
               }
            Obs -= 1
            }

         # merge with block below, if it is not in use:
         if (i > 1 && Obstat (i - 1) == AVAILABLE) {
            Obsize (i - 1) += Obsize (i)
            for (j = i; j < Obs; j += 1) {
               Obsize (j) = Obsize (j + 1)
               Obstat (j) = Obstat (j + 1)
               }
            Obs -= 1
            }

         return   # no need to do anything else
         }

      offset += Obsize (i)
      }  # for

   call warning ("attempt to free bogus local object at *,-10i*n"p, obj)
   return
   end



# alloc_temp --- return address descriptor referring to new temporary

   subroutine alloc_temp (size, ad)
   unsigned size
   integer ad (ADDR_DESC_SIZE)

   unsigned rsv_stack

   AD_MODE (ad) = DIRECT_AM
   AD_BASE (ad) = SB_REG
   AD_OFFSET (ad) = rsv_stack (size)
   AD_RESOLVED (ad) = YES

   return
   end



# free_temp --- deallocate temporary referred to by address descriptor

   subroutine free_temp (ad)
   integer ad (ADDR_DESC_SIZE)

   call free_stack (AD_OFFSET (ad))

   return
   end


undefine(MAX_LOCAL_OBJECTS)
undefine(FIRST_STACK)
undefine(FIRST_LINK)
undefine(MAX_STACK_OFFSET)
undefine(MAX_LINK_OFFSET)
undefine(IN_USE)
undefine(AVAILABLE)
undefine(FRAMES_COMMON)
undefine(UTOL)
