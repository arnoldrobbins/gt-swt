#########################################################################
#                                                                       #
#                  Mode Table Management Routines                       #
#                                                                       #
#########################################################################
#
#
#   Each mode appears only once in the mode table.  The structure of
#   any given mode can be determined by following the PARENT pointers
#   starting with the mode table pointer.
#
#  All modes other than 'struct' or 'union':
#
#   **************************
#   * PARENT pointer         *--->
#   *                        *
#   **************************
#   * SIBLING pointer        *--->
#   *                        *
#   **************************
#   * CHILD pointer          *--->
#   *                        *
#   **************************
#   * Mode type              *
#   *                        *
#   **************************
#   * Mode length            *
#   *                        *
#   **************************
#   * Mode is lvalue flag    *
#   *                        *
#   **************************
#   *                        *
#   *                        *
#   **************************
#
#
# 'Struct' and 'union' modes:
#
#                                      Sm_tbl
#   **************************         **************************
#   * PARENT pointer         *--->     * Identifier type        *
#   *    (always LAMBDA)     *         *                        *
#   **************************         **************************
#   * SIBLING pointer        *--->     * Struct member pointer  *------|
#   *                        *         *                        *      |
#   **************************         **************************      |
#   * CHILD pointer          *--->     * Struct member text     *      |
#   *                        *         *                        *      |
#   **************************         **************************      |
#   * Mode type              *                                         |
#   *                        *                                         |
#   **************************   ----->**************************      |
#   * Mode length            *   |     * SIBLING pointer        *---|  |
#   *                        *   |     *                        *   V  |
#   **************************   |     **************************      |
#   * Mode is lvalue flag    *   |     * Symbol table pointer   *----->|
#   *                        *   |     *                        *      |
#   **************************   |     **************************      |
#   * Structure member list  *---|     * Offset in struct       *      |
#   *                        *         *                        *      |
#   **************************         **************************      |
#                                                                      V
#
# align_mode --- increment storage offset to align boundary for mode

   subroutine align_mode (mode, curloc)
   pointer mode
   longint curloc

   include "c1_com.r.i"

   longint t
   longint get_long

   if (MODETYPE (mode) ~= FIELD_MODE) {
      t = (curloc + 15) / 16
      curloc = t * 16
      }
   else if (get_long (MODELEN (mode)) > 16) {
      t = mod (curloc, 16)
      if (t + get_long (MODELEN (mode)) > 32) {
         t = (curloc + 15) / 16
         curloc = t * 16
         }
      }

   DBG (27, call print (ERROUT, "in align_mode: m=*i l=*l*n"s,
   DB             mode, curloc))

   return
   end



# sizeof_mode --- calculate the size of a given node (if known)

   longint function sizeof_mode (mp)
   pointer mp

   include "c1_com.r.i"

   longint size
   longint get_long

   procedure sizeof (mode) recursive 20 forward

   size = 1
   sizeof (mp)

   DBG (26, call print (ERROUT, "in sizeof_mode: mp=*i s=*l*n"s,
   DB          mp, size))

   return (size)


   # sizeof --- compute the size of a mode recursively

      procedure sizeof (mode) recursive 20 {
      pointer mode

      select (MODETYPE (mode))
         when (DEFAULTMODE, FUNCTIONMODE, LABELMODE, TYPEDEFMODE)
            size = 0
         when (INTMODE, CHARMODE, SHORTMODE, UNSIGNEDMODE,
               SHORTUNSMODE, ENUMMODE, CHARUNSMODE)
            size *= 16
         when (LONGMODE, FLOATMODE, POINTERMODE, LONGUNSMODE)
            size *= 32
         when (DOUBLEMODE)
            size *= 64
         when (STRUCTMODE)
            size *= get_long (MODELEN (mode))
         when (UNIONMODE)
            size *= get_long (MODELEN (mode))
         when (ARRAYMODE) {
            size *= get_long (MODELEN (mode))
            sizeof (MODEPARENT (mode))
            }
         when (FIELDMODE)
            size *= get_long (MODELEN (mode))
      }

   end



# make_mode --- create a mode table entry

   integer function make_mode (t, size)
   integer t, size

   include "c1_com.r.i"

   pointer q
   pointer dsget

   q = dsget (MODESIZE)
   MODENEXT (q) = Mode_list            # Link the mode into the list
   Mode_list = q

   MODETYPE (q) = t
   call put_long (MODELEN (q), intl (size))

   MODEPARENT (q) = LAMBDA
   MODESIBLING (q) = LAMBDA
   MODECHILD (q) = LAMBDA
   MODESMLIST (q) = LAMBDA

   DBG (4, call print (ERROUT, "in makemode: t=*i ml=*i ptr=*i*n"s,
   DB      t, Modelist, q))

   return (q)
   end



