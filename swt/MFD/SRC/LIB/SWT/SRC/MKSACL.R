# mksacl --- encode the ACL structure

   integer function mksacl (ret_acl_path, access_pairs, type, separator)
   character ret_acl_path (ARB), access_pairs (ARB), separator (ARB)
   integer type

   include ACL_COMMON

   integer i, count

   integer encode, ctoc

   define (INSCHAR(x), {access_pairs (i) = x; i +=1})


   call ctoc (Acl_name, ret_acl_path, MAXPATH)
   type = Acl_type

   i = 1
   for (count = 1; count <= Acl_count; count += 1) {
      i += encode (access_pairs (i), MAXACLLIST, "*s="s, Acl_user (1, count))
      if (Acl_mode (count) == ACL_NONE)
         i += ctoc ("$none"s, access_pairs (i), MAXACLLIST)
      elif (Acl_mode (count) == ACL_ALL)
         i += ctoc ("$all"s, access_pairs (i), MAXACLLIST)
      else {
         if (and (ACL_ADD, Acl_mode (count)) ~= 0)
            INSCHAR('a'c)
         if (and (ACL_DELETE, Acl_mode (count)) ~= 0)
            INSCHAR('d'c)
         if (and (ACL_LIST, Acl_mode (count)) ~= 0)
            INSCHAR('l'c)
         if (and (ACL_PROTECT, Acl_mode (count)) ~= 0)
            INSCHAR('p'c)
         if (and (ACL_READ, Acl_mode (count)) ~= 0)
            INSCHAR('r'c)
         if (and (ACL_USE, Acl_mode (count)) ~= 0)
            INSCHAR('u'c)
         if (and (ACL_WRITE, Acl_mode (count)) ~= 0)
            INSCHAR('w'c)
         }
      i += encode (access_pairs (i), MAXACLLIST, separator)
      }

   return (i - 1)

   undefine (INSCHAR)

   end
