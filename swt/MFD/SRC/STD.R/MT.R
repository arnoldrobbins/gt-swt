# mt --- Software Tools Subsystem magnetic tape interface

   include "mt_def.r.i"
   include MT_COMMON

   ARG_DECL
   integer csw, file, mode, rec
   integer blk_spec, conv_spec, check_blk, check_unit, pos_spec,
         position, read_write, unit_spec
   string usage _
      "Usage: mt [<unit>] [-p <pos>] [-(r|w) [-b <block>] [-c <conv>] {<file>}] [-v]"

   procedure bomb forward

   if (unit_spec (Unit) == ERR)     # get unit number, if specified
      call error (usage)

   if (check_unit (csw) == ERR)     # see if drive is usable
      bomb

   PARSE_COMMAND_LINE ("p<rs>b<rs>c<rs>n<ign>rwv"s, usage)

   if (ARG_PRESENT (r) && ARG_PRESENT (w))
      call error (usage)

   Conv = DEFAULT_CONV
   Recsize = DEFAULT_RECSIZE
   Blksize = DEFAULT_BLKSIZE
   Corrected = 0
   Recovered = 0
   Verbose = NO

   if (ARG_PRESENT (v))
      Verbose = YES

   if (ARG_PRESENT (b)   # parse blocking specification
         && blk_spec (ARG_TEXT (b), Recsize, Blksize) == ERR)
      bomb

   if (ARG_PRESENT (c)   # parse conversion specification
         && conv_spec (ARG_TEXT (c), Conv) == ERR)
      bomb

   if (Conv == BINARY)  # binary i/o is done 2 bytes per word
      Blksize = (Blksize + 1) / 2

   if (check_blk (Conv, Recsize, Blksize) == ERR)
      bomb

   if (ARG_PRESENT (p))          # do positioning
      if (pos_spec (ARG_TEXT (p), mode, file, rec) == ERR
            || position (mode, file, rec) == ERR)
         bomb

   Baddr (1) = loc (Buffer_1)    # initialize buffer pointers
   Baddr (2) = loc (Buffer_2)

   if (ARG_PRESENT (r))          # read files from tape
      csw = read_write (READ)
   elif (ARG_PRESENT (w))        # write files to tape
      csw = read_write (WRITE)

   if (csw == ERR)
      bomb

   if (Recovered ~= 0) {
      call print (ERROUT, "*i recovered i/o errors"s, Recovered)
      if (Corrected ~= 0)
         call print (ERROUT, " (*i CRC corrections)"s, Corrected)
      call putch (NEWLINE, ERROUT)
      }

   stop


   # bomb --- exit with error status

      procedure bomb {

      call seterr (1000)
      stop

      }


   end


# ascii_to_ebcdic --- convert ASCII to EBCDIC

   subroutine ascii_to_ebcdic (buf, len)
   character buf (ARB)
   integer len

   integer i
   character table (128)

   data table / _
     8r000,  8r001,  8r002,  8r003,  8r067,  8r055,  8r056,  8r057,
     8r026,  8r005,  8r045,  8r013,  8r014,  8r015,  8r016,  8r017,
     8r020,  8r021,  8r022,  8r023,  8r074,  8r075,  8r062,  8r046,
     8r030,  8r031,  8r077,  8r047,  8r034,  8r035,  8r036,  8r037,
     8r100,  8r132,  8r177,  8r173,  8r133,  8r154,  8r120,  8r175,
     8r115,  8r135,  8r134,  8r116,  8r153,  8r140,  8r113,  8r141,
     8r360,  8r361,  8r362,  8r363,  8r364,  8r365,  8r366,  8r367,
     8r370,  8r371,  8r172,  8r136,  8r114,  8r176,  8r156,  8r157,
     8r174,  8r301,  8r302,  8r303,  8r304,  8r305,  8r306,  8r307,
     8r310,  8r311,  8r321,  8r322,  8r323,  8r324,  8r325,  8r326,
     8r327,  8r330,  8r331,  8r342,  8r343,  8r344,  8r345,  8r346,
     8r347,  8r350,  8r351,  8r112,  8r340,  8r117,  8r137,  8r155,
     8r171,  8r201,  8r202,  8r203,  8r204,  8r205,  8r206,  8r207,
     8r210,  8r211,  8r221,  8r222,  8r223,  8r224,  8r225,  8r226,
     8r227,  8r230,  8r231,  8r242,  8r243,  8r244,  8r245,  8r246,
     8r247,  8r250,  8r251,  8r300,  8r152,  8r320,  8r241,  8r007/

   do i = 1, len
      buf (i) = table (and (buf (i), 127) + 1)

   return
   end


