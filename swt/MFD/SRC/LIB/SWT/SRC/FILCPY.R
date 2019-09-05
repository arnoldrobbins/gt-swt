# filcpy --- copy a file from here to there

   integer function filcpy (from, to)
   character from (ARB), to (ARB)

   integer attach, j1 (3), fd, code, ifd, ofd, otype, itype
   integer rnw, junk
   integer buf (MAXDIRENTRY), array (2)
   character fname (MAXPACKEDFNAME), tname (MAXPACKEDFNAME)
   character junk1 (MAXVARYFNAME)
   integer getto, remove
   character str (MAXLINE)

   procedure error_exit forward

   ifd = 0
   ofd = 0

   ### Open the "from" file and get its attributes
   if (getto (from, fname, j1, attach) == ERR)
      error_exit
   call srch$$ (KREAD + KGETU, KCURR, 0, fd, junk, code)
   if (code ~= 0)
      error_exit
   call ptov (fname, ' 'c, junk1, MAXVARYFNAME)
   call ent$rd (fd, junk1, loc(buf), MAXDIRENTRY, code)
   call srch$$ (KCLOS, 0, 0, fd, 0, junk)
   if (code ~= 0 || rt (buf (20), 8) >= 4)
      error_exit
   call srch$$ (KREAD + KGETU, fname, 32, ifd, itype, code)
   if (code ~= 0)
      error_exit

   ### Open the destination file with the same type
   if (getto (to, tname, j1, attach) == ERR)
      error_exit
   call srch$$ (KRDWR + KGETU + ls (itype, 10),
                           tname, 32, ofd, otype, code)
   if (lt (otype, 14) ~= 0)   # It's a special file -- can't copy to it
      error_exit
   if (rt (itype, 2) ~= rt (otype, 2)) {  # Get rid of the old file ...
      call srch$$ (KCLOS, 0, 0, ofd, 0, code)
      call ptoc (tname, ' 'c, str, 33)
      if (remove (str) == ERR)
         error_exit
      call srch$$ (KRDWR + KGETU + ls (itype, 10),
                           tname, 32, ofd, otype, code)
      if (code ~= 0)
         error_exit
      }
   elif (rt (otype, 2) >= 2)              # clean out old segdir
      call rmseg$ (ofd)

   ### Both files are open and of the same type -- call the
   ###         appropriate copy routine
   if (rt (itype, 2) >= 2)                # segdirs
      call cpseg$ (ifd, ofd, code)
   else
      call cpfil$ (ifd, ofd, code)
   if (code == ERR)
      error_exit

   ### Truncate the "to" file if not a segdir
   if (otype < 2) {
      call prwf$$ (KTRNC, ofd, 0, 0, intl (0), rnw, code)
      if (code ~= 0)
         error_exit
      }

   ### Close both files
   call srch$$ (KCLOS, 0, 0, ifd, 0, code)
   call srch$$ (KCLOS, 0, 0, ofd, 0, code)

   ### Set the attributes on the "to" file, if possible
   array (1) = buf (18)
   array (2) = 0
   call satr$$ (KPROT, tname, 32, array, code)

   array (1) = buf (21)
   array (2) = buf (22)
   call satr$$ (KDTIM, tname, 32, array, code)

   array (1) = rt (rs (buf (20), 10), 2)
   array (2) = 0
   call satr$$ (KRWLK, tname, 32, array, code)

   if (and (buf (20), 8r40000) ~= 0)
      call satr$$ (KDMPB, tname, 32, intl (0), code)

   return (OK)

   # error_exit --- close the open files and return error status
      procedure error_exit {

         if (ifd ~= 0)
            call srch$$ (KCLOS, 0, 0, ifd, 0, code)
         if (ofd ~= 0)
            call srch$$ (KCLOS, 0, 0, ofd, 0, code)
         return (ERR)
         }

   end
