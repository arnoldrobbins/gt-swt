# bmerge --- merge multiple object files into one

   include "bmerge_def.r.i"

   character arg (MAXARG), name (MAXNAME)
   integer i, nfiles, node (TNODESIZE)
   integer getarg, input, lookup, equal
   filedes ofd (MAXFILES)
   filedes open
   pointer table
   pointer mktabl

   call dsinit (MEMSIZE)

   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
      if (i > MAXFILES) {
         call print (ERROUT, "*s: too many object files*n"s, arg)
         call error (""s)
         }
      ofd (i) = open (arg, READ)
      if (ofd (i) == ERR)
         call cant (arg)
      }
   nfiles = i - 1
   if (nfiles <= 0)
      stop

   table = mktabl (TNODESIZE)
   do i = 1, nfiles
      call load_table (ofd (i), table)

   while (input (STDIN, "*,#s"s, MAXNAME, name) ~= EOF) {
      call mapstr (name, LOWER)
      select
         when (equal (name, ".rfl"s) == YES)
            call wrbin (STDOUT, RFL_BLOCK, 2)
         when (equal (name, ".sfl"s) == YES)
            call wrbin (STDOUT, SFL_BLOCK, 2)
         when (lookup (name, node, table) == YES) {
            call output_module (node)
            call delete_module (name, node, table)
            }
      else
         call print (ERROUT, "*s: not found in object files*n"s, name)
      }
   call wrbin (STDOUT, 0, 0)  # terminate object file

   stop
   end


# load_table --- build the symbol table for an object file

   subroutine load_table (fd, table)
   filedes fd
   pointer table

   character name (MAXLINE)
   filemark addr
   integer size
   integer get_module

   while (get_module (fd, name, addr, size) ~= EOF)
      call enter_module (table, name, addr, size, fd)

   return
   end


# get_module --- return name, file offset and size of next module

   integer function get_module (fd, name, addr, size)
   filedes fd
   character name (MAXNAME)
   filemark addr
   integer size

   integer buf (MAXBUF), len, kludge_size
   integer rdbin, has_procdef, get_name
   filemark markf

   procedure get_size forward

   repeat {
      addr = markf (fd)
      len = rdbin (fd, buf, MAXBUF)
      if (len == 0 || len == EOF)
         return (EOF)
      if (len < 0 || len ~= BLOCK_SIZE (buf))
         call err (fd, "bad object file (block size mismatch)"s)
      select (BLOCK_TYPE (buf))
         when (PREFIX_BLOCK) {
            if (has_procdef (buf) == YES) {
               kludge_size = 0
               size = 1    # kludge
               if (get_name (buf, name, MAXLINE) == NO) {
                  call scopy (".main"s, 1, name, 1)
                  for ({len = rdbin (fd, buf, MAXBUF);kludge_size += 1};
                        BLOCK_TYPE (buf) ~= END_BLOCK;
                        {len = rdbin (fd, buf, MAXBUF);kludge_size += 1})
                     if (BLOCK_TYPE (buf) == PREFIX_BLOCK &&
                           getname (buf, name, MAXLINE) == YES)
                        break
                  }
               if (BLOCK_TYPE (buf) ~= END_BLOCK)
                  get_size
               size += kludge_size
               return (OK)
               }
            # else ignore the block
            }
         when (DATA_BLOCK) {  # Fortran blockdata
            call scopy (".data"s, 1, name, 1)
            get_size
            return (OK)
            }
         when (END_BLOCK)
            call err (fd, "extraneous END block"s)
      else
         call err (fd, "bad object file (unrecognized block type)"s)
      }

   # get_size --- count the number of object blocks in a module

      procedure get_size {

      size = 1
      repeat {
         len = rdbin (fd, buf, MAXBUF)
         select
            when (len == 0)
               ;
            when (len < 0 || len == EOF)
               call err (fd, "bad object file (premature EOF)"s)
            when (len ~= BLOCK_SIZE (buf))
               call err (fd, "bad object file (block size mismatch)"s)
            when (BLOCK_TYPE (buf) ~= PREFIX_BLOCK &&
                  BLOCK_TYPE (buf) ~= DATA_BLOCK   &&
                  BLOCK_TYPE (buf) ~= END_BLOCK)
               call err (fd, "bad object file (bad block type)"s)
         size += 1
         } until (len == 0 || BLOCK_TYPE (buf) == END_BLOCK)

      }

   end