# blk_spec --- parse blocking specification argument for mt

   integer function blk_spec (str, recsz, blksz)
   integer recsz, blksz
   character str (ARB)

   integer i
   integer ctoi

   i = 1
   recsz = ctoi (str, i)
   if (str (i) == '/'c || str (i) == '.'c) {
      i += 1
      blksz = ctoi (str, i) * recsz
      }
   else
      blksz = recsz

   if (str (i) ~= EOS) {
      call remark ("syntax:  -b <record size>[/<blocking factor>]"s)
      return (ERR)
      }

   return (OK)
   end


# check_blk --- check validity of block size

   integer function check_blk (conv, recsz, blksz)
   integer conv, recsz, blksz

   integer maxb, maxw

   if (conv == BINARY) {
      maxw = MAX_BLKSIZE
      maxb = MAX_BLKSIZE * 2
      }
   else {
      maxw = MAX_BLKSIZE - 1
      maxb = maxw
      }

   if (blksz > maxw) {
      call print (ERROUT, "maximum block size is *i bytes*n"s, maxb)
      return (ERR)
      }

   return (OK)
   end


# pos_spec --- parse positioning arguments

   integer function pos_spec (str, mode, file, rec)
   character str (ARB)
   integer mode, file, rec

   integer i
   integer ctoi

   if (str (1) == '+'c || str (1) == '-'c) {
      if (str (1) == '+'c)
         mode = FORWARD
      else
         mode = REVERSE
      i = 2
      }
   else {
      mode = ABSOLUTE
      i = 1
      }

   file = ctoi (str, i)
   if (file == 0 && mode == ABSOLUTE)
      file = 1

   if (str (i) == '.'c || str (i) == '/'c) {
      i += 1
      rec = ctoi (str, i)
      }
   else
      rec = 0

   if (rec == 0 && mode == ABSOLUTE)
      rec = 1

   if (str (i) ~= EOS) {
      call remark ("syntax:  -p [+|-]<file number>[/<block number>]"s)
      return (ERR)
      }

   return (OK)
   end


# check_unit --- check validity and usability of specified tape drive

   integer function check_unit (csw)
   integer csw

   include MT_COMMON

   integer mtscheck, mtstat

   csw = 0
   select
      when (Unit < MIN_UNIT || Unit > MAX_UNIT)
         call print (ERROUT, "units are *i to *i*n"s, MIN_UNIT, MAX_UNIT)
      when (mtscheck (mtstat (csw)) == ERR)
         ;
      ifany
         return (ERR)

   return (OK)
   end


# conv_spec --- parse conversion specification argument for mt

   integer function conv_spec (str, conv)
   integer conv
   character str (ARB)

   select (str (1))
      when ('a'c, 'A'c)
         conv = ASCII
      when ('b'c, 'B'c)
         conv = BINARY
      when ('e'c, 'E'c)
         conv = EBCDIC
   else {
      call remark ("syntax:  -c (a[scii] | b[inary] | e[bcdic])"s)
      return (ERR)
      }

   return (OK)
   end


