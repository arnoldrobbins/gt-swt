#########################################################################
#                                                                       #
#            Identifier Table Management Routines                       #
#                                                                       #
#########################################################################
#
#
#   Each identifier (except structure tags and members) appears in
#   the a symbol table corresponding to its scope.  The symbol entry
#   appears as follows:
#
#
# Identifiers:
#
#   **************************  ------>**************************
#   * Identifier type        *  |      * Symbol type  (SYMTYPE) *          *
#   *                        *  |      *                        *          *
#   **************************  |      **************************
#   * Symbol table pointer   *--|      * Storage class          *
#   *                        *         *                        *
#   **************************         **************************
#   * Identifier text        *         * Mode table pointer     *-->
#   *                        *         *                        *
#   **************************         **************************
#                                      * Symbol lexic level     *
#                                      *                        *
#                                      **************************
#                                      * Parameter flag         *
#                                      *                        *
#                                      **************************
#                                      * Allocation address     *
#                                      *                        *
#                                      **************************
#
#
# Structure tags and members:
#
#   **************************   ----->**************************
#   * Identifier type        *   |     * Symbol type            *
#   *                        *   |     *                        *
#   **************************   |     **************************
#   * Symbol table pointer   *---|     *                        *
#   *                        *         *                        *
#   **************************         **************************
#   * Structure tag text     *         * Mode table pointer     *--->
#   *                        *         *                        *
#   **************************         **************************
#                                      * Symbol lexic level     *
#                                      *                        *
#                                      **************************
#                                      *                        *
#                                      *                        *
#                                      **************************
#                                      *                        *
#                                      *                        *
#                                      **************************
#
#
#
#
# findsym --- find a given symbol; return symbol table pointer and YES/NO

   pointer function findsym (name, ptr, class, xll)
   character name (ARB)
   pointer ptr
   integer class, xll

   include "c1_com.r.i"

   integer any, i, ans
   integer lookup
   untyped info (IDSIZE)
   logical missin

   DBG (15, call print (ERROUT, "in findsym: '*s' *i "s, name, class))

   if (missin (xll))
      i = Ll
   else
      i = xll

   for (; i > 0; i -= 1)
      select
         when (class == IDCLASS && Id_tbl (i) ~= LAMBDA)
            ans = lookup (name, info, Id_tbl (i))
         when (class == SMCLASS && Sm_tbl (i) ~= LAMBDA)
            ans = lookup (name, info, Sm_tbl (i))
      ifany
         if (ans == YES) {
            ptr = IDPTR (info)
            DBG (15, call print (ERROUT, "ptr=*i ret=YES*n"s, ptr))
            return (YES)
            }

   DBG (15, call print (ERROUT, "ret=NO*n"s))
   return (NO)
   end




# record_sym --- record a symbol in the identifier or struct table

   subroutine recordsym (name, p, ll)
   character name (ARB)
   pointer p
   integer ll

   include "c1_com.r.i"

   pointer enter
   untyped info (IDSIZE)

   IDTYPE (info) = USERIDTYPE
   IDPTR (info) = p

   SYMLL (p) = ll

   select (SYMTYPE (p))
      when (IDSYMTYPE, ENSYMTYPE, COSYMTYPE) {
         if (Id_tbl (ll) == LAMBDA)
            Id_tbl (ll) = mktabl (IDSIZE)
         SYMTEXT (p) = enter (name, info, Id_tbl (ll))
         }
      when (STSYMTYPE, SMSYMTYPE) {
         if (Sm_tbl (ll) == LAMBDA)
            Sm_tbl (ll) = mktabl (IDSIZE)
         SYMTEXT (p) = enter (name, info, Sm_tbl (ll))
         }
   else
      call error ("in record_sym: can't happen"p)

   return
   end




