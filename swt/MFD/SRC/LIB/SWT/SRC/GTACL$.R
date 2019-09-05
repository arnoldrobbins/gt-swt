# gtacl$ --- get acl protection for a pathname into ACL common block

   integer function gtacl$ (path, key, attach_sw)
   character path (ARB)
   integer key, attach_sw

   include SWT_COMMON
   include ACL_COMMON

   integer indx, i, j
   character treen (MAXTREE), temp (MAXTREE)
   integer name (MAXPACKEDFNAME), pass(3)
   character vtree (MAXVARYFNAME), temptree (129)

   integer mktr$, equal, getto


   call mktr$ (path, treen)

   attach_sw = NO
   Acl_version = 2
   Acl_count = 0

   if (path (1) == EOS)
      return (OK)

   if (getto (path, name, pass, attach_sw) == ERR)
      return (ERR)

   i = 1
   call ptov (name, ' 'c, vtree, MAXVARYFNAME)

   if (key == 1)
      call ac$lst (vtree, loc (Primos_acl), 32, temptree, Acl_type, Errcod)
   elif (key == 2) {
      call pa$lst (vtree, loc (Primos_acl), 32, Errcod)
      temptree (1) = 0     # zero-length varying string
      }
   else
      Errcod = EBKEY

   if (attach_sw == YES)
      call follow(EOS, 0)

   if (Errcod ~= 0)
      return (ERR)

   if (Acl_version > 2 | Acl_version < 1) {
      Errcod = EBVER
      return (ERR)
      }

   call vtoc (temptree, treen, MAXTREE)
   call mapstr (treen, LOWER)
   call mkpa$ (treen, Acl_name, NO)

   for (j = 1; j <= Acl_count; j += 1) {
      call vtoc (Acl_pairs (1, j), temp, MAXLINE)
      call mapstr (temp, LOWER)

      indx = 1
      while (temp (indx) ~= ':'c) {
         if (temp (indx) ~= ' 'c)
            Acl_user (indx, j) = temp (indx)
         indx += 1
         }

      Acl_user (indx, j) = EOS
      indx += 1

      SKIPBL (temp, indx)

      if (equal (temp (indx), "all"s) == YES)
         Acl_mode (j) = ACL_ALL
      elif (equal (temp (indx), "none"s) == YES)
         Acl_mode (j) = ACL_NONE
      else {
         Acl_mode (j) = ACL_NONE
         while (temp (indx) ~= EOS) {
            select (temp (indx))
               when ('a'c)
                  Acl_mode (j) |= ACL_ADD
               when ('d'c)
                  Acl_mode (j) |= ACL_DELETE
               when ('l'c)
                  Acl_mode (j) |= ACL_LIST
               when ('p'c)
                  Acl_mode (j) |= ACL_PROTECT
               when ('r'c)
                  Acl_mode (j) |= ACL_READ
               when ('u'c)
                  Acl_mode (j) |= ACL_USE
               when ('w'c)
                  Acl_mode (j) |= ACL_WRITE
            else {
               Errcod = EBACL
               return (ERR)
               }

            indx += 1
            } # end while
         } # end else
      } # end for

   return (OK)
   end
