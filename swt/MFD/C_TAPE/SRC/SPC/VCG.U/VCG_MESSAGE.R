# vcg_message --- code generator message handling module



# panic --- print warning message on ERROUT, then die ungracefully

   subroutine panic (fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   character fmt (ARB)
   integer a1, a2, a3, a4, a5, a6, a7, a8, a9

   include VCG_COMMON

   call flush$ (Outfile)

   call print (ERROUT, fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   call seterr (1000)
   stop
   end



# warning --- print warning message on ERROUT

   subroutine warning (fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   character fmt (ARB)
   integer a1, a2, a3, a4, a5, a6, a7, a8, a9

   include VCG_COMMON

   call print (ERROUT, fmt, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   Errors += 1

   return
   end
