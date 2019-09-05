# fdmp --- produce formatted file dump

   define (BYTES,1)
   define (CHARS,2)
   define (DECIMAL,4)
   define (HEX,8)
   define (OCTAL,16)
   define (DEFAULT_PERLINE,8)  # number of columns per line of output
   define (CONTROL,'^'c)

   integer mode, next_arg, buf (MAXLINE), fd, count, perline
   integer getarg, open, seekf, get_options, readf
   longint end, seq, start
   character arg (MAXARG)
   bool junk
   bool tquit$


   next_arg = get_options (mode, start, end, perline)
   if (getarg (next_arg, arg, MAXARG) ~= EOF) {
      fd = open (arg, READ)
      if (fd == ERR)
         call cant (arg)
      }
   else
      fd = STDIN

   call break$ (DISABLE)   # disable break-key
   if (seekf (start, fd, ABS) ~= ERR)
      for (seq = start; end == 0 || seq <= end; seq += count) {
         count = readf (buf, perline, fd)
         if (count == EOF)    # end of file
            break
         call put (mode, buf, seq, count)
         if (tquit$ (junk))
            break
         }

   call break$ (ENABLE)    # re-enable break key
   call close (fd)

   stop
   end


# get_options --- process options for fdmp

   integer function get_options (mode, startaddr, endaddr, perline)
   integer mode, perline
   longint startaddr, endaddr

   integer ap, i
   integer getarg, ctoi
   longint gctol
   character arg (MAXARG)

   procedure usage forward


   startaddr = 0
   endaddr = 0
   mode = 0
   perline = DEFAULT_PERLINE
   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1) {
      select (arg (1))
         when ('+'c) {
            i = 2
            startaddr = gctol (arg, i, 10)
            if (i == 2 || arg (i) ~= EOS)
               usage
            }
         when ('-'c) {     # -options or -end_addr
            for (i = 2; arg (i) ~= EOS; i += 1) {
               select (arg (i))
                  when ('b'c, 'B'c)
                     mode |= BYTES
                  when ('c'c, 'C'c)
                     mode |= CHARS
                  when ('d'c, 'D'c)
                     mode |= DECIMAL
                  when ('h'c, 'H'c)
                     mode |= HEX
                  when ('o'c, 'O'c)
                     mode |= OCTAL
                  when ('w'c, 'W'c) {
                     i += 1
                     perline = ctoi (arg, i)
                     i -= 1
                     if (perline < 1 || perline > MAXLINE)
                        perline = DEFAULT_PERLINE
                     }
               else {
                  i = 2
                  endaddr = gctol (arg, i, 10)
                  if (i == 2 || arg (i) ~= EOS)
                     usage
                  break
                  }
               }  # for ...
            }  # when ('-'c) ...
      else
         break
      }  # for ...

   if (mode == 0)    # no format specified, assume OCTAL
      mode = OCTAL

   return (ap)


   # usage --- print usage diagnostic and die

      procedure usage {

         call error ("Usage: fdmp { -bcdho | -w<width> | " _
                     "+<start> | -<end> } [ <file> ]"s)
         }


   end


# put --- interpret contents of buf according to mode

   subroutine put (mode, buf, seq, count)
   integer mode, buf (ARB), count
   longint seq

   integer i, lb, rb, lc, rc
   character mapdn

   procedure put_address (seq, base) forward


   if (and (mode, CHARS) ~= 0) {
      put_address (seq, 8)    # print file address in octal
      do i = 1, count; {
         lb = or (rs (buf (i), 8), 8r200)
         rb = or (rt (buf (i), 8), 8r200)
         if (lb < ' 'c)  {
            lc = CONTROL   # indicate non-printing character
            lb = mapdn (lb + 8r100)
            }
         elif (lb == DEL) {
            lc = CONTROL
            lb = ' 'c
            }
         else
            lc = ' 'c

         if (rb < ' 'c) {
            rc = CONTROL   # indicate non-printing character
            rb = mapdn (rb + 8r100)
            }
         elif (rb == DEL) {
            rc = CONTROL
            rb = ' 'c
            }
         else
            rc = ' 'c

         call print (STDOUT, "  *c*c  *c*c"s, lc, lb, rc, rb)
         }
      call putch (NEWLINE, STDOUT)
      }

   if (and (mode, BYTES) ~= 0) {
      put_address (seq, 8)    # print file address in octal
      do i = 1, count
         call print (STDOUT, " *3,8i *3,8i"s,
                        rs (buf (i), 8), rt (buf (i), 8))
      call putch (NEWLINE, STDOUT)
      }

   if (and (mode, OCTAL) ~= 0) {
      put_address (seq, 8)    # print file address in octal
      do i = 1, count
         call print (STDOUT, "  *6,-8,0i"s, buf (i))
      call putch (NEWLINE, STDOUT)
      }

   if (and (mode, DECIMAL) ~= 0) {
      put_address (seq, 10)   # print file address in decimal
      do i = 1, count
         call print (STDOUT, "  *6i.", buf (i))
      call putch (NEWLINE, STDOUT)
      }

   if (and (mode, HEX) ~= 0) {
      put_address (seq, 16)   # print file address in hex
      do i = 1, count
         call print (STDOUT, "    *4,-16,0i.", buf (i))
      call putch (NEWLINE, STDOUT)
      }


   # put_address --- write seq on STDOUT in specified mode

      procedure put_address (seq, base) {

         longint seq
         integer base

         call print (STDOUT, "*11,#,0l "s, -base, seq)

         }


   return
   end
