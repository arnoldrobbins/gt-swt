# sacl --- set an acl

   include ARGUMENT_DEFS

   integer getarg, sfdata, equal

   character path (MAXPATH), aclpath (MAXPATH), pairs (MAXACLLIST)
   integer attach_sw, i, junk (9), j, k
   ARG_DECL

   string usage "Usage: sacl <pathname> [<acl list>] [-l <pathname> | -a <acat>]"
   string oops "Cannot set ACL as specified."
   string notacat 'Object specified after the "-a" is not an acat.'


   PARSE_COMMAND_LINE ("a<rs>l<rs>"s, usage)

   if (getarg (1, path, MAXPATH) == EOF)
      call error (usage)

   i = 1
   j = 2
   repeat {
      k = getarg (j, pairs (i), MAXACLLIST + 1 - i)
      if (k == EOF)
         break
      else {
         i  += k + 1
         pairs (i - 1) = " "c
         j += 1
         }
      }
   pairs (i) = EOS

   if (ARG_PRESENT (a) && ARG_PRESENT (l))      # cannot do both
      call error (usage)
   elif (ARG_PRESENT (l)) {        # like
      if (sfdata (FILE_ACL, path, pairs, attach_sw, ARG_TEXT (l)) == ERR)
         call error (oops)
      }
   elif (ARG_PRESENT (a)) {       # acat
      call ctoc (ARG_TEXT (a), acl_path, MAXPATH)
      for (i = 1; acl_path (i) ~= EOS; i += 1)
         continue
      if (i < 7)
         call error (notacat)
      else {
         call ctoc (acl_path (i-5), junk, 9)
         call mapstr (junk, LOWER)
         if (equal (junk, ".acat"s) ~= YES)
            call error (notacat)
         }
      if (sfdata (FILE_ACL, path, EOS, attach_sw, acl_path) == ERR)
         call error ("Could not add object to acat.")
      }
   else                          # plain ole acl set
      if (sfdata (FILE_ACL, path, pairs, attach_sw, EOS) == ERR)
         call error (oops)

   stop
   end
