# ap --- generate object tape for A&P M6800 monitor

include PRIMOS_KEYS
include "as6800_def.r.i"

define(MEMSIZE,10000)

   DS_DECL (mem, MEMSIZE)

   integer fd, address, i, code, size
   integer open, getarg, gctoi

   character arg (MAXLINE)

   call dsinit (MEMSIZE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call error ("Usage: ap <file> [ <start address> ].")

   fd = open (arg, READ)
   if (fd == ERR)
      call cant (arg)

   if (getarg (2, arg, MAXLINE) == EOF)
      address = 0
   else {
      i = 1
      address = gctoi (arg, i, 16)
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

   DS_DECL (mem, MEMSIZE)

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

   DS_DECL (mem, MEMSIZE)

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

   DS_DECL (mem, MEMSIZE)

   integer w
   integer crc

   call print (STDOUT, "L.")
   call print (STDOUT, "*4,-16,0i *4,16,0i "s, address, size)

   for (w = 0; w < size; w += 1)
      call print (STDOUT, "*2,-16,0i"s, mem (w + code))

   call print (STDOUT, " *4,-16,0i"s, crc (code, size))

   return
   end



# crc --- calculate Cyclic Redundancy Check polynomial

   integer function crc (code, size)
   integer code, size

   DS_DECL (mem, MEMSIZE)

   integer mask, sr, w, temp

   mask = 16r80
   sr = 0
   w = 0

   repeat {
      if (mask == 0) {
         w += 1
         if (w >= size)
            break
         mask = 16r80
         }
      temp = 0
      if (and (mem (w + code), mask) ~= 0)      temp = not (temp)
      if (and (sr, :100000) ~= 0)               temp = not (temp)
      if (and (sr, 16r0200) ~= 0)               temp = not (temp)
      if (and (sr, 16r0080) ~= 0)               temp = not (temp)
      if (and (sr, 16r0010) ~= 0)               temp = not (temp)
      if (and (sr, 16r0001) ~= 0)               temp = not (temp)
      sr = rs (sr, 1)
      if (temp ~= 0)
         sr |= :100000
      mask = rs (mask, 1)
      }

   crc = sr
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
