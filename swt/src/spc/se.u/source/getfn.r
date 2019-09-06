# getfn --- get file name from lin (i)...

   integer function getfn (lin, i, file)
   integer i
   character lin (MAXLINE), file (MAXLINE)

   include SE_COMMON

   integer j, k

   getfn = ERR
   if (lin (i + 1) == " "c) {
      j = i + 2      # get new file name
      SKIPBL (lin, j)
      for (k = 1; lin (j) ~= NEWLINE; {k += 1; j += 1})
         file (k) = lin (j)
      file (k) = EOS
      if (k > 1)
         getfn = OK
      }
   elif (lin (i + 1) == NEWLINE && Savfil (1) ~= EOS) {
      call scopy (Savfil, 1, file, 1)   # or old name
      getfn = OK
      }
   else     # error
      if (lin (i + 1) == NEWLINE)
         Errcode = ENOFN
      else
         Errcode = EFILEN

   if (getfn == OK && Savfil (1) == EOS) {
      call scopy (file, 1, Savfil, 1)   # save if no old one
      call mesg (Savfil, FILE_MSG)
      }

   return
   end
