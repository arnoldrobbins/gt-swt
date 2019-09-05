include "brefs_def.r.i"

# brefs --- print out caller-callee pairs from an object file

   integer inf, state (4)
   integer gfnarg, open, do_file
   character path (MAXARG)

   state (1) = 1
   repeat
      select (gfnarg (path, state))
         when (OK) {
            inf = open (path, READ)
            if (inf == ERR)
               call print (ERROUT, "*s: can't open*n"p, path)
            else {
               if (do_file (inf) == ERR)
                  call print (ERROUT, "*s: bad object file*n"p, path)
               call close (inf)
               }
            }
         when (ERR)
            call print (ERROUT, "*s: can't open*n"p, path)
         when (EOF)
            break

   stop
   end



# do_file --- process one input file

   integer function do_file (fd)
   integer fd

   integer count, bt, bs, inbuf (BLOCKSZ)
   integer rdbin

   for (count = rdbin (fd, inbuf, BLOCKSZ); count ~= EOF && count ~= 0;
            count = rdbin (fd, inbuf, BLOCKSZ)) {
      bt = rs (inbuf (1), 12)
      bs = rt (inbuf (1), 8)
      if (count < 0 || count ~= bs
            || (bt ~= DATA && bt ~= PREFIX && bt ~= END))
         return (ERR)
      call interpret_block (inbuf, bs)
      }

   return (OK)
   end


# interpret_block --- interpret an object block, return status

   subroutine interpret_block (buf, count)
   integer buf (ARB), count

   integer gt, gs, i

   for (i = 2; i <= count; i += gs + 1) {
      gt = rs (buf (i), 8)
      gs = rt (buf (i), 8)
      call interpret_group (gt, buf (i + 1), gs)
      }

   return
   end


# interpret_group --- interpret a single object group

   subroutine interpret_group (gt, buf, gs)
   integer gt, buf (ARB), gs

   character str (MAXLINE), name (MAXLINE)
   save name

   select (gt)    # branch on group type
      when (ENTABS, ENTREL, ENTLB, ENTLBA, DYNT) {
         if (gt == DYNT)
            call ptoc (buf, ' 'c, name, gs * 2 + 1)
         else
            call ptoc (buf (2), ' 'c, name, gs * 2 - 1)
         call mapstr (name, LOWER)
         }
      when (MEMREFEXT) {
         call ptoc (buf (2), ' 'c, str, (gs - 1) * 2 + 1)
         call mapstr (str, LOWER)
         call print (STDOUT, "*s *s*n"p, name, str)
         }
      when (EXTREF32) {
         call ptoc (buf, ' 'c, str, gs * 2 + 1)
         call mapstr (str, LOWER)
         call print (STDOUT, "*s *s*n"p, name, str)
         }
      when (PROCDEF)
         call ctoc ("$MAIN"s, name, MAXLINE)

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
      call print (ERROUT, "block size (*i) exceeds buffer space*n"p, ct)
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