# ebcdic_to_ascii --- translate EBCDIC to internal ASCII

   subroutine ebcdic_to_ascii (buf, len)
   character buf (ARB)
   integer len

   character table (256)
   integer i

   define (o,8r77)   # '?'c without parity

   data table / _
      NUL ,   SOH ,   STX ,   ETX ,      o,   HT  ,      o,   DEL ,
         o,      o,      o,   VT  ,   FF  ,   CR  ,   SO  ,   SI  ,
      DLE ,   DC1 ,   DC2 ,   DC3 ,      o,      o,   BS  ,      o,
      CAN ,   EM  ,      o,      o,   FS  ,   GS  ,   RS  ,   US  ,
         o,      o,      o,      o,      o,   LF  ,   ETB ,   ESC ,
         o,      o,      o,      o,      o,   ENQ ,   ACK ,   BEL ,
         o,      o,   SYN ,      o,      o,      o,      o,   EOT ,
         o,      o,      o,      o,   DC4 ,   NAK ,      o,   SUB ,
      ' 'c,      o,      o,      o,      o,      o,      o,      o,
         o,      o,   '['c,   '.'c,   '<'c,   '('c,   '+'c,   ']'c,
      '&'c,      o,      o,      o,      o,      o,      o,      o,
         o,      o,   '!'c,   '$'c,   '*'c,   ')'c,   ';'c,   '^'c,
      '-'c,   '/'c,      o,      o,      o,      o,      o,      o,
         o,      o,   '|'c,   ','c,   '%'c,   '_'c,   '>'c,   '?'c,
         o,      o,      o,      o,      o,      o,      o,      o,
         o,   '`'c,   ':'c,   '#'c,   '@'c,   "'"c,   '='c,   '"'c,
         o,   'a'c,   'b'c,   'c'c,   'd'c,   'e'c,   'f'c,   'g'c,
      'h'c,   'i'c,      o,      o,      o,      o,      o,      o,
         o,   'j'c,   'k'c,   'l'c,   'm'c,   'n'c,   'o'c,   'p'c,
      'q'c,   'r'c,      o,      o,      o,      o,      o,      o,
         o,   '~'c,   's'c,   't'c,   'u'c,   'v'c,   'w'c,   'x'c,
      'y'c,   'z'c,      o,      o,      o,      o,      o,      o,
         o,      o,      o,      o,      o,      o,      o,      o,
         o,      o,      o,      o,      o,      o,      o,      o,
      '{'c,   'A'c,   'B'c,   'C'c,   'D'c,   'E'c,   'F'c,   'G'c,
      'H'c,   'I'c,      o,      o,      o,      o,      o,      o,
      '}'c,   'J'c,   'K'c,   'L'c,   'M'c,   'N'c,   'O'c,   'P'c,
      'Q'c,   'R'c,      o,      o,      o,      o,      o,      o,
      '\'c,      o,   'S'c,   'T'c,   'U'c,   'V'c,   'W'c,   'X'c,
      'Y'c,   'Z'c,      o,      o,      o,      o,      o,      o,
      '0'c,   '1'c,   '2'c,   '3'c,   '4'c,   '5'c,   '6'c,   '7'c,
      '8'c,   '9'c,      o,      o,      o,      o,      o,      o/

   undefine (o)

   do i = 1, len
      buf (i) = table (buf (i) + 1)

   return
   end


# getbuf --- read and convert one buffer from disk file

   integer function getbuf (bufn, fd)
   integer bufn, fd

   include MT_COMMON

   character fill
   integer nb, nw, i
   integer readf, readln

   if (Conv == BINARY) {
      select (bufn)
         when (1) {
            nw = readf (Buffer_1, Blksize, fd)
            if (nw <= 0)
               return (EOF)
            while (nw < Blksize) {
               nw += 1
               Buffer_1 (nw) = BINARY_FILL
               }
            Buflen (1) = Blksize
            }
         when (2) {
            nw = readf (Buffer_2, Blksize, fd)
            if (nw <= 0)
               return (EOF)
            while (nw < Blksize) {
               nw += 1
               Buffer_2 (nw) = BINARY_FILL
               }
            Buflen (2) = Blksize
            }
      }

   else {      # we are reading a text file
      select (bufn)
         when (1) {
            for (nb = 0; nb < Blksize; nb += Recsize)
               if (readln (fd, Buffer_1 (nb + 1), Recsize) == EOF)
                  break
            if (nb == 0)
               return (EOF)
            select (Conv)
               when (ASCII) {
                  fill = ASCII_FILL
                  do i = 1, nb
                     Buffer_1 (i) &= 8r177
                  }
               when (EBCDIC) {
                  fill = EBCDIC_FILL
                  call ascii_to_ebcdic (Buffer_1, nb)
                  }
            while (nb < Blksize) {
               nb += 1
               Buffer_1 (nb) = fill
               }
            Buflen (1) = Blksize
            }
         when (2) {
            for (nb = 0; nb < Blksize; nb += Recsize)
               if (readln (fd, Buffer_2 (nb + 1), Recsize) == EOF)
                  break
            if (nb == 0)
               return (EOF)
            select (Conv)
               when (ASCII) {
                  fill = ASCII_FILL
                  do i = 1, nb
                     Buffer_2 (i) &= 8r177
                  }
               when (EBCDIC) {
                  fill = EBCDIC_FILL
                  call ascii_to_ebcdic (Buffer_2, nb)
                  }
            while (nb < Blksize) {
               nb += 1
               Buffer_2 (nb) = fill
               }
            Buflen (2) = Blksize
            }
      }

