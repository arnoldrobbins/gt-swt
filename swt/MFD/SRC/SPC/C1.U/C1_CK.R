# ck_fndef --- output 'cck' information for function definition

   subroutine ck_fndef (p)
   pointer p

   include "c1_com.r.i"

   if (~ ARG_PRESENT (y) || SYMTYPE (p) ~= IDSYMTYPE)
      return

   call ck_putname (p, 'd'c)

   return
   end



# ck_fncall --- output 'cck' information for function call

   subroutine ck_fncall (p)
   pointer p

   include "c1_com.r.i"

   if (~ ARG_PRESENT (y) || SYMTYPE (p) ~= IDSYMTYPE)
      return

   call ck_putname (p, 'i'c)

   return
   end



# ck_putname --- output function name, source location & return mode

   subroutine ck_putname (p, c)
   pointer p
   character c

   include "c1_com.r.i"

   integer i

   call print (Ckfile, "# "s)

   for (i = 0; Mem (SYMTEXT (p) + i) ~= EOS && i < 8; i += 1)
      call putch (mapdn (Mem (SYMTEXT (p) + i)), Ckfile)

   call print (Ckfile, " *c *s "s, c, Module_name)

   for (i = 1; i < Level; i += 1)
      call print (Ckfile, "*i/"s, Line_number (i))
   call print (Ckfile, "*i"s, Symline)

   call ck_putmode (SYMMODE (p))

   return
   end



# ck_fnarg --- output 'cck' information for function argument

   subroutine ck_fnarg (p)
   pointer p

   include "c1_com.r.i"

   if (~ ARG_PRESENT (y))
      return

   call ck_putmode (EXPMODE (p))

   return
   end



# ck_putmode --- output the mode of an object for 'cck'

   subroutine ck_putmode (p)
   pointer p

   include "c1_com.r.i"

   pointer q

   for (q = p; q ~= LAMBDA; q = MODEPARENT (q)) {
      if (q == p)
         call putch (' 'c, Ckfile)
      else
         call putch ('/'c, Ckfile)

      call print (Ckfile, "*i"s, MODETYPE (q))

      select (MODETYPE (q))
         when (ARRAYMODE, FIELDMODE, STRUCTMODE, UNIONMODE)
            call print (Ckfile, ":*l"s, MODELEN (q))
      }

   return
   end



# ck_fnend --- output 'cck' information for end of argument list

   subroutine ck_fnend

   include "c1_com.r.i"

   if (~ ARG_PRESENT (y))
      return

   call putch (NEWLINE, Ckfile)

   return
   end
