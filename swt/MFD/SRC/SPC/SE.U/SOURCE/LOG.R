# log --- log screen editor usage

   subroutine log

   include SE_COMMON

   file_des fd
   file_des open
   character name (MAXUSERNAME), pid (4), dat (9), tim (9)
   string log_file "//acct/slog"

   if (Term_type == ADDS100) {
      fd = open (log_file, WRITE)
      if (fd == ERR)
         return
      call date (SYS_DATE, dat)
      call date (SYS_TIME, tim)
      call date (SYS_USERID, name)
      call date (SYS_PIDSTR, pid)
      call wind (fd)
      call print (fd, "*#s *s *s *s*n"s, MAXUSERNAME - 1,
                                          name, pid, dat, tim)
      call close (fd)
      }

   return
   end
