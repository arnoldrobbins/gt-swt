# intrpt --- see if there has been an interrupt from the terminal

   logical function intrpt (arg)
   logical arg

   include SE_COMMON

   integer junk

   call quit$ (arg)
   intrpt = arg
   if (intrpt) {
      Errcode = EBREAK
      call restore_screen
      call tty$rs (CLEAR_INPUT, junk)
      }

   return
   end