DB {
DB    local junk, code
DB    integer junk, code
DB    call prwf$$ (2, 3, Baddr (bufn), Buflen (bufn), intl (0),
DB          junk, code)
DB    }

   return (OK)
   end


# mtscheck --- check for unit online and ready

   integer function mtscheck (csw)
   integer csw

   select
      when (~ ONLINE (csw))
         call remark ("drive is off line"s)
      when (~ READY (csw))
         call remark ("drive is not ready"s)
      ifany
         return (ERR)

   return (OK)
   end


# mtcheck --- check for errors and retry if necessary

   integer function mtcheck (rw, bufn, csw)
   integer rw, bufn, csw

   include MT_COMMON

   integer r
   integer mtscheck, mtstat
   logical corr

   procedure print_error_bits forward
   procedure retry forward

   call mtwait (Bufstat (1, bufn))
   csw = Bufstat (CSW, bufn)
   if (mtscheck (csw) == ERR)
      return (ERR)
   if (~ ERROR_BITS (csw)) {
      Bufok (bufn) = YES
      Buflen (bufn) = Bufstat (NWR, bufn)
      return (OK)
      }

   corr = FALSE         # don't try CRC correction yet
   do r = 1, MAX_RETRYS; {
      call mtskipr (REVERSE)
      retry
      }

   do r = 1, MAX_RETRYS; {
      call mtskipr (REVERSE)
      if (~ AT_BOT (mtstat (csw))) {
         call mtskipr (REVERSE)     # draw bad spot across tape cleaner
         call mtskipr (FORWARD)
         }
      retry
      }

   if (rw == READ) {    # now try CRC correction
      corr = TRUE
      retry
      }

   call print (ERROUT, "Block *5,-10i:"s, Block)
   print_error_bits
   call remark (" Unrecovered"s)
   Bufok (bufn) = NO

   return (OK)


   # print_error_bits --- display error status in readable form

      procedure print_error_bits {

      if (VPERR (csw))        call putlin (" VPE"s, ERROUT)
      if (RUNAWAY (csw))      call putlin (" RUN"s, ERROUT)
      if (CRCERR (csw))       call putlin (" CRC"s, ERROUT)
      if (LRCERR (csw))       call putlin (" LRC"s, ERROUT)
      if (DMARANGE (csw))     call putlin (" DMA"s, ERROUT)
      if (UNCERR (csw))       call putlin (" UNC"s, ERROUT)
      if (RAWERR (csw))       call putlin (" RAW"s, ERROUT)

      }


   # retry --- retry the troublesome operation

      procedure retry {

      call mtio (rw, bufn, corr)       # retry operation
      call mtwait (Bufstat (1, bufn))  # wait for it to finish

      csw = Bufstat (CSW, bufn)        # get status word
      if (mtscheck (csw) == ERR)       # check for ONLINE and READY
         return (ERR)

      if (~ ERROR_BITS (csw)) {        # block successfully transferred
         Recovered += 1
         if (corr)
            Corrected += 1
         Bufok (bufn) = YES
         Buflen (bufn) = Bufstat (NWR, bufn)
         return (OK)
         }

      }

   end


# mtio --- perform raw i/o operations for mt

   subroutine mtio (rw, bufn, corr)
   integer rw, bufn
   logical corr

   include MT_COMMON

   integer instr, len

   select (rw)
      when (READ) {
         len = MAX_BLKSIZE
         if (Conv == BINARY)
            instr = NTREAD2
         else
            instr = NTREAD1
         if (corr)
            instr ^= NTCORRBIT
         }
      when (WRITE) {
         len = Buflen (bufn)
         if (Conv == BINARY)
            instr = NTWRITE2
         else
            instr = NTWRITE1
         }

   call t$mt (Unit, Baddr (bufn), len, instr, Bufstat (1, bufn))

   return
   end


