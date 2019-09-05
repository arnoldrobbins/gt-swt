# sfdata --- set file information

   integer function sfdata (key, xpath, infobuf, attach_sw, auxil)
   integer key, attach_sw
   character xpath (ARB)
   integer infobuf (ARB), auxil (ARB)

   integer getto, parsa$, index, equal, expand

   include SWT_COMMON
   include ACL_COMMON

   integer sarr (2)

   integer name (16), pathname (MAXPATH)
   integer junk (MAXTREE), junk2 (MAXTREE), vtree (129), ppwd (3)
   integer i, j, isacat

   long_int qbuf (8)

   procedure do_getto forward
   procedure do_protect forward
   procedure find_isacat forward
   procedure make_tree forward


   attach_sw = NO
   Errcod = 0
   if (expand (xpath, pathname, MAXPATH) == ERR)
      return (ERR)

   select (key)

      when (FILE_UFDQUOTA) {
         make_tree
         call q$set (KSMAX, vtree, infobuf, Errcod)
         if (Errcod == EQEXC)
            Errcod = 0
         }
      when (FILE_TYPE)
         return (ERR)         # Cannot change a file type!
      when (FILE_DMBITS) {
         do_getto
         call satr$$ (KDMPB, name, 32, sarr, Errcod)
         }
      when (FILE_RWLOCK) {
         do_getto
         sarr (2) = 0
         if (equal (infobuf, "n-1"s) == YES)
            sarr (1) = 1
         elif (equal (infobuf, "sys"s) == YES)
            sarr (1) = 0
         elif (equal (infobuf, "n+1"s) == YES)
            sarr (1) = 2
         elif (equal (infobuf, "n+n"s) == YES)
            sarr (1) = 3
         else
            return (ERR)
         call satr$$ (KRWLK, name, 32, sarr, Errcod)
         }
      when (FILE_TIMMOD) {
         do_getto
         sarr (1) = ls (mod (infobuf (1), 100), 9)
         sarr (1) |= ls (and (infobuf (2), 2r1111), 5)
         sarr (1) |= and (infobuf (3), 2r11111)
         sarr (2) = (infobuf (4)*60 + infobuf (5))*15 + infobuf (6)/4
         call satr$$ (KDTIM, name, 32, sarr, Errcod)
         }
      when (FILE_ACL) {
         j = 1
         find_isacat
         make_tree
         if (infobuf (1) == EOS && auxil (1) == EOS) {
            if (isacat == NO)
               call ac$dft (vtree, Errcod)
            else
               call cat$dl (vtree, Errcod)
            }
         elif (infobuf (1) == EOS) {
            j = 2
            find_isacat
            if (isacat == NO) {
               call expand (auxil, junk2, MAXTREE)
               call mktr$ (junk2, junk)
               if (index (junk, ">"c) == 0)
                  return (ERR)
               i = 1
               call ctov (junk, i, junk2, MAXTREE)
               call ac$lik (vtree, junk2, Errcod)
               }
            else {
               i = 1
               call ctov (auxil, i, junk2, MAXTREE)
               call ac$cat (vtree, junk2, Errcod)
               }
            }
         elif (auxil (1) == EOS) {
            if (gtacl$ (pathname, 1, attach_sw) == ERR)
               return (ERR)
            elif (parsa$ (infobuf) == ERR)
               return (ERR)
            else {
               call mkpacl
               if (index (junk, ">"c) == 0)
                  do_getto
               call ac$set (KANY, vtree, loc (Primos_acl), Errcod)
               }
            }
         else {
            call expand (auxil, junk2, MAXTREE)
            if (gtacl$ (junk2, 1, attach_sw) == ERR)
               return (ERR)
            elif (parsa$ (infobuf) == ERR)
               return (ERR)
            else {
               call mkpacl
               if (index (junk, ">"c) == 0)
                  do_getto
               call ac$set (KANY, vtree, loc (Primos_acl), Errcod)
               }
            }
         }
      when (FILE_ACCESS)
         return (ERR)      # not defined -- can only set ACL
      when (FILE_PRIORITYACL) {
         i = 1
         call ctov (infobuf, i, vtree, 129)
         if (auxil (1) == EOS)
            call pa$del (vtree, Errcod)
         else {
            call gtacl$ (EOS, 1, i)
            if (parsa$ (auxil) == ERR)
               return (ERR)
            else {
               call mkpacl
               call pa$set (vtree, loc (Primos_acl), Errcod)
               }
            }
         }
      when (FILE_DELSWITCH) {
         do_getto
         if (infobuf (1) == YES)
            sarr (1) = 1
         else
            sarr (1) = 0
         call satr$$ (KSDL, name, 32, sarr, Errcod)
         }
      when (FILE_SIZE)
         return (ERR)         # like, fer sure
      when (FILE_FULL_INFO)
         return (ERR)         # not defined
      when (FILE_PROTECTION) {
         do_getto
         do_protect
         }
      when (FILE_PASSWORDS) {
         attach_sw = YES
         if (follow (pathname, 0) == ERR)
            return (ERR)
         i = 1
         call ctop (infobuf, i, junk, 3)
         i = 1
         call ctop (auxil, i, junk2, 3)
         call spas$$ (junk, junk2, Errcod)
         }
   ifany {
      if (attach_sw == YES)
         call at$hom(i)
      if (Errcod ~= 0)
         return (ERR)
      else
         return (OK)
      }
   else
      return (ERR)    # bad key



   procedure do_getto {

      if (getto (pathname, name, ppwd, attach_sw) == ERR)
         return (ERR)
      }

   procedure do_protect {

      local owner_bits, non_owner_bits, owner, prot
      integer owner_bits (4), non_owner_bits (4), owner, prot (2)

      string permissions "twra"
      data owner_bits / :2000, :1000, :400, :3400 /
      data non_owner_bits / :4, :2, :1, :7 /

      prot (1) = 0   # default --- no permissions for owner or nonowner
      prot (2) = 0
      owner = YES

      for (i = 1; infobuf (i) ~= EOS; i += 1)
         if (infobuf (i) == '/'c)
            owner = NO
         else {
            j = index (permissions, infobuf (i))
            if (j < 1)     # illegal protection key
               return (ERR)
            if (owner == YES)
               prot (1) |= owner_bits (j)
            else
               prot (1) |= non_owner_bits (j)
            }

      call satr$$ (KPROT, name, 32, prot, Errcod)
      }

   procedure find_isacat {
      local buffer, suffix, meow
      character buffer (MAXPATH), suffix (7)
      integer meow

      if (j == 1)
         call ctoc (pathname, buffer, MAXPATH)
      else
         call ctoc (auxil, buffer, MAXPATH)

      for (meow = 1; buffer (meow) ~= EOS; meow += 1)
         continue
      if (meow < 7)
         isacat = NO
      else {
         meow -= 5
         call ctoc (buffer (meow), suffix, 7)
         call mapstr (suffix, LOWER)
         isacat = equal (".acat"s, suffix)
         }
      }

   procedure make_tree {
      local i
      integer i

      call mktr$ (pathname, junk)
      i = 1
      call ctov (junk, i, vtree, 129)
      if (index (junk, ">"c) == 0)
         do_getto
      }

   end
