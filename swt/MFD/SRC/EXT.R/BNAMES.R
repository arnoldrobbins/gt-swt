# bnames --- print entry point names in object files

   include "bnames_def.r.i"

   character name (MAXLINE)
   integer state (4)
   integer gfnarg
   filedes fd
   filedes open

   procedure do_file (fd) forward

   state (1) = 1
   repeat
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            fd = open (name, READ)
            if (fd == ERR)
               call cant (name)
            do_file (fd)
            call close (fd)
            }

   stop


   # do_file --- list entry points in one object file

      procedure do_file (fd) {
      filedes fd

      local name
      character name (MAXLINE)
      integer get_module

      while (get_module (fd, name) ~= EOF)
         call print (STDOUT, "*s*n"s, name)

      }

   end


# get_module --- return name, file offset and size of next module

   integer function get_module (fd, name)
   filedes fd
   character name (MAXLINE)

   integer buf (MAXBUF), len
   integer rdbin, has_procdef, get_name

   procedure skip_to_end forward

   repeat {
      len = rdbin (fd, buf, MAXBUF)
      if (len == 0 || len == EOF)
         return (EOF)
      if (len < 0 || len ~= BLOCK_SIZE (buf))
         call err (fd, "bad object file (block size mismatch)"s)
      select (BLOCK_TYPE (buf))
         when (PREFIX_BLOCK) {
            if (has_procdef (buf) == YES) {
               if (get_name (buf, name, MAXLINE) == NO) {
                  call scopy (".main"s, 1, name, 1)
                  for (len = rdbin (fd, buf, MAXBUF);
                        BLOCK_TYPE (buf) ~= END_BLOCK;
                        len = rdbin (fd, buf, MAXBUF))
                     if (BLOCK_TYPE (buf) == PREFIX_BLOCK && getname (buf, name, MAXLINE) == YES)
                        break
                  }
               if (BLOCK_TYPE (buf) ~= END_BLOCK)
                  skip_to_end
               return (OK)
               }
            elif (BLOCK_SIZE (buf) == 2)
               select (buf (2))
                  when (RFL_GROUP)
                     call scopy (".rfl"s, 1, name, 1)
                  when (SFL_GROUP)
                     call scopy (".sfl"s, 1, name, 1)
                  ifany
                     return (OK)
            # else ignore the block
            }
         when (DATA_BLOCK) {  # Fortran blockdata
            call scopy (".data"s, 1, name, 1)
            skip_to_end
            return (OK)
            }
         when (END_BLOCK)
            call err (fd, "extraneous END block"s)
      else
         call err (fd, "bad object file (unrecognized block type)"s)
      }

   # skip_to_end --- find next END block in object file

      procedure skip_to_end {

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
