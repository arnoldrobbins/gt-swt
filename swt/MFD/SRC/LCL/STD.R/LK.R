#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# lk --- link sspl object files

define(DEBUG, #)

   include PRIMOS_KEYS
   include "as6800_def.r.i"

   define(MAXFD,128)

# run-time modes

   define(INCLUDEMODE, 0)
   define(LIBMODE, 1)
   define(NAMELISTMODE, 2)

# machines
   define(NO_MACHINE,0)
   define(MOTOROLA_6800,1)
   define(INTEL_8080,2)

   include "lk_com.r.i"
   integer open_segment, segment_useful, unresolved

   integer junk

   call initialize   # create output file, etc.

   if (open_segment (junk) ~= OK)
      call error ("Nothing to link.")

   call link
   call next_segment
   while (open_segment (junk) ~= EOF) {
      if (Mode == INCLUDEMODE | segment_useful (junk) == YES)
            call link
      call next_segment
      }
   call cleanup
   stop
   end


# chainback --- resolve word-length forward references

   subroutine chainback (addr, val, type)
   integer addr, val

   include "lk_com.r.i"

   integer p, next

   p = addr
   while (p ~= LAMBDA) {
      call putrel (type, p)
      call xseek (p, Outfile)
      call getword (next, Outfile)
      call xseek (p, Outfile)
      call putword (val, Outfile)
      p = next
      }

   return
   end


# cleanup --- terminate process of assembly

   subroutine cleanup

   include "lk_com.r.i"
   integer length, ctoa

   integer i, j, maplen

   call seek (1, Outfile)       # put in Outfile length
   call putword (Seg_start (Outfile), Outfile)
   call xseek (Seg_start (Outfile), Outfile)

   # relocation map:
   call putbyte (RMAPCODE, Outfile)
   maplen = (Seg_start (Outfile) + 7) / 8
   call putword (maplen, Outfile)
   for (i = 1; i <= maplen; i = i + 1)
      call putbyte (Rmap (i), Outfile)

   # symbol table entries:
   for (i = 1; i <= Symtop; i = i + 1) {
      call putbyte (SYMBOLCODE, Outfile)
      call putword (length (Mem (Sym_sym (i))) + 5, Outfile)
      call putword (Sym_typ (i), Outfile)
      call putword (Sym_val (i), Outfile)
      for (j = Sym_sym (i); Mem (j) ~= EOS; j = j + 1)
         call putbyte (ctoa (Mem (j)), Outfile)
      call putbyte (0, Outfile)     # end-of-string
      }

   call close (Infile)
   call close (Outfile)

   return
   end


# compare --- compare two strings, return -1 if <, 0 if =, 1 if >

   integer function compare (str1, str2)
   character str1 (ARB), str2 (ARB)

   integer i

   for (i = 1; str1 (i) == str2 (i); i = i + 1)
      if (str1 (i) == EOS) {
         compare = 0
         return
         }

   if (str1 (i) > str2 (i))
      compare = 1
   else
      compare = -1

   return
   end


# connect --- connect chain1 and chain2; with chain1 in front

   subroutine connect (chain1, chain2)
   integer chain1, chain2

   include "lk_com.r.i"

   integer p, nextp

   if (chain1 == LAMBDA)
      chain1 = chain2
   else {
      p = chain1
      repeat {
         call xseek (p, Outfile)
         call getword (nextp, Outfile)
         if (nextp == LAMBDA)
            break
         p = nextp
         }
      call xseek (p, Outfile)
      call putword (chain2, Outfile)
      }

   return
   end


# copy_text --- copy text section from Infile to Outfile

   integer function copy_text (junk)
   integer junk

   include "lk_com.r.i"
   integer getbyte, getword

   integer b, len, typ

   if (getbyte (typ, Infile) ~= EOF) {
      copy_text = getword (len, Infile)
      for ( ; len ~= 0; len = len - 1) {
         call getbyte (b, Infile)
         call putbyte (b, Outfile)
         }
      return
      }

   call error ("Unexpected EOF in text section.")

   return
   end


# ctoa --- convert Prime characters to real ASCII

   integer function ctoa (c)
   character c

   ctoa = rt (c, 7)

   return
   end


# enter --- enter symbol, type, and value in symbol table

   subroutine enter (sym, type, val)
   character sym (ARB)
   integer type, val

   include "lk_com.r.i"
   integer equal
   pointer sdup

   integer i

   for (i = 1; i <= Symtop; i = i + 1)
      if (equal (sym, Mem (Sym_sym (i))) == YES)
         call error ("symbol redefined.")

   if (Symtop >= MAXSYMTOP)
      call error ("too many symbols --- link stopped.")

   Symtop = Symtop + 1
   Sym_sym (Symtop) = sdup (sym)
   Sym_typ (Symtop) = type
   Sym_val (Symtop) = val

   return
   end


# fix_chain --- relocate chain starting at addr

   subroutine fix_chain (addr)
   integer addr

   include "lk_com.r.i"

   integer p, nextp

   if (addr ~= LAMBDA) {
      p = addr
      repeat {
         call xseek (p, Outfile)
         call getword (nextp, Outfile)
         if (nextp == LAMBDA)
            break
         call xseek (p, Outfile)
         p = nextp + Seg_start (Outfile)
         call putword (p, Outfile)
         }
      }

   return
   end


# getbyte --- read one byte from file

   integer function getbyte (b, fd)
   integer b, fd

   integer junk, rc
   integer mapfd

   call prwf$$ (KREAD, mapfd (fd), loc (b), 1, intl (0), junk, rc)
   if (rc == 0)
      getbyte = b
   else {
      b = EOF
      getbyte = EOF
      }

   return
   end


# getnext --- get next argument, either from STDIN or arg list

   integer function getnext (arg)

   character arg (ARB)

   integer getarg, getlin

   integer count, len
   data count /0/

   if (getarg (1, arg, MAXARG) ~= EOF) {
      count = count + 1
      getnext = getarg (count, arg, MAXARG)
      }
   else {
      len = getlin (arg, STDIN, MAXARG)
      if (len <= 1)
         getnext = EOF
      else {
         arg (len) = EOS
         getnext = len
         }
      }

   return
   end



# getword --- read word from file

   integer function getword (w, fd)
   integer w, fd

   integer getbyte

   include "lk_com.r.i"

   integer hi, lo

   if (Machine == INTEL_8080) {
      call getbyte (lo, fd)
      call getbyte (hi, fd)
      }
   else {
      call getbyte (hi, fd)
      call getbyte (lo, fd)
      }

   w = or (ls (hi, 8), lo)
   getword = w

   return
   end


# get_symbol --- collect symbol info from Infile

   integer function get_symbol (sym, type, val)
   character sym (ARB)
   integer type, val

   include "lk_com.r.i"
   integer getbyte, getword

   integer i, len, stringend

   get_symbol = getword (len, Infile)  # return length of symbol entry
   call getword (type, Infile)
   call getword (val, Infile)

   i = 1
   for (len = len - 4; len > 1; len = len - 1) {
      call getbyte (sym (i), Infile)
      sym (i) = and (sym (i), :177)
      i = i + 1
      }
   sym (i) = EOS

   if (getbyte (stringend, Infile) == EOF || stringend ~= 0)
      call error ("Can't happen: symbol section garbled.")

   return
   end


# initialize --- set up everything

   subroutine initialize

   include "lk_com.r.i"
   integer create, next_file

   integer i, junk
   string outfile_name "l.out"

   Symtop = 0
   call dsinit (MEMSIZE)

   Mode = INCLUDEMODE
   Machine = NO_MACHINE
   First_time = YES

   Outfile = create (outfile_name, READWRITE)
   if (Outfile == ERR)
      call error ("Can't create output file.")
   Seg_start (Outfile) = 0

   call putbyte (TEXTCODE, Outfile)
   for (i = 2; i <= HEADER_LENGTH; i = i + 1)
      call putbyte (0, Outfile)

   if (next_file (junk) == EOF)
      call error ("Usage: lk -(6800 | 8080) {[-(i | l | n)] file}.")
   else if (Machine == NO_MACHINE)
      call error ("Usage: lk -(6800 | 8080) {[-(i | l | n)] file}.")

   return
   end


# link --- link in current block with object file

   subroutine link

   include "lk_com.r.i"
   integer copy_text, lookup, get_symbol, getbyte

   character newsym_sym (MAXLINE)
   integer b, i, junk, l, newsym_typ, newsym_val
   integer text_size, len, posn

   call seek (Seg_start (Infile), Infile)
   if (Mode == NAMELISTMODE) {
      posn = Seg_start (Infile)

      for (i = 1; i <= 2; i = i + 1) {
         call getbyte (b, Infile)
         call getword (len, Infile)
         posn = posn + 3 + len
         call seek (posn, Infile)
         }

      while (getbyte (b, Infile) == SYMBOLCODE) {
         call get_symbol (newsym_sym, newsym_typ, newsym_val)
         if (newsym_typ ~= EXTERNAL) {       # new symbol defined
            newsym_typ = ABSOLUTE
            l = lookup (newsym_sym)          # look for old symbol of same name
            if (l == ERR)
               next
            else if (Sym_typ (l) == EXTERNAL) {
               call chainback (Sym_val (l), newsym_val, newsym_typ)
               Sym_typ (l) = newsym_typ
               Sym_val (l) = newsym_val
               }
            }
         }
      }
   else {
      text_size = copy_text (junk)
      call update_rbits (text_size) # update relocation bits; correct text

      while (getbyte (b, Infile) == SYMBOLCODE) {
         call get_symbol (newsym_sym, newsym_typ, newsym_val)
         if (newsym_typ == RELOCATABLE
          || newsym_typ == EXTERNAL & newsym_val ~= LAMBDA)
            newsym_val = newsym_val + Seg_start (Outfile)
         l = lookup (newsym_sym)          # look for old symbol of same name
         if (newsym_typ ~= EXTERNAL) {       # new symbol defined
            if (l == ERR)                       # first time we've seen it
               call enter (newsym_sym, newsym_typ, newsym_val)
            else if (Sym_typ (l) == EXTERNAL) { # old symbol external
               call chainback (Sym_val (l), newsym_val, newsym_typ)
               Sym_typ (l) = newsym_typ
               Sym_val (l) = newsym_val
               }
            else
               call print (ERROUT, "Doubly defined: *s*n.", Mem (Sym_sym (l)) )
            }
         else {                              # new symbol is external
            call fix_chain (newsym_val)
            if (l == ERR)                       # first time we've seen it
               call enter (newsym_sym, newsym_typ, newsym_val)
            else if (Sym_typ (l) ~= EXTERNAL)   # old symbol defined
               call chainback (newsym_val, Sym_val (l), Sym_typ (l))
            else {                              # old symbol external
               call connect (newsym_val, Sym_val (l))
               Sym_val (l) = newsym_val
               }
            }
         }
      Seg_start (Outfile) = Seg_start (Outfile) + text_size
      }

   call xseek (Seg_start (Outfile), Outfile)

   return
   end


# lookup --- return location of symbol in the symbol table, or ERR

   integer function lookup (sym)
   character sym (ARB)

   include "lk_com.r.i"
   integer equal

   integer i

   lookup = ERR      # guilty until proven innocent

   for (i = 1; i <= Symtop; i = i + 1) {
      if (equal (sym, Mem (Sym_sym (i))) == YES) {
         if (Sym_typ (i) == ALIAS)
            lookup = Sym_val (i)
         else
            lookup = i
         break
         }
      }

   return
   end


# next_file --- process arguments; get next file name & open it

   integer function next_file (junk)
   integer junk

   include "lk_com.r.i"
   integer equal, getnext, open

   character arg (MAXLINE)

   string m6800_flag "-6800"
   string i8080_flag "-8080"
   string incflag "-i"
   string libflag "-l"
   string nameflag "-n"

   repeat {
      if (getnext (arg) == EOF) {
         next_file = EOF
         return
         }
      else if (equal (arg, m6800_flag) == YES) {
         Machine = MOTOROLA_6800
         next
         }
      else if (equal (arg, i8080_flag) == YES) {
         Machine = INTEL_8080
         next
         }
      else if (equal (arg, incflag) == YES) {
         Mode = INCLUDEMODE
         next
         }
      else if (equal (arg, libflag) == YES) {
         Mode = LIBMODE
         next
         }
      else if (equal (arg, nameflag) == YES) {
         Mode = NAMELISTMODE
         next
         }
      else
         break
      }

   Infile = open (arg, READ)
   if (Infile == ERR)
      call cant (arg)
DEBUG call print(ERROUT, "open: *s*n.", arg)
   Seg_start (Infile) = 0

   next_file = OK
   return
   end


# next_segment --- seek to end of object segment; set Seg_start (Infile)
   subroutine next_segment

   include "lk_com.r.i"
   integer getbyte, getword

   integer len, posn, type

   posn = Seg_start (Infile)
   call seek (posn, Infile)
   if (getbyte (type, Infile) == EOF)
      call error ("Can't happen: no segment.")

   repeat {
      call getword (len, Infile)    # skip this part
      posn = posn + 3 + len
      call seek (posn, Infile)

      if (getbyte (type, Infile) == EOF)
         break          # Seg_start is wrong, but open_segment fixes it
      if (type == TEXTCODE) {       # start of segment we want
         call seek (posn, Infile)  # get back to start
         Seg_start (Infile) = posn
         break
         }
      }

   return
   end


# open_segment --- open next object segment and verify

   integer function open_segment (junk)
   integer junk

   include "lk_com.r.i"
   integer getbyte, next_file

   integer type

   while (getbyte (type, Infile) == EOF) {
      call close (Infile)
      if (next_file (junk) == EOF) {
         open_segment = EOF
         return
         }
      }

   if (type ~= TEXTCODE)
      call error ("Format error in link segment.")

   open_segment = OK
   return
   end


# putbyte --- write byte out to file

   subroutine putbyte (b, fd)
   integer b, fd

   integer w, junk
   integer mapfd

   w = rt (b, 8)
   call prwf$$ (KWRIT, mapfd (fd), loc (w), 1, intl (0), junk, junk)

   return
   end


# putrel --- set a bit in the relocation bit map

   subroutine putrel (reloc, address)
   integer reloc, address

   include "lk_com.r.i"

   integer word, mask

   word = address / 8 + 1
   mask = ls (1, 7 - mod (address, 8))

   if (reloc == RELOCATABLE)
      Rmap (word) = or (Rmap (word), mask)
   else
      Rmap (word) = and (Rmap (word), not (mask))

   return
   end


# putword --- put word out on file

   subroutine putword (w, fd)
   integer w, fd

   include "lk_com.r.i"

   if (Machine == INTEL_8080) {
      call putbyte (rt (w, 8), fd)
      call putbyte (rs (w, 8), fd)
      }
   else {
      call putbyte (rs (w, 8), fd)
      call putbyte (rt (w, 8), fd)
      }

   return
   end


# reloc --- relocate word at addr in Outfile (add offset to word at addr)

   subroutine reloc (addr, offset)
   integer addr, offset

   include "lk_com.r.i"

   integer w

   call xseek (addr, Outfile)
   call getword (w, Outfile)
   w = w + offset
   call xseek (addr, Outfile)
   call putword (w, Outfile)

   return
   end


# sdup --- duplicate string in dynamic memory

   pointer function sdup (str)
   character str (ARB)

   include "lk_com.r.i"

   integer p
   integer length, dsget

   p = dsget (length (str) + 1)
   call scopy (str, 1, Mem, p)

   sdup = p
   return
   end


# seek --- seek to given position in fd

   subroutine seek (posn, fd)
   integer posn, fd

   integer junk
   integer mapfd

   call prwf$$ (KPOSN + KPREA, mapfd (fd), loc (0), 0, intl (posn),
      junk, junk)

   return
   end


# segment_useful --- return YES if block contains symbols we need

   integer function segment_useful (junk)
   integer junk

   include "lk_com.r.i"
   integer getbyte, getword, get_symbol, lookup

   integer l, len, newsym_typ, newsym_val, posn, type
   character newsym_sym (MAXLINE)

   posn = Seg_start (Infile)
   call seek (posn, Infile)
   if (getbyte (type, Infile) == EOF)
      call error ("Can't happen: no segment.")

   repeat {
      if (type ~= SYMBOLCODE) {     # skip
         call getword (len, Infile)
         posn = posn + 3 + len
         call seek (posn, Infile)
         }
      else {
         len = get_symbol (newsym_sym, newsym_typ, newsym_val)
         posn = posn + 3 + len
         if (newsym_typ ~= EXTERNAL) {
            l = lookup (newsym_sym)
            if (l ~= ERR)
               if (Sym_typ (l) == EXTERNAL) {
                  segment_useful = YES
                  return
                  }
            }
         }
      if (getbyte (type, Infile) == EOF)
         break
      } until (type == TEXTCODE)

   segment_useful = NO
   return
   end


# update_rbits --- handle relocation segment; correct text

   subroutine update_rbits (text_size)

   integer getbyte, getword
   include "lk_com.r.i"

   integer text_count, i, len, place_count, rbyte, text_size, typ

   if (getbyte (typ, Infile) ~= EOF) {
      call getword (len, Infile)
      text_count = text_size
      place_count = Seg_start (Outfile)
      for ( ; len > 0; len = len - 1) {
         call getbyte (rbyte, Infile)
         for (i = 7; i >= 0 & text_count > 0; i = i - 1) {
            if (and (rbyte, ls (1, i)) ~= 0) {
               call putrel (RELOCATABLE, place_count)
               call reloc (place_count, Seg_start (Outfile))
               }
            else
               call putrel (ABSOLUTE, place_count) # not relocatable
            place_count = place_count + 1
            text_count = text_count - 1
            }
         }
      return
      }
   call error ("Unexpected EOF in relocation section.")

   return
   end


# unresolved --- return YES if there are still some unresolved externals

   integer function unresolved (junk)
   integer junk

   include "lk_com.r.i"

   integer i

   unresolved = NO                     # assume the best

   for (i = 1; i <= Symtop; i = i + 1)
      if (Sym_typ (i) == EXTERNAL) {
         unresolved = YES
         break
         }

   return
   end


# xseek --- seek in file fd, skipping header

   subroutine xseek (posn, fd)
   integer posn

   include "lk_com.r.i"

   call seek (posn + HEADER_LENGTH, fd)

   return
   end
