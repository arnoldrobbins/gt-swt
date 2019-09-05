# lookac --- look up a name in the 'acl' common block

   integer function lookac (name)
   character name (ARB)

   include ACL_COMMON

   integer i
   integer equal

   for (i = 1; i <= Acl_count; i += 1)
      if (equal (Acl_user (1, i), name) == YES)
         return (i)

   return (ERR)
   end