# enter_sibling_mode --- create a sibling of the specified mode

   pointer function enter_sibling_mode (p, t, size)
   pointer p
   integer t, size

   include "c1_com.r.i"

   pointer q
   pointer make_mode

   q = make_mode (t, size)

   MODEPARENT (q) = MODEPARENT (p)
   MODECHILD (q) = LAMBDA

   MODESIBLING (q) = MODESIBLING (p)   # Link into the sibling list
   MODESIBLING (p) = q

   DBG (5, call print (ERROUT, "in sibling: p=*i t=*i ptr=*i*n"s,
   DB      p, t, q))

   return (q)
   end



# enter_child_mode --- create a child mode for the specified mode

   integer function enter_child_mode (p, t, size)
   pointer p
   integer t, size

   include "c1_com.r.i"

   pointer q
   pointer make_mode

   q = make_mode (t, size)

   MODEPARENT (q) = p
   MODECHILD (q) = LAMBDA

   MODESIBLING (q) = MODECHILD (p)
   MODECHILD (p) = q

   DBG (6, call print (ERROUT, "in child: p=*i t=*i ptr=*i*n"s, p, t, q))

   return (q)
   end



# find_mode --- find a specified type within the specified mode's siblings

   pointer function find_mode (p, t, size)
   pointer p
   integer t, size

   include "c1_com.r.i"

   pointer q
   longint get_long

   for (q = p; q ~= LAMBDA; q = MODESIBLING (q))
      if (MODETYPE (q) == t && get_long (MODELEN (q)) == size)
         return (q)

   return (LAMBDA)
   end



# create_mode --- create a new mode (or follow an old one) one step

   subroutine create_mode (p, t, size)
   pointer p
   integer t, size

   include "c1_com.r.i"

   pointer q
   pointer find_mode, enter_child_mode, enter_sibling_mode

   if (MODECHILD (p) == LAMBDA)           # There are no children
      p = enter_child_mode (p, t, size)
   else {
      q = MODECHILD (p)
      p = find_mode (q, t, size)
      if (p == LAMBDA)
         p = enter_sibling_mode (q, t, size)
      }

   DBG (7, call dumpmode)

   return
   end



# compare_mode --- return YES of two modes are equivalent

   integer function compare_mode (m1, m2)
   pointer m1, m2

   include "c1_com.r.i"

   longint get_long

   procedure cmp (mp1, mp2) recursive 20 forward

   cmp (m1, m2)

   return (NO)

   # cmp --- compare two modes recursively

      procedure cmp (mp1, mp2) recursive 20 {
      pointer mp1, mp2

      DBG (28, call print (ERROUT, "in compare_mode/cmp: *i *i*n"s, mp1, mp2))

      select
         when (mp1 == mp2)
            return (YES)
         when (mp1 == LAMBDA || mp2 == LAMBDA)
            return (NO)
         when (MODETYPE (mp1) ~= MODETYPE (mp2))
            return (NO)
         when (MODETYPE (mp1) == ENUM_MODE)     # all enums are equivalent
            return (YES)
         when ((MODETYPE (mp1) == ARRAY_MODE
             || MODETYPE (mp1) == STRUCT_MODE
             || MODETYPE (mp1) == UNION_MODE)
             && get_long (MODELEN (mp1)) ~= get_long (MODELEN (mp2)))
            return (NO)
      else
         cmp (MODEPARENT (mp1), MODEPARENT (mp2))

      }

   end



# save_mode --- squirrel away a mode type and length

   subroutine save_mode (mt, sz)
   integer mt, sz

   include "c1_com.r.i"

   if (Mode_save_ct > MAXMODESAVE)
      FATAL ("Modes nested too deeply"p)

   Mode_save_type (Mode_save_ct) = mt
   Mode_save_len (Mode_save_ct) = sz
   Mode_save_ct += 1

   return
   end



# create_saved_mode --- using the saved modes, create a new mode

   subroutine create_saved_mode (mp)
   pointer mp

   include "c1_com.r.i"

   integer i

   for (i = Mode_save_ct - 1; i > 0; i -= 1)
      call create_mode (mp, Mode_save_type (i), Mode_save_len (i))

   Mode_save_ct = 1

   return
   end



# modify_param_mode --- change mode to one suitable as a parameter

   subroutine modify_param_mode (mp)
   pointer mp

   include "c1_com.r.i"

   select (MODETYPE (mp))
      when (ARRAY_MODE) {
         mp = MODEPARENT (mp)
         call create_mode (mp, POINTER_MODE, 0)
         }
      when (CHAR_MODE)
         mp = Int_mode_ptr
      when (FLOAT_MODE)
         mp = Double_mode_ptr

   return
   end
