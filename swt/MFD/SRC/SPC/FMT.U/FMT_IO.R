# newinp --- open new input file, stack its descriptor

   subroutine newinp (name)
   character name (ARB)

   include FMT_COMMON

   integer fd
   integer xopen

   fd = xopen (name, READ)
   if (fd ~= ERR) {
      F_ptr += 1
      if (F_ptr > MAXFILES) {
         call xclose (fd)
         call reset_files
         call putlin (name, ERROUT)
         call error (": too many macros/input files"s)
         }
      F_list (F_ptr) = fd
      F_type (F_ptr) = FILE
      call rewind (fd)
      return
      }
   else {
      call reset_files
      call cant (name)
      }

   end



# newout --- create set up new output file for divert

   subroutine newout (name)
   character name (ARB)

   include FMT_COMMON

   integer fd
   integer xopen

   fd = xopen (name, READWRITE)
   if (fd == ERR) {
      call reset_files
      call putlin (name, ERROUT)
      call error (": can't open divert output"s)
      }

   Out_file = fd
   call wind (fd)

   return
   end



# readln --- read a line from the current input source

   integer function readln (buf, size)
   character buf (ARB)
   integer size

   include FMT_COMMON

   integer getlin, getarg, massin, rdmac
   character inbuf (MAXOUT)

   repeat {
      if (F_type (F_ptr) == MACRO)  # input from macro
         readln = rdmac (inbuf, F_list (F_ptr), MAXOUT)
      else                          # input from file
         readln = getlin (inbuf, F_list (F_ptr), MAXOUT)
      if (readln ~= EOF)      # return if getlin was successful
         return (massin (inbuf, buf, size))
      else {
         if (F_type (F_ptr) ~= MACRO)
            call xclose (F_list (F_ptr))  # close current input file
         else
            call endmac
         F_ptr -= 1
         if (F_ptr >= 1)         # if there is more input available,
            next                 # try another getlin.
         if (getarg (Next_arg, File_name, MAXPATH) == EOF) {
   ### clear out last page
            Nobreak = NO
            call brk
            if (Lineno > 0)
               call space (HUGE)
            if (F_ptr >= 1)
               next
            else
               return               # return EOF, no more input is available
            }
         else {                  # open file given as argument
            Next_arg += 1
            call newinp (File_name)
            }
         }
      }

   end



# reset_files --- close all currently opened files (excepting STDIN)

   subroutine reset_files

   include FMT_COMMON

   integer i

   for (; F_ptr >= 1; F_ptr -= 1)
      if (F_type (F_ptr) == FILE)
         call xclose (F_list (F_ptr))

   do i = 1, MAXFILES
      if (O_list (i) ~= ERR)
         call rmtemp (O_list (i))

   return
   end



# xclose --- close file, if necessary

   subroutine xclose (fd)
   integer fd

   include FMT_COMMON

   integer i

   do i = 1, MAXFILES      # don't close temporary files
      if (fd == O_list (i))
         return

   call close (fd)

   return
   end



# xopen --- open named file; if name is "-", return STDIN

   integer function xopen (name, mode)
   character name (ARB)
   integer mode

   include FMT_COMMON

   integer i, fn
   integer open, ctoi, mktemp

   i = 1
   fn = ctoi (name, i)

   if (name (1) == '-'c && name (2) == EOS)
      xopen = STDIN
   elif (fn >= 1 && fn <= MAXFILES) {
      if (O_list (fn) == ERR)
         O_list (fn) = mktemp (READWRITE)
      xopen = O_list (fn)
      }
   else
      xopen = open (name, mode)

   return
   end
