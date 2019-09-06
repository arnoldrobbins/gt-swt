# cpfil$ --- copy one file to another

   subroutine cpfil$ (ifd, ofd, rc)
   integer ifd, ofd, rc

   include SWT_COMMON

   integer buf (1024), code, rnw, junk

   code = 0
   repeat {
      call prwf$$ (KREAD + KPRER + KCONV, ifd, loc (buf), 1024,
                   intl (0), rnw, Errcod)
      if (rnw > 0)
         call prwf$$ (KWRIT + KPRER, ofd, loc (buf), rnw,
                   intl (0), junk, code)
      } until (Errcod ~= 0 || code ~= 0)

   rc = ERR
   if (Errcod == EEOF && code == 0)
      rc = OK

   return
   end
