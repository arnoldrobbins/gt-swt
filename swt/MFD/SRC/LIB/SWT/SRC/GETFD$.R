# getfd$ --- look for an empty file descriptor cleverly

   file_des function getfd$ (fd)
   file_des fd

   include SWT_COMMON

   integer limit

   procedure search (start, limit) forward

  ### Get the number of the last descriptor in the first page
   limit = ((loc (Fdmem) / 1024 * 1024 + 1024) - loc (Fdmem)) / FDSIZE

  ### Look for an empty descriptor
   search (Fd_lastfd, limit)

   search (Fd_lastfd, NFILES)

   return (ERR)


   # search --- search for any empty descriptor, modulo 'limit'

      procedure search (start, limit) {

      integer start, limit

      local i; integer i


      if (start < 1 || start > limit)
         start = 1

       if (start >= limit)
          i = 1
       else
          i = start + 1
       while (Fd_flags (fd_offset (i)) ~= 0 && i ~= limit)
          if (i >= limit)
             i = 1
          else
             i += 1

       if (i ~= limit) {
          Fd_lastfd = i
          fd = i
          return (i)
          }

        }

   end