# mtread --- perform read operations for mt

   integer function mtread (fd)
   integer fd

   include MT_COMMON

   integer bufn, csw
   integer on_eofr, on_eovr, mtcheck

   Block = 1
   bufn = 1

   call mtio (READ, bufn, FALSE)    # read first block
   while (mtcheck (READ, bufn, csw) ~= ERR) {
      if (AT_EOF (csw))             # check for end of file
         return (on_eofr (csw))
      if (AT_EOT (csw)) {           # check for end of reel
         if (on_eovr (csw) == ERR)
            break
         call mtrewind
         call new_reel (READ)
         }
      call mtio (READ, NEXT_BUF (bufn), FALSE)  # start reading next blk
#     if (Bufok (bufn) ~= NO)    # now process previous block
         call putbuf (bufn, fd)
      bufn = NEXT_BUF (bufn)
      Block += 1
      }

   return (ERR)
   end


# mtrewind --- rewind tape

   subroutine mt_rewind

   include MT_COMMON

   integer status (8)
   save status

   call t$mt (Unit, loc (0), 0, REWIND, status)

   return
   end


# mtskipf --- seek in either direction for file mark

   subroutine mtskipf (direction)
   integer direction

   include MT_COMMON

   integer instr, status (8)
   save status

   if (direction == FORWARD)
      instr = NTSKIPF
   else
      instr = NTBACKF

   call t$mt (Unit, loc (0), 0, instr, status)

   return
   end


# mtskipr --- skip one record, forward or reverse

   subroutine mtskipr (direction)
   integer direction

   include MT_COMMON

   integer instr, status (8)
   save status

   if (direction == REVERSE)
      instr = NTBACKR
   else
      instr = NTSKIPR

   call t$mt (Unit, loc (0), 0, instr, status)

   return
   end


# mtstat --- read status of tape drive

   integer function mtstat (csw)
   integer csw

   include MT_COMMON

   integer status (8)
   save status

   call t$mt (Unit, loc (0), 0, READ_STATUS, status)
   if (REWINDING (status (CSW))) {
      call mtrewind  # will hang until previous rewind is done
      call t$mt (Unit, loc (0), 0, READ_STATUS, status)
      }

   csw = status (CSW)

   return (csw)
   end


# mtwait --- wait for previous operation to complete

   subroutine mtwait (notdone)
   bool notdone

   integer csw

   while (notdone)
      call mtstat (csw)

   return
   end


# mtwrite --- perform write operations for mt

   integer function mtwrite (fd)
   integer fd

   include MT_COMMON

   integer csw, bufn, stat
   integer getbuf, mtcheck, on_eofw, on_eovw

   Block = 1
   bufn = 1

   stat = getbuf (bufn, fd)
   while (stat ~= EOF) {
      call mtio (WRITE, bufn, FALSE)
      stat = getbuf (NEXT_BUF (bufn), fd)
      if (mtcheck (WRITE, bufn, csw) == ERR)
         return (ERR)
      if (AT_EOT (csw)) {     # end of reel sensed
         if (stat == EOF && on_eofw (csw) == ERR
               || on_eovw (csw) == ERR)
            return (ERR)
         call mtrewind
         if (stat ~= EOF)
            call new_reel (WRITE)
         else
            return (OK)
         }
      bufn = NEXT_BUF (bufn)
      Block += 1
      }

   return (on_eofw (csw))
   end


# mtfmark --- write a file mark

   subroutine mtfmark

   include MT_COMMON

   integer status (8)
   save status

   call t$mt (Unit, loc (0), 0, NTFMARK, status)

   return
   end


# new_reel --- prompt user to mount a new reel

   subroutine new_reel (rw)
   integer rw

   include MT_COMMON

   integer csw
   integer input, check_unit

   repeat {
      while (input (STDIN, "unit: *i"s, Unit) == EOF)
         ;
      select
         when (check_unit (csw) == ERR)
            ;
         when (AT_EOT (csw))
            call remark ("tape is at end of reel"s)
         when (rw == WRITE && FILE_PROTECT (csw))
            call remark ("tape is write protected"s)
         when (rw == WRITE && IN_MID_FILE (csw))
            call remark ("tape is in mid file"s)
      else
         break
      }

   return
   end


# on_eofr --- do end of file processing for read operations

   integer function on_eofr (csw)
   integer csw

   csw = 0

   return (OK)
   end


