# c$end --- clean up after statement count run, output data

   subroutine c$end

   integer fd, i
   integer create

   integer limit
   longint count (1)
   common /c$stc/ limit, count

   string outfile "_st_count"

   fd = create (outfile, READWRITE)
   if (fd == ERR)
      call cant (outfile)

   limit -= 1    # last entry is bogus
   do i = 1, limit
      call print (fd, "*l*n"p, count (i))

   call close (fd)

   return
   end
