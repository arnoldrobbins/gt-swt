# szfil$ --- find number of records in a file

   longint function szfil$ (fd)

   integer fd

   include LIBRARY_DEFS
   include SWT_COMMON
   include PRIMOS_KEYS

   integer junk
   longint size

   define (BIGVALUE, :17777777)


   repeat
      call prwf$$ (KPOSN + KPRER, fd, loc (0), 0, BIG_VALUE, junk, Errcod)
      until (Errcod ~= 0)

   if (Errcod ~= EEOF)    # encountered some error besides EOF
      return (ERR)

   call prwf$$ (KRPOS, fd, loc (0), 0, size, junk, Errcod)

   return (size)
   end
