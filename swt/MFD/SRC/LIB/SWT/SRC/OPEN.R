# open --- open a file for reading and/or writing

   filedes function open (path, mode, ftype, delay)
   character path (ARB)
   integer mode, ftype, delay

   include SWT_COMMON

   integer fd, f, i, j
   integer dopen$, lopen$, mapdn, strbsr, expand, getfd$
   character dev_name (30), epath (MAXPATH)

   string_table dev_pos, dev_tab,
      / 1, ERRIN,     "errin"    _
      / 1, ERROUT,    "errout"   _
      / 4, 0,         "lps"      _
      / 2, 0,         "null"     _
      / 1, STDIN,     "stdin"    _
      / 1, STDIN1,    "stdin1"   _
      / 1, STDIN2,    "stdin2"   _
      / 1, STDIN3,    "stdin3"   _
      / 1, STDOUT,    "stdout"   _
      / 1, STDOUT1,   "stdout1"  _
      / 1, STDOUT2,   "stdout2"  _
      / 1, STDOUT3,   "stdout3"  _
      / 3, 0,         "tty"

   procedure creturn (val) forward

  # Find an empty descriptor
   if (getfd$ (fd) == ERR)
      return (ERR)

   f = fd_offset (fd)

   call break$ (DISABLE)

  # Initialize the descriptor (except device type)
   Fd_bufstart (f) = fd * BUFSIZE - BUFSIZE
   Fd_buflen (f) = BUFSIZE
   Fd_bufend (f) = 0
   Fd_count (f) = 0
   Fd_bcount (f) = 0
   select (and (mode, 3))  # look only at 2 low-order bits
      when (READ)       Fd_flags (f) = FD_READ
      when (WRITE)      Fd_flags (f) = FD_WRITE
      when (READWRITE)  Fd_flags (f) = FD_READ + FD_WRITE
   else
      creturn (ERR)
   Fd_flags (f) |= FD_OPENED + FD_INITIAL

  # Expand the templates in the name:
   if (expand (path, epath, MAXPATH) == ERR)
      creturn (ERR)

  # Select the device type:
   i = 1
   SKIPBL (epath, i)

  # Is it a disk file?
   if (       epath (i + 0)  ~= '/'c ||
       mapdn (epath (i + 1)) ~= 'd'c ||
       mapdn (epath (i + 2)) ~= 'e'c ||
       mapdn (epath (i + 3)) ~= 'v'c ||
              epath (i + 4)  ~= '/'c) {

      Fd_dev (f) = DEV_DSK
      creturn (dopen$ (path, fd, mode, ftype, delay))
      }

  # It must be a device file
   i += 5   # skip past "/dev/"
   for (j = 1; epath (i) ~= EOS && epath (i) ~= '/'c && epath (i) ~= ' 'c;
              {j += 1; i += 1})
      dev_name (j) = mapdn (epath (i))
   dev_name (j) = EOS

  # Look up the device
   j = strbsr (dev_pos, dev_tab, 2, dev_name)
   if (j == EOF)
      creturn (ERR)

   select (dev_tab (dev_pos (j)))
      when (1) {
         Fd_flags (f) = 0       # give back the file descriptor
         creturn (dev_tab (dev_pos (j) + 1)) # return the standard port
         }
      when (2) {
         Fd_dev (f) = DEV_NULL
         creturn (fd)
         }
      when (3) {
         Fd_dev (f) = DEV_TTY
         creturn (fd)
         }
      when (4) {
         Fd_dev (f) = DEV_DSK
         creturn (lopen$ (epath (i), fd, mode))
         }

   Fd_flags (f) = 0

   call break$ (ENABLE)

   return (ERR)            # error in table


   # creturn --- deallocate file descriptor if returning error status

      procedure creturn (val) {

      integer val

      if (val == ERR)
         Fd_flags (f) = 0

      call break$ (ENABLE)

      return (val)

      }

   end