# on_eofw --- do end of file processing for write operations

   integer function on_eofw (csw)
   integer csw

   integer mtstat, mtscheck

   call mtfmark
   call mtfmark
   if (mtscheck (mtstat (csw)) == ERR)
      return (ERR)
   call mtskipf (REVERSE)

   return (mtscheck (mtstat (csw)))
   end


# on_eovr --- do end of volume processing for read operations

   integer function on_eovr (csw)
   integer csw

   csw = 0
   return (OK)

   end


# on_eovw --- do end of volume processing for write operations

   integer function on_eovw (csw)
   integer csw

   integer mtscheck, mtstat

   call mtfmark
   call mtfmark

   return (mtscheck (mtstat (csw)))
   end


# position --- do tape positioning for mt

   integer function position (mode, file, rec)
   integer mode, file, rec

   include MT_COMMON

   integer i, csw
   integer mtstat, mtscheck

   select (mode)
      when (ABSOLUTE) {
         call mtrewind
         for (i = 1; i < file; i += 1) {
            if (mtscheck (mtstat (csw)) == ERR)
               return (ERR)
            if (AT_EOT (csw)) {
               call remark ("end of tape"s)
               return (ERR)
               }
            call mtskipf (FORWARD)
            }
         for (i = 1; i < rec; i += 1) {
            if (mtscheck (mtstat (csw)) == ERR)
               return (ERR)
            select
               when (AT_EOT (csw))
                  call remark ("end of tape"s)
               when (i > 1 && AT_EOF (csw))
                  call remark ("end of file"s)
               ifany
                  return (ERR)
            call mtskipr (FORWARD)
            }
         }
      when (FORWARD) {
         for (i = 1; i <= file; i += 1) {
            if (mtscheck (mtstat (csw)) == ERR)
               return (ERR)
            if (AT_EOT (csw)) {
               call remark ("end of tape"s)
               return (ERR)
               }
            call mtskipf (FORWARD)
            }
         for (i = 1; i <= rec; i += 1) {
            if (mtscheck (mtstat (csw)) == ERR)
               return (ERR)
            select
               when (AT_EOT (csw))
                  call remark ("end of tape"s)
               when (i > 1 && AT_EOF (csw))
                  call remark ("end of file"s)
               ifany
                  return (ERR)
            call mtskipr (FORWARD)
            }
         }
      when (REVERSE) {
         if (file ~= 0 || rec == 0)
            call mtskipf (REVERSE)
         for (i = 1; i <= file; i += 1) {
            if (mtscheck (mtstat (csw)) == ERR)
               return (ERR)
            if (AT_BOT (csw)) {
               call remark ("beginning of tape"s)
               return (ERR)
               }
            call mtskipf (REVERSE)
            }
         if (rec == 0 && ~ AT_BOT (mtstat (csw)))
            call mtskipf (FORWARD)
         else
            for (i = 1; i <= rec; i += 1) {
               if (mtscheck (mtstat (csw)) == ERR)
                  return (ERR)
               select
                  when (AT_BOT (csw))
                     call remark ("beginning of tape"s)
                  when (i > 1 && AT_EOF (csw))
                     call remark ("beginning of file"s)
                  ifany
                     return (ERR)
               call mtskipr (REVERSE)
               }
         }

   if (mtscheck (mtstat (csw)) == ERR)
      return (ERR)

   return (OK)
   end


# putbuf --- convert, deblock and write one buffer to disk file

   subroutine putbuf (bufn, fd)
   integer bufn, fd

   include MT_COMMON

   integer nb

   if (Conv == BINARY) {
      select (bufn)
         when (1)
            call writef (Buffer_1, Buflen (1), fd)
         when (2)
            call writef (Buffer_2, Buflen (2), fd)
      }

   else {
      select (bufn)
         when (1) {
            if (Conv == ASCII)
               for (nb = 1; nb <= Buflen (1); nb += 1)
                  Buffer_1 (nb) |= 8r200
            else
               call ebcdic_to_ascii (Buffer_1, Buflen (1))
            for (nb = 0; nb + Recsize <= Buflen (1); nb += Recsize)
               call writeln (fd, Buffer_1 (nb + 1), Recsize)
            if (nb < Buflen (1))
               call writeln (fd, Buffer_1 (nb + 1), Buflen (1) - nb)
            }
         when (2) {
            if (Conv == ASCII)
               for (nb = 1; nb <= Buflen (2); nb += 1)
                  Buffer_2 (nb) |= 8r200
            else
               call ebcdic_to_ascii (Buffer_2, Buflen (2))
            for (nb = 0; nb + Recsize <= Buflen (2); nb += Recsize)
               call writeln (fd, Buffer_2 (nb + 1), Recsize)
            if (nb < Buflen (2))
               call writeln (fd, Buffer_2 (nb + 1), Buflen (2) - nb)
            }
      }

   return
   end


