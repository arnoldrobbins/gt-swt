# ci --- main routine for the Subsystem command interpreter

   subroutine cimain

   # WARNING -- do not define any common in this subroutine!!

   call initialize_everything

   call start_logging                  # open record file
   call shell (TTY)                    # invoke shell
   call stop_logging                   # close record file

   return
   end



