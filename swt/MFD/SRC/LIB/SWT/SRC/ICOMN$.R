# icomn$ --- initialize Subsystem common areas

   subroutine icomn$

   include SWT_COMMON

   integer i

   Arg_c = 0
   Cmdstat = 0
   Errcod = 0
   Comunit = 0
   Passwd (1) = EOS
   Ls_top = MAXLSBUF - 1
   Ls_na = 1
   Ls_ho = 1
   Ls_ref (1) = EOS
   Utemptop = 0
   do i = 1, MAXTEMPHASH
      Uhashtb (i) = LAMBDA
   do i = 1, 4; {
      Rtlabel (i) = 0
      Bplabel (i) = 0
      }

   call ioinit     # initialize I/O routines

   return
   end