# read_write --- perform read/write operations for mt

   integer function read_write (rw)
   integer rw

   include MT_COMMON

   integer fd, csw, stat, state (4)
   integer gfnarg, create, open, mtread, mtwrite, mtstat, equal
   character arg (MAXLINE)

   if (AT_EOT (mtstat (csw))) {
      call remark ("tape is at end of reel"s)
      return
      }
   if (rw == WRITE)
      select
         when (FILE_PROTECT (csw))
            call remark ("tape is not writable"s)
         when (IN_MID_FILE (csw))
            call remark ("tape is in mid-file"s)
         ifany
            return

   stat = OK
   state (1) = 1
   while (stat ~= ERR)
      select (gfnarg (arg, state))
         when (EOF)
            break
         when (ERR) {
            call print (ERROUT, "*s: bad file name*n"s, arg)
            stat = ERR
            }
         when (OK)
            if (rw == READ) {    # tape to disk
               select
                  when (equal (arg, "/dev/stdin1"s) ~= NO)
                     call scopy ("/dev/stdout1"s, 1, arg, 1)
                  when (equal (arg, "/dev/stdin2"s) ~= NO)
                     call scopy ("/dev/stdout2"s, 1, arg, 1)
                  when (equal (arg, "/dev/stdin3"s) ~= NO)
                     call scopy ("/dev/stdout3"s, 1, arg, 1)
               fd = create (arg, WRITE)
               if (fd == ERR) {
                  stat = ERR
                  call print (ERROUT, "*s: can't create*n"s, arg)
                  }
               else {
                  stat = mtread (fd)
                  call close (fd)
                  if (Verbose == YES)
                     call print (ERROUT, "*s: *i blocks read from tape*n"s,
                           arg, Block - 1)
                  }
               }
            else {               # disk to tape
               fd = open (arg, READ)
               if (fd == ERR) {
                  call print (ERROUT, "*s: can't open*n"s, arg)
                  stat = ERR
                  }
               else {
                  stat = mtwrite (fd)
                  call close (fd)
                  if (Verbose == YES)
                     call print (ERROUT, "*s: *i blocks written to tape *n"s,
                           arg, Block - 1)
                  }
               }


   return (stat)
   end


# readln --- character read primitive

   integer function readln (fd, buf, len)
   integer fd, buf (ARB), len

   integer getlin
   bool long_line
   data long_line /FALSE/

   readln = getlin (buf, fd, len + 1)
   if (long_line && readln == 1 && buf (1) == NEWLINE)
      readln = getlin (buf, fd, len + 1)
   if (readln == EOF)
      return

   if (buf (readln) == NEWLINE) {
      long_line = FALSE
      readln -= 1
      }
   else
      long_line = TRUE

   while (readln < len) {
      readln += 1
      buf (readln) = ' 'c
      }

   return
   end


# unit_spec --- parse unit specification argument

   integer function unit_spec (unit)
   integer unit

   integer i
   integer ctoi, getarg
   character arg (MAXARG)

   if (getarg (1, arg, MAXARG) ~= EOF && arg (1) ~= '-'c) {
      i = 1
      unit = ctoi (arg, i)
      if (arg (i) ~= EOS)        # syntax error
         return (ERR)
      call delarg (1)            # get rid of the argument
      }
   else
      unit = DEFAULT_UNIT

   return (OK)
   end


# writeln --- character write primitive

   subroutine writeln (fd, buf, len)
   integer fd, buf (ARB), len

   integer i, temp

   for (i = len; i > 0; i -= 1)
      if (buf (i) ~= ' 'c)
         break

   temp = buf (i + 1)
   buf (i + 1) = EOS
   call putlin (buf, fd)
   buf (i + 1) = temp
   call putch (NEWLINE, fd)

   return
   end
