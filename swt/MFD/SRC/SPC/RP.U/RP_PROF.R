# begin_decl --- a declaration has been encountered

   subroutine begin_decl

   include "rp_com.i"

   if (First_stmt == NO) {
      First_stmt = YES
      call begin_module
      }

   return
   end



# begin_stmt --- a statement has been encountered

   subroutine begin_stmt

   include "rp_com.i"

   if (First_stmt == NO) {
      First_stmt = YES
      call begin_module
      }

  # Output statement count code
   if (ARG_PRESENT (c)) {
      call outtab (CODE)
      call outstr ("call c$incr("s, CODE)
      call outnum (Line_number (1), CODE)
      call outch (')'c, CODE)
      call outdon (CODE)
      }

   return
   end



# begin_module --- the beginning of a module has been encountered

   subroutine begin_module

   include "rp_com.i"

   integer equal, length

   Spnum += 1

  # Handle module entry for profile
   if (ARG_PRESENT (p) && equal (".data."s, Module_long_name) == NO) {

      call putlin (Module_long_name, Prof_dict_file)
      call putch (NEWLINE, Prof_dict_file)

      if (equal (Module_long_name, ".main."s) == YES) {
         call outtab (CODE)
         call outstr ("call t$init"s, CODE)
         call outdon (CODE)
         }

      call outtab (CODE)
      call outstr ("call t$entr("s, CODE)
      call outnum (Spnum, CODE)
      call outch (')'c, CODE)
      call outdon (CODE)
      }

  # Handle module entry for trace
   if (ARG_PRESENT (t) && equal (".data."s, Module_long_name) == NO)

      if (equal (Module_long_name, ".main."s) == YES) {
         call outtab (CODE)
         call outstr ("call t$trac(3,0)"s, CODE)
         call outdon (CODE)
         call outtab (CODE)
         call outstr ("call t$trac(1,9h@.main@..)"s, CODE)
         call outdon (CODE)
         }
      else {
         call outtab (CODE)
         call outstr ("call t$trac(1,"s, CODE)
         call outnum (length (Module_long_name) + 1, CODE)
         call outch ('H'c, CODE)
         call outstr (Module_long_name, CODE)
         call outstr (".)"s, CODE)
         call outdon (CODE)
         }

  # Handle program entry for statement count
   if (ARG_PRESENT (c)) {

      if (equal (Module_long_name, ".main."s) == YES) {
         call outtab (CODE)
         call outstr ("call c$init"s, CODE)
         call outdon (CODE)
         }

      }

   return
   end



# end_module --- the end of a module has been encountered

   subroutine end_module

   include "rp_com.i"

   First_stmt = NO

   return
   end



# stop_module --- a stop statement has been encountered

   subroutine stop_module

   include "rp_com.i"

   if (ARG_PRESENT (p)) {
      call outtab (CODE)
      call outstr ("call t$clup"s, CODE)
      call outdon (CODE)
      }

   if (ARG_PRESENT (t)) {
      call outtab (CODE)
      call outstr ("call t$trac(2,0)"s, CODE)
      call outdon (CODE)
      }

   if (ARG_PRESENT (c)) {
      call outtab (CODE)
      call outstr ("call c$end"s, CODE)
      call outdon (CODE)
      }


   return
   end



# return_module --- a return statement has been encountered

   subroutine return_module

   include "rp_com.i"

  # Handle module exit for profile
   if (ARG_PRESENT (p)) {
      call outtab (CODE)
      call outstr ("call t$exit"s, CODE)
      call outdon (CODE)
      }

  # Handle module exit for trace
   if (ARG_PRESENT (t)) {
      call outtab (CODE)
      call outstr ("call t$trac(2,0)"s, CODE)
      call outdon (CODE)
      }

   return
   end



# end_program --- the end of the source file has been reached

   subroutine end_program

   include "rp_com.i"

   integer ln

  # Profile initialization subroutine:
   if (ARG_PRESENT (p)) {
      call print (Fortfile, "      SUBROUTINE T$INIT*n"p)
      call print (Fortfile, "      INTEGER**2 SP,NUMRTN*n"p)
      call print (Fortfile, "      INTEGER**4 RECORD*n"p)
      call print (Fortfile, "      INTEGER**4 STACK*n"p)
      call print (Fortfile, "      COMMON /T$PROF/NUMRTN,RECORD(4,*i)*n"p,
                                       Spnum)
      call print (Fortfile, "      COMMON /T$STAK/SP,STACK(4,*i)*n"p,
                                       Spnum)
      call print (Fortfile, "      NUMRTN=*i*n"p, Spnum)
      call print (Fortfile, "      RETURN*n"p)
      call print (Fortfile, "      END*n"p)
      }

  # Statement count trace initialization subroutine:
   if (ARG_PRESENT (c)) {
      ln = Line_number (1)
      call print (Fortfile, "      SUBROUTINE C$INIT*n"p)
      call print (Fortfile, "      INTEGER LIMIT*n"p)
      call print (Fortfile, "      INTEGER**4 COUNT*n"p)
      call print (Fortfile, "      COMMON /C$STC/ LIMIT,COUNT(*i)*n"p, ln)
      call print (Fortfile, "      INTEGER I*n"p)
      call print (Fortfile, "      DO 1 I=1,*i*n"p, ln)
      call print (Fortfile, "    1   COUNT(I)=0*n"p)
      call print (Fortfile, "      LIMIT=*i*n"p, ln)
      call print (Fortfile, "      RETURN*n"p)
      call print (Fortfile, "      END*n"p)
      }

   return
   end
