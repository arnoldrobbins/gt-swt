# ldseg$ --- load a segmented runfile into memory

   subroutine ldseg$ (rvec, name, len, code)
   integer rvec (9), name (ARB), len, code

   define (DB,#)

   integer symtab (1)
   common /sgsymt/ symtab

   integer bit, dfd, i, junk, n, rc, rev, sfd, wrd, addr (2),
      masks (16), segmap (512), sthead (21), svec (10), tvec (30)
   integer symtab_size
   integer chunk$
   pointer p, q

   data masks /   :100000, :040000, :020000, :010000,
                  :004000, :002000, :001000, :000400,
                  :000200, :000100, :000040, :000020,
                  :000010, :000004, :000002, :000001 /

   procedure open_directory forward
   procedure return_error forward

   open_directory

   ### read and check the revision flag:
   call prwf$$ (KREAD, dfd, loc (rev), 1, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading rev", 11, "ldseg$", 6)
   if (rc ~= 0 || rev ~= -1)
      return_error

   ### read the size of the segment map:
   call prwf$$ (KREAD, dfd, loc (n), 1, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading n", 9, "ldseg$", 6)
   if (rc ~= 0 || n > 256)
      return_error

   ### read the segment bit map:
   call prwf$$ (KREAD, dfd, loc (segmap), n * 2, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading segmap", 14, "ldseg$", 6)
   if (rc ~= 0)
      return_error

   ### read the save vector:
   call prwf$$ (KREAD, dfd, loc (svec), 10, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading svec", 12, "ldseg$", 6)
   if (rc ~= 0)
      return_error

   ### read the time vector:
   call prwf$$ (KREAD, dfd, loc (tvec), 30, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading tvec", 12, "ldseg$", 6)
   if (rc ~= 0 || tvec (10) < 6) # we don't support old revs
                                 # tvec (10) == 6 == Rev 17
                                 # tvec (10) == 7 == Rev 18
      return_error

   ### check for compatiblity
   if (tvec (10) < 7)
      symtab_size = svec (9)
   else
      symtab_size = svec (10)

   ### read the symbol table:
   call prwf$$ (KREAD, dfd, loc (symtab), symtab_size, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading symtab", 14, "ldseg$", 6)
   if (rc ~= 0)
      return_error

   ### read the symbol table list head vector:
   call prwf$$ (KREAD, dfd, loc (sthead), 21, intl (0), junk, rc)
DB call errpr$ (KIRTN, rc, "reading sthead", 14, "ldseg$", 6)
   if (rc ~= 0)
      return_error

   for (p = sthead (18); p ~= NULL; p = symtab (q + SG_CHAIN)) {
      q = symtab_size - (p * SG_NODESIZE) + 1
DB    call print (TTY, "Examining symbol number *i at *i*n"p,
DB          p, q)
DB    call print (TTY, "   *7,-8u*i*i*i*i*i*i*i*i*i*1n"p,
DB       symtab (q + 0), symtab (q + 1), symtab (q + 2), symtab (q + 3),
DB       symtab (q + 4), symtab (q + 5), symtab (q + 6), symtab (q + 7),
DB       symtab (q + 8))
      if (symtab (q + SG_SEGNUM) <= 8r4000   # ignore shared segments
            || symtab (q + SG_FLAGS) >= 0)   # segment is empty
         next
      call zmem$ (symtab (q))    # clear uninitialized areas
      n = and (symtab (q + SG_FLAGS), 8r777) * 32
      addr (1) = symtab (q + SG_SEGNUM)
      addr (2) = 0
      do i = 1, 32; {   # each segment is divided into 32 2K chunks
         bit = rt (n, 4)
         wrd = rs (n, 4)
         if (and (segmap (wrd + 1), masks (bit + 1)) ~= 0) {
DB          call print (TTY, "   loading chunk *i at *a*n"p, n, addr)
            if (chunk$ (addr, n, sfd) == ERR)
               return_error
            }
         n += 1
         addr (2) += 8r4000
         }
      }

   call srch$$ (KCLOS, 0, 0, dfd, 0, rc)
   call srch$$ (KCLOS, 0, 0, sfd, 0, rc)

   rvec (4) = svec (5)  # initial A register setting
   rvec (5) = svec (6)  # initial B register setting
   rvec (6) = svec (7)  # initial X register setting
   rvec (7) = 0         # initial KEYS
   rvec (8) = svec (1)  # address of ECB for main program
   rvec (9) = svec (2)

   code = 0

   return


   # open_directory --- open the runfile and subfile 0

      procedure open_directory {

      call srch$$ (KREAD + KGETU, name, len, sfd, junk, code)
DB    call errpr$ (KIRTN, code, "opening segdir", 14, "ldseg$", 6)
      if (code ~= 0)
         return
      call srch$$ (KREAD + KGETU + KISEG, sfd, 0, dfd, junk, code)
DB    call errpr$ (KIRTN, code, "opening seg 0", 13, "ldseg$", 6)
      if (code ~= 0) {
         call srch$$ (KCLOS, 0, 0, sfd, 0, junk)
         return
         }

      }


   # return_error --- clean up and return error status

      procedure return_error {

      call srch$$ (KCLOS, 0, 0, dfd, 0, rc)
      call srch$$ (KCLOS, 0, 0, sfd, 0, rc)
      code = EBPAR
      return

      }

   undefine (DB)

   end