# has_procdef --- search an object block for a PROCDEF group

   integer function has_procdef (buf)
   integer buf (ARB)

   integer len, i

   len = BLOCK_SIZE (buf)
   for (i = 1; i < len; i += GROUP_SIZE (buf (i + 1)) + 1)
      if (GROUP_TYPE (buf (i + 1)) == PROCDEF)
         return (YES)

   return (NO)
   end


# get_name --- search an object block for an entry point name

   integer function get_name (buf, name, size)
   integer buf (ARB), size
   character name (size)

   integer len, i

   len = BLOCK_SIZE (buf)
   for (i = 1; i < len; i += GROUP_SIZE (buf (i + 1)) + 1)
      select (GROUP_TYPE (buf (i + 1)))
         when (ENTABS, ENTREL, ENTLB, ENTLBA)
            call ptoc (buf (i + 3), ' 'c, name,
                  min0 (size, GROUP_SIZE (buf (i + 1)) * 2 - 1))
         when (DYNT)
            call ptoc (buf (i + 2), ' 'c, name,
                  min0 (size, GROUP_SIZE (buf (i + 1)) * 2 + 1))
      ifany {
         call mapstr (name, LOWER)
         return (YES)
         }

   return (NO)
   end


# enter_module --- add a module to the symbol table

   subroutine enter_module (table, name, addr, size, fd)
   pointer table
   character name (ARB)
   integer addr (2), size, fd

   DS_DECL (Mem, MEMSIZE)

   integer node (TNODESIZE)
   integer lookup
   pointer ptr
   pointer dsget

   ptr = dsget (MNODESIZE)
   Mem (ptr + SIZE) = size
   Mem (ptr + FILE) = fd
   Mem (ptr + ADDR + 0) = addr (1)
   Mem (ptr + ADDR + 1) = addr (2)
   Mem (ptr + LINK) = LAMBDA

   if (lookup (name, node, table) == YES)
      Mem (node (TAIL) + LINK) = ptr
   else
      node (HEAD) = ptr
   node (TAIL) = ptr
   call enter (name, node, table)

   return
   end


# err --- print file name and error message, then croak

   subroutine err (fd, msg)
   filedes fd
   character msg (ARB)

   character name (MAXPATH)

   call gfnam$ (fd, name, MAXPATH)
   call print (ERROUT, "*s: *s*n"s, name, msg)
   call seterr (1000)

   stop
   end


# output_module --- copy module from an input file to STDOUT

   subroutine output_module (node)
   integer node (TNODESIZE)

   DS_DECL (Mem, MEMSIZE)

   pointer p
   integer buf (MAXBUF), i, len
   integer rdbin

   p = node (HEAD)
   call seekf (Mem (p + ADDR), Mem (p + FILE), ABS)
   for (i = 1; i <= Mem (p + SIZE); i += 1) {
      len = rdbin (Mem (p + FILE), buf, MAXBUF)
      if (len <= 0 || len == EOF)
         call err (Mem (p + FILE), "error copying object module"s)
      call wrbin (STDOUT, buf, len)
      }

   return
   end


# delete_module --- remove a module from the symbol table

   subroutine delete_module (name, node, table)
   character name (ARB)
   integer node (TNODESIZE)
   pointer table

   DS_DECL (Mem, MEMSIZE)

   pointer p

   p = node (HEAD)
   if (Mem (p + LINK) == LAMBDA)    # last module in list?
      call delete (name, table)
   else {
      node (HEAD) = Mem (p + LINK)
      call enter (name, node, table)
      }

   return
   end


# rdbin --- Subsystem-compatible binary input driver

   integer function rdbin (fd, buf, count)
   integer fd, buf (ARB), count

   integer ct
   longint pos
   integer readf, seekf

   rdbin = EOF
   if (readf (ct, 1, fd) ~= 1)
      return
   if (ct > count) {
      pos = ct - count
      call print (ERROUT, "block size (*i) exceeds buffer space*n"s, ct)
      ct = count
      }
   else
      pos = 0
   if (readf (buf, ct, fd) ~= ct)
      return
   if (pos ~= 0 && seekf (pos, fd, REL) ~= OK)
      return

   return (ct)
   end


# wrbin --- Subsystem-compatible binary output driver

   integer function wrbin (fd, buf, count)
   integer fd, buf (ARB), count

   integer writef

   wrbin = ERR
   if (writef (count, 1, fd) ~= 1
         || writef (buf, count, fd) ~= count)
      return

   return (OK)
   end
