# chunk$ --- read one 2K chunk of the runfile into memory

   integer function chunk$ (bp, seg, fd)
   longint bp
   integer seg, fd

   define (out,1)
   define (DB,#)

   integer code, junk, tfd

   call sgdr$$ (KSPOS, fd, seg + 2, junk, code)
DB call errpr$ (KIRTN, code, "positioning segdir", 18, "chunk$", 6)
   if (code ~= 0)
      goto out
   call srch$$ (KREAD + KISEG + KGETU, fd, 0, tfd, junk, code)
DB call errpr$ (KIRTN, code, "opening subfile", 15, "chunk$", 6)
   if (code ~= 0)
      goto out
   call prwf$$ (KREAD, tfd, bp, 8r4000, intl (0), junk, code)
   call srch$$ (KCLOS, 0, 0, tfd, 0, junk)
   call errpr$ (KIRTN, code, "reading subfile", 15, "chunk$", 6)
   if (code == 0)
      return (OK)

out;
   return (ERR)

   undefine (out)
   undefine (DB)

   end
