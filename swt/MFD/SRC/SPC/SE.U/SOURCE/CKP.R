# ckp --- check for "p" after command

   integer function ckp (lin, i, pflag, status)
   character lin (MAXLINE)
   integer i, pflag, status

   integer j

   j = i
   if (lin (j) == PRINT || lin (j) == UCPRINT) {
      j += 1
      pflag = YES
      }
   else
      pflag = NO

   if (lin (j) == NEWLINE)
      status = OK
   else
      status = ERR

   return (status)

   end
