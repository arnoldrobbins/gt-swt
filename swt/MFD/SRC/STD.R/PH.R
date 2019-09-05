# ph --- execute subsystem commands as a phantom user

   define (PHUNIT, 6)
   include LIBRARY_DEFS

   integer i, rc, fd, pid, name (16), usernum, pwd (3), attach
   integer create, getarg, getto, expand, equal

   character phfile (MAXLINE), arg (MAXARG), junk (MAXLINE)

   include SWT_COMMON

   call date (SYS_PID, usernum)

   repeat {    # never repeated
      do i = 1, 4; {
         call encode (phfile, MAXLINE, "=varsdir=/ph*3,,0i*2,,0i"s,
            usernum, i)
         fd = create (phfile, WRITE)
         if (fd ~= ERR)
            break 2
         }
      call print (ERROUT, "Can't create phantom file: *s*n.", phfile)
      stop
      }

   call print (fd, "CHAP LOWER 1*nSWT -*i*n.", PHUNIT)
   if (expand ("=GaTech="s, junk, MAXLINE) == ERR
         || equal (junk, "yes"s) == NO)
      call print (fd, "*s*n"s, Passwd)
   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
      call putlin (arg, fd)
      call putch (' 'c, fd)
      }
   if (i > 1)
      call putch (NEWLINE, fd)
   else
      call fcopy (STDIN, fd)
   call print (fd, "stop *s*n.", phfile)
   call close (fd)

   if (getto (phfile, name, pwd, attach) == ERR)
      call error ("=varsdir= is inaccessible.")

   call phant$ (name, 32, PHUNIT, pid, rc)
   if (rc ~= 0) {
      call remove (phfile)
      call remark ("No free phantoms.")
      }
   else
      call print (STDOUT, "*i*n.", pid)

   if (attach == YES)
      call follow (EOS, 0)

   stop
   end
