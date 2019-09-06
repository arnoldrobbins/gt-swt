# lopen$ --- open a disk file in the spool queue

   filedes function lopen$ (path, fd, mode)
   character path (ARB)
   filedes fd
   integer mode

   include SWT_COMMON

   integer unit1, unit2, unit3, i, j, pp, bl, offset
   integer junk (3), info (29), banner (16), buf (100)
   integer mapdn, ctoi, ctop, parstm, mapup
   longint t
   character str (MAXPATH)

   procedure check forward
   procedure getstr forward

   unit1 = 0; unit2 = 0; unit3 = 0

   info (3) = RAW
   do i = 4, 29
      info (i) = "  "

   i = 1
   bl = ctop ("/DEV/LPS"s, i, banner, 16)

  # Parse the arguments
   for (pp = 1; path (pp) ~= EOS; pp += 1)
      select (mapdn (path (pp)))

         when ('/'c, '-'c, ' 'c)    # argument separator
            ;

         when ('f'c)                # Fortran forms control
            info (3) = or (and (info (3), not (LNR + RAW)), FTN)

         when ('r'c)                # Raw forms control
            info (3) = or (and (info (3), not (LNR + FTN)), RAW)

         when ('s'c)                # Standard forms control
            info (3) &= not (FTN + RAW)

         when ('h'c)                # suppress header page
            info (3) |= NHD

         when ('j'c)                # suppress trailing page eject
            info (3) |= NEJ

         when ('n'c)                # generate line numbers
            info (3) |= LNR

         when ('a'c) {              # specify destination printer
            info (3) |= ATL
            getstr
            j = 1
            call ctop (str, j, info (13), 8)
            }

         when ('d'c) {              # defer printing
            info (3) |= DEF
            getstr
            i = 1
            if (parstm (str, i, t) == ERR)
               return (ERR)
            info (11) = ints (t / 60)
            }

         when ('b'c) {              # specify banner
            getstr
            j = 1
            bl = ctop (str, j, banner, 16)
            }

         when ('c'c) {              # specify number of copies
            info (3) |= COP
            getstr
            i = 1
            info (29) = ctoi (str, i)
            }

         when ('p'c) {              # specify form type
            getstr
            j = 1
            call ctop (str, j, info (4), 3)
            }

      else
         return (ERR)

   if (Prt_dest (1) ~= EOS && info (13) == "  ") {
      info (3) |= ATL
      call ctoc (Prt_dest, str, MAXLINE)
      call mapstr (str, UPPER)
      j = 1
      call ctop (str, j, info (13), 8)
      }

   if (Prt_form (1) ~= EOS && info (4) == "  ") {
      call ctoc (Prt_form, str, MAXLINE)
      call mapstr (str, UPPER)
      j = 1
      call ctop (str, j, info (4), 3)
      }

  # Open the current directory three times for reading to get three units
  #   (we throw away the first unit because 'spool$' uses K$GETU
  #    before using the units we are supplying!!)
   call srch$$ (KREAD + KGETU, KCURR, 32, unit1, junk, Errcod); check
   call srch$$ (KREAD + KGETU, KCURR, 32, unit2, junk, Errcod); check
   call srch$$ (KREAD + KGETU, KCURR, 32, unit3, junk, Errcod); check

   call srch$$ (KCLOS, 0, 0, unit1, junk, Errcod)
   call srch$$ (KCLOS, 0, 0, unit2, junk, Errcod)
   call srch$$ (KCLOS, 0, 0, unit3, junk, Errcod)

   info (1) = unit2
   info (2) = unit3

  # Open the file in the queue (always opened read/write)
   call spool$ (2, banner, bl, info, buf, 100, Errcod)
   if (Errcod ~= 0)
      return (ERR)

  # And fill in the detail in the descriptor
   offset = fd_offset (fd)
   Fd_unit (offset) = unit3
   Fd_flags (offset) |= FD_WRITE + FD_COMP   # be sure file is writable

   if (and (info (3), RAW + NHD) == RAW) {   # raw with header:
      call putch (FF, fd)                    #    put in formfeed
      call putch (NEWLINE, fd)
      }

   return (fd)


   # check --- check for a Primos file system error

      procedure check {

      if (Errcod ~= 0) {
         if (unit1 ~= 0)
            call srch$$ (KCLOS, 0, 0, unit1, junk, junk)
         if (unit2 ~= 0)
            call srch$$ (KCLOS, 0, 0, unit2, junk, junk)
         return (ERR)
         }
      }


   # getstr --- grab a string from the input path

      procedure getstr {

      local i
      integer i

      while (path (pp + 1) == '/'c || path (pp + 1) == ' 'c)
         pp += 1

      for (i = 1; path (pp + 1) ~= EOS && path (pp + 1) ~= '/'c &&
                  path (pp + 1) ~= ' 'c; {pp += 1; i += 1})
         str (i) = mapup (path (pp + 1))
      str (i) = EOS
      }

   end
