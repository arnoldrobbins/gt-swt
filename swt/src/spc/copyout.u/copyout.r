# copyout --- capture command output in a spool file
#             (requires a strange version of SPOOL$)

   include LIBRARY_DEFS
   include PRIMOS_KEYS

   integer info (29), buf (1000), code, i

   do i = 1, 29
      info (i) = "  "
   info (3) = 8r2000

   call spool$ (2, "BATCH_OUTPUT", 12, info, buf, 1000, code)
   call errpr$ (KIRTN, code, "spool", 5, "copyout", 7)

   call t1ou (FF)
   stop
   end
