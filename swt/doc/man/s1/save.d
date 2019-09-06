.hd save "save shell variables" 03/20/80
save
.ds
'Save' saves the lexic level 1 shell variables,
causing the same action as exiting and reentering the Subsystem.
.sp
Its primary use is to save the current
values of the shell variables, so that if the Subsystem
crashes they will not be lost.
.es
   if [nargs]
      set f = [arg 1 | quote]
      save
   fi
.sa
declare (1), forget (1), vars (1), set (1)
