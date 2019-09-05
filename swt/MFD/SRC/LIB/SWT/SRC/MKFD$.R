# mkfd$ --- make a Subsystem file from an already open Primos unit

   file_des function mkfd$ (unit, mode)
   integer unit, mode

   include SWT_COMMON

   filedes fd, getfd$
   integer f

  # Find an empty descriptor
   if (getfd$ (fd) == ERR)
      return (ERR)

   f = fd_offset (fd)
   call break$ (DISABLE)

  # Initialize the descriptor
   Fd_dev (f) = DEV_DSK
   Fd_unit (f) = unit
   Fd_bufstart (f) = fd * BUFSIZE - BUFSIZE
   Fd_buflen (f) = BUFSIZE
   Fd_bufend (f) = 0
   Fd_count (f) = 0
   Fd_bcount (f) = 0
   Fd_flags (f) = FD_OPENED + FD_COMP + FD_INITIAL
   select (and (mode, 16r3))        # in case there are extra bits
      when (READ)       Fd_flags (f) |= FD_READ
      when (WRITE)      Fd_flags (f) |= FD_WRITE
      when (READWRITE)  Fd_flags (f) |= FD_READ + FD_WRITE

   call break$ (ENABLE)

   return (fd)
   end
