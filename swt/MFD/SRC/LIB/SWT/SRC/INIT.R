# init --- initialization subroutine for Software Tools Subsystem

   subroutine init

   call remark ("You are trying to run a pre-version 9 compilation."p)
   call error ("Please recompile and try again."p)

   return
   end
