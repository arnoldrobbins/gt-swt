# ioinit --- initialize Subsystem I/O areas

   subroutine ioinit

   include SWT_COMMON

   integer fd, i
   integer duplx$
   character default_kresp (4)

   data default_kresp / '\'c, '\'c, NEWLINE, EOS /

   ### Initialize all file descriptors to the closed state:
   do fd = 1, NFILES
      Fd_flags (fd_offset (fd)) = 0

   ### Initialize file descriptor 1 for terminal i/o:
   Fd_dev (TTY) = DEV_TTY
   Fd_unit (TTY) = 0
   Fd_bufstart (TTY) = 0
   Fd_buflen (TTY) = 0
   Fd_bufend (TTY) = 0
   Fd_count (TTY) = 0
   Fd_bcount (TTY) = 0
   Fd_flags (TTY) = FD_READ + FD_WRITE

   Fd_lastfd = 1

   ### Set up term buffer and attributes:
   Echar = BS
   Kchar = DEL
   Rtchar = DC2
   Escchar = ESC
   Eofchar = ETX
   Nlchar = NEWLINE
   call ctoc (default_kresp, Kill_resp, MAXKILLRESP)
   Term_cp = 1
   Term_buf (Term_cp) = EOS
   Term_count = 0
   do i = 1, MAXTERMATTR
      Term_attr (i) = NO
   Lword = duplx$ (-1)     # record the terminal configuration

   Prt_form (1) = EOS
   Prt_dest (1) = EOS

   ### Set up initial standard port map:
   do fd = 1, MAX_STD_PORTS
      Std_port_tbl (fd) = TTY

   return
   end
