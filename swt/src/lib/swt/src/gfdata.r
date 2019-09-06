# gfdata --- get file infomation

   integer function gfdata (key, xpath, infobuf, attach_sw, auxil)
   integer key, attach_sw
   character xpath (ARB)
   integer infobuf (ARB), auxil (ARB)

   include SWT_COMMON

   integer ecw, fname, protectbits, typebits, date, time
   integer entrdbuf (MAXDIRENTRY)
   equivalence (ecw, entrdbuf), (fname, entrdbuf (2))
   equivalence (protectbits, entrdbuf (18)), (typebits, entrdbuf (20))
   equivalence (date, entrdbuf (21)), (time, entrdbuf (22))

   integer vname (17), name (16)
   equivalence (vname (2), name)

   integer junk (MAXPATH), junk2 (MAXPATH), vtree (129), ppwd (3)
   integer i, j, pathname (MAXPATH)

   long_int fsize, qbuf (8)

   logical nameq$
   longint szfil$
   integer getto, gtacl$, mksacl, index, equal, mapdn, expand

   procedure do_protec forward
   procedure do_entrd forward
   procedure do_type forward
   procedure do_size forward
   procedure do_access forward
   procedure make_and_validate_tree forward


   attach_sw = NO
   Errcod = 0

   if (expand (xpath, pathname, MAXPATH) == ERR)
      return (ERR)

   select (key)

      when (FILE_UFDQUOTA) {
         make_and_validate_tree
         call q$read (vtree, infobuf, 6, i, Errcod)
         if (i == 0)
            auxil (1) = YES
         else {
            auxil (1) = NO
            return (ERR)
            }
         }

      when (FILE_FULL_INFO) {
         do_entrd
         call move$ (entrdbuf, infobuf, MAXDIRENTRY)
         }

      when (FILE_TYPE) {
         do_entrd
         do_type
         }

      when (FILE_DMBITS) {
         do_entrd
         if (and (8r40000, typebits) ~= 0)
            infobuf (1) = YES
         else
            infobuf (1) = NO
         if (and (8r20000, typebits) ~= 0)
            infobuf (2) = YES
         else
            infobuf (2) = NO
         }

      when (FILE_RWLOCK) {
         do_entrd
         i = and (3, rs (typebits, 10))
         select (i)
            when (0)
               call ctoc ("sys"s, infobuf, 7)
            when (1)
               call ctoc ("n-1"s, infobuf, 7)
            when (2)
               call ctoc ("n+1"s, infobuf, 7)
            when (3)
               call ctoc ("n+n"s, infobuf, 7)
         }

      when (FILE_TIMMOD) {
         do_entrd
         infobuf (1) = and (2r1111111, rs (date, 9))
         infobuf (2) = and (2r1111, rs (date, 5))
         infobuf (3) = and (2r11111, date)
         infobuf (6) = mod (time, 15) * 4
         i = time / 15
         infobuf (5) = mod (i, 60)
         infobuf (4) = i / 60
         }

      when (FILE_ACL) {
         if (gtacl$ (pathname, 1, attach_sw) == ERR)
            return (ERR)
         elif (mksacl (auxil (2), infobuf, auxil (1), " "s) == ERR)
            return (ERR)
         }

      when (FILE_ACCESS)
         do_access

      when (FILE_PRIORITYACL) {
         if (gtacl$ (pathname, 2, attach_sw) == ERR)
            return (ERR)
         elif (mksacl (junk, infobuf, junk, " "s) == ERR)
            return (ERR)
         }

      when (FILE_DELSWITCH) {
         do_entrd
         if (and (protectbits, 8r200) ~= 0)
            infobuf (1) = YES
         else
            infobuf (1) = NO
         }

      when (FILE_SIZE) {
         do_entrd
         if (rs (ecw, 8) == 3)
            return (ERR)         # cannot size an ACL!
         else
            do_size
         }

      when (FILE_PROTECTION) {
         do_entrd
         do_protec
         }

      when (FILE_PASSWORDS) {
         if (getto (pathname, name, ppwd, attach_sw) == ERR)
            return (ERR)
         call gpas$$ (name, 32, ppwd, junk, Errcod)
         if (Errcod ~= 0)
            return (ERR)
         call ptoc (ppwd, EOS, infobuf, 7)
         call ptoc (junk, EOS, auxil, 7)
         }

   ifany {
      if (attach_sw == YES)
         call at$hom (i)

      if (Errcod == 0)
         return (OK)
      else
         return (ERR)
      }

   else
      return (ERR)     # bad key


   # do_protec --- interpret the (old style) protection for files

      procedure do_protec {
         local prot, loop, ind
         integer prot, loop, ind

         define (INSCHAR (x), {infobuf (ind) = x; ind += 1})

         ind = 1
         for (loop = 1; loop < 3; loop += 1) {
            if (loop == 1)
               prot = rs (protectbits, 8)
            else {
               prot = rt (protectbits, 8)
               INSCHAR ('/'c)
               }

            if (prot == 7)
               INSCHAR ('a'c)
            else {
               if (and (prot, 4) ~= 0)
                  INSCHAR ('d'c)
               if (and (prot, 2) ~= 0)
                  INSCHAR ('w'c)
               if (and (prot, 1) ~= 0)
                  INSCHAR ('r'c)
               }
            }
         INSCHAR (EOS)

         undefine (INSCHAR)
         }


   # do_entrd --- read the directory entry for the pathname

      procedure do_entrd {
         local typ, funit, i
         integer typ, funit, i

         if (getto (pathname, name, ppwd, attach_sw) == ERR)
            return (ERR)

         call srch$$ (KREAD + KGETU, KCURR, 0, funit, typ, Errcod)
         if (Errcod ~= 0)
            return (ERR)
         vname (1) = 0
         for (i = 1; vname (1) == 0 && i < 33; i += 1)
            if (rt(rs (name ( (i + 1) / 2), 8 * rt (i, 1)), 8) == ' 'c)
               vname (1) = i - 1

         call ent$rd (funit, vname, loc (entrdbuf), MAXDIRENTRY, Errcod)
         call srch$$ (KCLOS, 0, 0, funit, typ, typ)
         if (Errcod ~= 0)
            return (ERR)
         }


   # do_type --- interpret the type of the file object

      procedure do_type {
         local action, type, special
         integer action, type, special

         if (rs (ecw, 8) == 3)
            call ctoc ("acat"s, infobuf, 7)
         else {
            type = and (8, typebits)
            special = and (8r10000, typebits)
            if (special ~= 0) {
               if (type == 4)
                  call ctoc ("mfd"s, infobuf, 7)
               elif (nameq$ (fname, 32, "BOOT", 4))
                  call ctoc ("boot"s, infobuf, 7)
               elif (nameq$ (fname, 32, "BADSPT", 6))
                  call ctoc ("badspt"s, infobuf, 7)
               else
                  call ctoc ("dskrat"s, infobuf, 7)
               }
            else {
               select (type)
                  when (0)
                     call ctoc ("sam"s, infobuf, 7)
                  when (1)
                     call ctoc ("dam"s, infobuf, 7)
                  when (2)
                     call ctoc ("sgs"s, infobuf, 7)
                  when (3)
                     call ctoc ("sgd"s, infobuf, 7)
                  when (4)
                     call ctoc ("ufd"s, infobuf, 7)
               else
                  return (ERR)
               }
            }
         }


   # do_size --- determine the size of a file object

      procedure do_size {

         select (rt (typebits, 8))

            when (0, 1) {     # SAM or DAM file
               call srch$$ (KREAD + KGETU, name, 32, i, j, Errcod)
               if (Errcod ~= 0)
                  return (ERR)
               fsize = szfil$ (i)
               call srch$$ (KCLOS, name, 32, i, j, j)
               if (fsize == ERR)
                  return (ERR)
               call move$ (fsize, infobuf, 2)
               }

            when (2, 3) {     # SAM directory or DAM directory
               call srch$$ (KREAD + KGETU, name, 32, i, j, Errcod)
               if (Errcod ~= 0)
                  return (ERR)
               call szseg$ (fsize, i)
               call srch$$ (KCLOS, name, 32, i, j, j)
               if (fsize == ERR)
                  return (ERR)
               call move$ (fsize, infobuf, 2)
               }

            when (4) {        # UFD
               make_and_validate_tree
               call q$read (vtree, qbuf, 6, i, Errcod)
               if (Errcod ~= 0)
                  return (ERR)
               call move$ (qbuf (1), auxil, 2)    # words per disk record
               call move$ (qbuf (4), infobuf, 2)  # total records used
               }

         else
            return (ERR)
         }


   # make_and_validate_tree --- make treename and see if it is valid

      procedure make_and_validate_tree {

         local i; integer i

         call mktr$ (pathname, junk)
         i = 1
         call ctov (junk, i, vtree, 129)

         ### now see if it is a valid tree name
         if (getto (pathname, name, ppwd, attach_sw) == ERR)
            return (ERR)
         }


   # do_access --- determine the current access rights on a file object

      procedure do_access {

         local i; integer i
         string access_right_string "ADLPRUW"

         make_and_validate_tree
         i = 1
         call ctov (auxil, i, junk (2), MAXPATH - 2)
         junk (1) = 2
         junk (19) = 0     # return no group information
         call calac$ (vtree, loc (junk), "ALL"v, junk2, Errcod)
         if (Errcod ~= 0)
            return (ERR)
         call vtoc (junk2, junk, MAXLINE)
         if (equal (junk, "ALL"s) == YES)
            call ctoc ("$all"s, infobuf, 8)
         elif (equal (junk, "NONE"s) == YES)
            call ctoc ("$none"s, infobuf, 8)
         else {
            i = 1
            for (j = 1; access_right_string (j) ~= EOS; j += 1)
               if (index (junk, access_right_string (j)) ~= 0) {
                  infobuf (i) = mapdn (access_right_string (j))
                  i += 1
                  }
            infobuf (i) = EOS
            }
         }

   end
