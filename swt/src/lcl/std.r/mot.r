#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# mot --- generate Motorola object tape from 'as6800' file

include PRIMOS_KEYS
include "as6800_def.r.i"

define(MEMSIZE,10000)
define(RECSIZE,15)

   integer fd, address, i, code, size
   integer open, getarg, ctoi

   character arg (MAXLINE)

   call dsinit (MEMSIZE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call error ("Usage: mot <file> [ <start address> ].")

   fd = open (arg, READ)
   if (fd == ERR)
      call cant (arg)

   if (getarg (2, arg, MAXLINE) == EOF)
      address = 0
   else {
      i = 1
      address = ctoi (arg, i)
      }

   call load (fd, code, size)
   call relocate (fd, code, size, address)
   call dump (code, size, address)

   call close (fd)
   stop
   end



# load --- load a code segment from file fd, return its locn and size

   subroutine load (fd, code, size)
   integer fd, size
   pointer code

   include "mot_com.r.i"

   integer i, b
   integer getbyte

   pointer dsget

   if (getbyte (b, fd) == EOF || b ~= TEXTCODE)
      call error ("badly formed code file.")
   call getword (size, fd)

   code = dsget (size)
   for (i = 0; i < size; i = i + 1)
      call getbyte (mem (code + i), fd)

   return
   end



# relocate --- relocate code segment to specified address

   subroutine relocate (fd, code, size, address)
   integer fd, size, address
   pointer code

   include "mot_com.r.i"

   integer i, map, addr, unnecessary
   integer getbyte

   if (address == 0)
      return

   if (getbyte (i, fd) == EOF || i ~= RMAPCODE)
      call error ("badly formed code file.")
   call getword (i, fd)

   for (i = 0; i < size; i = i + 1) {
      if (mod (i, 8) == 0)
         call getbyte (map, fd)
      if (and (map, ls (1, 7 - mod (i, 8))) ~= 0) {
         addr = address + mem (code + i + 1) + ls (mem (code + i), 8)
         unnecessary = code + i
         mem (unnecessary) = rs (addr, 8)
         unnecessary = unnecessary + 1
         mem (unnecessary) = rt (addr, 8)
         }
      }

   return
   end



# dump --- write relocated program in hex to STDOUT

   subroutine dump (code, size, address)
   integer code, size, address

   include "mot_com.r.i"

   integer tw, mcont, cksum

   call print (STDOUT, "L.")
   call sleep$ (intl (1000))
   tw = 0

   repeat {
      call print (STDOUT, "*nS1.")
      if (size - tw <= RECSIZE)
         mcont = size - tw
      else
         mcont = RECSIZE + 1
      cksum = 0
      call outhex (mcont + 3, cksum)
      call outhex (rs (tw + address, 8), cksum)
      call outhex (rt (tw + address, 8), cksum)
      repeat {
         call outhex (mem (tw + code), cksum)
         tw = tw + 1
         mcont = mcont - 1
         } until (mcont <= 0)
      call outhex (not (cksum), cksum)
      } until (tw >= size)
   call print (STDOUT, "*nS9*n.")

   return
   end



# outhex --- print byte in hex on STDOUT, update checksum

   subroutine outhex (byte, checksum)
   integer byte, checksum

   string hex "0123456789ABCDEF"

   call putch (hex (rt (rs (byte, 4), 4) + 1), STDOUT)
   call putch (hex (rt (byte, 4) + 1), STDOUT)
   checksum = rt (checksum + byte, 8)

   return
   end



# getbyte --- read one byte from code file

   subroutine getbyte (b, fd)
   integer b, fd

   integer junk
   integer mapfd

   call prwf$$ (KREAD, mapfd (fd), loc (b), 1, intl (0), junk, junk)

   return
   end



# getword --- read word from object code file

   subroutine getword (w, fd)
   integer w, fd

   integer hi, lo

   call getbyte (hi, fd)
   call getbyte (lo, fd)
   w = or (ls (hi, 8), lo)

   return
   end
