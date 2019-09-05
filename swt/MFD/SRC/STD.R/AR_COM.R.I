# ar_com.r.i --- common declarations for 'ar' program

   common /arcom/ Fname (NAMESIZE, MAXFILES), Fstat (MAXFILES),
      Nfiles, Errcnt

   character Fname      # file arguments
   integer   Fstat,     # YES if file touched, NO otherwise; init = NO
             Nfiles,    # number of file arguments
             Errcnt     # error count; init = 0
