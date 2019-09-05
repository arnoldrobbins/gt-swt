define(program, #)
define(PTAR_COM, "ptar_com.r.i")

#  ptar --- read a tar format tape under SWT

   program ptar

   include ARGUMENT_DEFS

   include PTAR_COM

   integer i, dummy, getbuf, len, length, mkdir$
   long_int l, cnt, gctol
   file_des fd, create, comfile
   logical skip
   string filename "_detab.tar.files"
   ARG_DECL


   PARSE_COMMAND_LINE ("x<f> v<f> t<f> f<req str>"s,
         "usage: ptar [-xvt] [-f <file>]"p)

   if (ARG_PRESENT (t))
      skip = TRUE
   else
      skip = FALSE

   if (~ ARG_PRESENT (t))
      comfile = create (filename, WRITE)

   if (~ ARG_PRESENT (t) && comfile == ERR)
      call print (ERROUT, "warning: couldn't create detabing command file*n"s)

   if (~ ARG_PRESENT (t))
      call print (comfile, "shtrace ex*n"s)

   if (ARG_PRESENT (f))
   {
      if (equal (ARG_TEXT (f), "-"s) == YES)
         infile = STDIN
      else
      {
         infile = open (ARG_TEXT (f), READ)
         if (infile == ERR)
         {
            call print (ERROUT, "*s: couldn't open*n"s, ARG_TEXT(f))
            stop
         }
      }
   }
   else
      infile = STDIN

   P = 1
   Block = 1
   while (getbuf(dummy) ~= EOF)
   {
      # tar indicates end of tape by two 0-filled blocks
      if (Name(1) == 0 && getbuf(dummy) ~= EOF)
         if (Name(1) == 0)
            break

      i = 1
      l = gctol (Size, i, 8)

      if (Linkflag ~= '1'c)
      {
         if (ARG_PRESENT (v) || ARG_PRESENT (t))
            call print (STDOUT, "*s, *l bytes*n"s, Name, l)
      }
      else
      {
         if (ARG_PRESENT(v) || ARG_PRESENT (t))
            call print (STDOUT, "*s linked to *s*n"s, Name, Linkname)
         l = 0       # forces loop to not execute, skipping non-existent file
         skip = TRUE
      }


      len = length (Name)

      call fix_name (Name, len)  # change UNIX names to swt names

      len = length (Name)

      if (Name (len) == '/'c)       # file is a directory
      {
         Name (len) = EOS     # lop off slash
         len -= 1

         if (~ ARG_PRESENT (t) && mkdir$(Name, EOS, EOS) == ERR)
            call print (ERROUT, "couldn't make the directory '*s'*n"s, Name)
         skip = TRUE;
      }
      else if (Name (1) ~= EOS)     # regular file, not a truncated "./"
      {
         if (~ ARG_PRESENT (t))
         {
            call print (comfile, "*s> detab +8 | cat >*s*n"s, Name, Name)

            fd = create (Name, READWRITE)
            if (fd == ERR)
            {
               call print (ERROUT, "*s: couldn't create*n"s, Name)
               skip = TRUE;
            }
            else
               skip = FALSE
         }

         for (cnt = 0; cnt < l; cnt += 512)
         {
            call getbuf(dummy)
            if (~ skip && ~ ARG_PRESENT (t))
               call putbuf (fd, l, cnt)
         }

         if (~ skip)
            call close (fd)
      }
      # else
         # do nothing
   }

   if (~ ARG_PRESENT (t))
   {
      call print (comfile, "shtrace*n"s)
      call close (comfile)
      call print (STDOUT, "use *s to remove tabs from new files*n"s, filename)
   }

   if (infile ~= STDIN)
      call close (infile)

   stop
   end

# putbuf -- pack the buffer back, and then write it out

   subroutine putbuf (fd, l, cnt)
   integer fd
   long_int l, cnt

   include PTAR_COM

   long_int i, j, m

   if ((l - cnt) > 512)
      m = 512
   else
      m = l - cnt

   for (i = 1; i <= m; i += 1)
   {
      Pbuf (P) = Tbuf (i)
      P += 1
      # build up a complete line

      if (Tbuf (i) == NEWLINE)
      {
         Pbuf (P) = EOS
         call putlin (Pbuf, fd)     # putlin will do packing for us
         P = 1
      }
   }

   return
   end

#  getbuf --- read the next buffer of information

   integer function getbuf(dummy)
   integer dummy

   integer readf
   integer i, buf(512)

   include PTAR_COM

   # read 256 integers, since that is 512 bytes

   i = readf (buf, 256, infile)
   if (i ~= 256 && i ~= EOF)
   {
      call print (ERROUT, "Error while reading block *l*n"s, Block)
      stop
   }

   if (i == EOF)
      return (EOF)

   Block += 1

   for (i = 1; i <= 256; i += 1)
   {
      Tbuf(2*i-1) = rs(buf(i), 8)   # high byte
      Tbuf(2*i) = rt(buf(i), 8)     # low byte

      if (Tbuf(2*i-1) ~= 0)         # set parity
         Tbuf(2*i-1) |= 8r200

      if (Tbuf(2*i) ~= 0)           # set parity
         Tbuf(2*i) |= 8r200
   }

   return (0)
   end

# check_dig -- check for leadng digits in file name, prepend '_'

   subroutine check_dig(name)
   character name (ARB)

   character nambuf (100)
   integer i, j, length

   j = length (name)
   for (i = j; name (i) ~= '/'c; i -= 1)
         ;

   i += 1
   if (IS_DIGIT (name (i)))
   {
      for(j = j + 2; j > i; j -= 1)
         name (j) = name (j - 1)       # shift right by one to
      name (i) = '_'c                  # fix up for primos
   }

   return
   end

# fix_name -- fix up if Unix path name or other such

   subroutine fix_name (name, len)
   character name (ARB)
   integer len

   integer i, length

   if (name (1) == '/'c)      # absolute path name
   {
      for (i = len + 1; i >= 2; i -= 1)
         name (i) = name (i - 1)
      # now have "//.../...."
      len = length (name)
   }

   # Unix current directory, possible to have "./././...."
   while (name (1) == '.'c && name (2) == '/'c)
   {
      for (i = 3; i <= len + 1; i += 1)
         name (i - 2) = name (i)       # shift name left by two
      len = length (name)
   }

   # Unix parent directory, possible to have "../../....."
   while (name(1) == '.'c && name(2) == '.'c && name(3) == '/'c)
   {
      for (i = 3; i <= len + 1; i += 1)
         name (i - 2) = name (i)
      name (1) = '\'c      # replaces remaining / with \
      len = length (name)
   }
   # else name is a relative path name

   call check_dig (name)

   return
   end
