# ckupd --- make sure it is ok to destroy the buffer

   integer function ckupd (lin, i, cmd, status)
   character lin (ARB), cmd
   integer i, status

   include SE_COMMON

   integer flag
   integer ckchar

   status = ckchar (ANYWAY, UCANYWAY, lin, i, flag, status)
   if (flag == NO && Buffer_changed == YES && Probation ~= cmd) {
      status = ERR
      Errcode = ESTUPID
      Probation = cmd  # if same command is repeated we'll keep silent
      }

   return (status)

   end
