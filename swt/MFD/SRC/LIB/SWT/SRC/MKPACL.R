# mkpacl --- encode SWT ACL info into Primos structure

   subroutine mkpacl

   include ACL_COMMON

   integer i, j, k
   character temp (MAXACLLIST)

   integer encode

   define (INSCHAR (x), {temp (i) = x; i +=1})


   Acl_version = 2

   for (j = 1; j <= Acl_count; j += 1) {
      i = encode (temp, MAXACLLIST, "*s:"s, Acl_user (1, j))
      i += 1
      if (Acl_mode (j) == ACL_ALL)
         call ctoc ("all"s, temp (i), 4)
      elif (Acl_mode (j) == ACL_NONE)
         call ctoc ("none"s, temp (i), 5)
      else {
         if (and (ACL_ADD, Acl_mode (j)) ~= 0)
            INSCHAR ('a'c)
         if (and (ACL_DELETE, Acl_mode (j)) ~= 0)
            INSCHAR ('d'c)
         if (and (ACL_LIST, Acl_mode (j)) ~= 0)
            INSCHAR ('l'c)
         if (and (ACL_PROTECT, Acl_mode (j)) ~= 0)
            INSCHAR ('p'c)
         if (and (ACL_READ, Acl_mode (j)) ~= 0)
            INSCHAR ('r'c)
         if (and (ACL_USE, Acl_mode (j)) ~= 0)
            INSCHAR ('u'c)
         if (and (ACL_WRITE, Acl_mode (j)) ~= 0)
            INSCHAR ('w'c)
         INSCHAR (EOS)
         }
      k = 1
      call ctov (temp, k, Acl_pairs (1, j), 41)
      }

   return

   undefine (INSCHAR)

   end
