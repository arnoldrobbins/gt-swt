# primos_cmd --- call the Primos command interpreter, allow reentry

   subroutine primos_cmd

   shortcall mkonu$ (18)
   external reonu$

   call mkonu$ ("REENTER$"v, loc (reonu$))
   call comlv$

   stop
   end