# makesym --- create an identifier and enter it in the table

   pointer function makesym (name, type, ll)
   character name (ARB)
   integer type, ll

   include "c1_com.r.i"

   pointer p
   pointer dsget

   p = dsget (SYMSIZE)
   SYMTYPE (p) = type
   SYMMODE (p) = LAMBDA      # Zero out the block to save the callers
   SYMSC (p) = DEFAULT_SC
   SYMLL (p) = 0
   SYMPARAM (p) = 0
   SYMOBJ (p) = 0
   SYMTEXT (p) = LAMBDA
   SYMISDEF (p) = 0
   call put_long (SYMOFFS (p), intl (0))  # Also gets SYMPLIST
   call recordsym (name, p, ll)

   DBG (16,call print (ERROUT, "in makesym: '*s' ptr=*i*n"s, name, p))
   return (p)
   end




# enterll --- update symbol table stack for entry to a new lexic level

   subroutine enterll

   include "c1_com.r.i"

   Ll += 1
   if (Ll > MAXLL)
      FATAL ("Scopes nested too deeply"p)

   Id_tbl (Ll) = LAMBDA
   Sm_tbl (Ll) = LAMBDA

   return
   end



# exitll --- destroy symbols from the current lexic level

   subroutine exitll

   include "c1_com.r.i"

   character name (MAXTOK)
   pointer pos, q, p
   integer sctabl
   untyped info (IDSIZE)

   DBG (19, call dump_sym (Ll))
   DBG (18, call dump_mode)

   if (Id_tbl (Ll) ~= LAMBDA) {
      pos = 0
      while (sctabl (Id_tbl (Ll), name, info, pos) ~= EOF) {
         if (SYMPLIST (IDPTR (info)) ~= LAMBDA)
            for (q = SYMPLIST (IDPTR (info)); q ~= LAMBDA; q = p) {
               if (PARAMTEXT (q) ~= LAMBDA)
                  call dsfree (PARAMTEXT (q))
               p = PARAMNEXT (q)
               call dsfree (q)
               }
         call dsfree (IDPTR (info))
         }
      call rmtabl (Id_tbl (Ll))
      }
   if (Sm_tbl (Ll) ~= LAMBDA) {
      pos = 0
      while (sctabl (Sm_tbl (Ll), name, info, pos) ~= EOF)
         call dsfree (IDPTR (info))
      call rmtabl (Sm_tbl (Ll))
      }

   Ll -= 1
   if (Ll < 1)
      FATAL ("Lexic level 0 exited"p)

   return
   end




# accesssym --- allow access to all symbols on a lexic level

   pointer function accesssym (ll, name, p, class)
   integer ll, class
   character name (MAXTOK)
   pointer p

   include "c1_com.r.i"

   integer sctabl
   untyped info (IDSIZE)

   if (class == IDCLASS) {
      if (Id_tbl (ll) == LAMBDA || sctabl (Id_tbl (ll), name, info, p) == EOF)
         return (LAMBDA)
      return (IDPTR (info))
      }
   else {
      if (Sm_tbl (ll) == LAMBDA || sctabl (Sm_tbl (ll), name, info, p) == EOF)
         return (LAMBDA)
      return (IDPTR (info))
      }

   end



# new_sym --- create a new symbol with all the trimmings

   pointer function new_sym (name, mode, sc, arg, ll, obj, def, type)
   character name (ARB)
   pointer mode
   integer sc, arg, ll, obj, def, type

   include "c1_com.r.i"

   pointer id
   pointer makesym
   logical missin

   if (missin (type))
      id = makesym (name, IDSYMTYPE, ll)
   else
      id = makesym (name, type, ll)

   SYMMODE (id) = mode
   SYMSC (id) = sc
   if (arg == YES)
      SYMPARAM (id) = 0
   else
      SYMPARAM (id) = -1
   SYMOBJ (id) = obj
   SYMISDEF (id) = def
   call put_long (SYMOFFS (id), intl (0))

   return (id)
   end



# old_sym --- modify the values of an old symbol

   pointer function old_sym (p, sc, mode, def)
   pointer p, mode
   integer sc, def

   include "c1_com.r.i"

   SYMSC (p) = sc
   SYMMODE (p) = mode
   SYMISDEF (p) = def

   return (p)
   end
