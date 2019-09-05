# parsa$ --- parse acl changes

   integer function parsa$ (str)
   character str (ARB)

   include ACL_COMMON

   integer sp, i, j, defval
   integer cprot
   integer lookac, equal
   character text (33)
   character cname (33), cop, cflag (33)

   procedure getname forward
   procedure getprot forward


  ### Save the default value
   i = lookac ("$rest"s)
   if (i ~= ERR)
      defval = Acl_mode (i)
   else
      defval = 0

  ### Do the parsing...
   call mapstr (str, LOWER)
   sp = 1
   SKIPBL (str, sp)
   while (str (sp) ~= EOS) {
     ### Grab the name -- give up if none
      getname
      if (text (1) == EOS)
         return (ERR)
      call scopy (text, 1, cname, 1)

     ### Get the assignment operator -- give up if none
      SKIPBL (str, sp)
      if (str (sp) == ':'c || str (sp) == '+'c
               || str (sp) == '-'c || str (sp) == '='c) {
         cop = str (sp)
         sp += 1
         if (str (sp) == '='c)
            sp += 1
         }
      else
         return (ERR)

     ### Now get the protections
      SKIPBL (str, sp)
      if (cop == ':'c) {          # grab a name in the acl
         getname
         i = lookac (text)
         if (i == ERR)
            return (ERR)
         cprot = Acl_mode (i)
         }
      else                       # just look for letters & stuff
         getprot

     ### Update the name in the acl
      i = lookac (cname)
      if (i == ERR) {   # not there--assign an empty slot
         i = lookac (""s)   # find a slot
         if (i == ERR) {
            Acl_count += 1
            if (Acl_count > 32)
               return (ERR)
            i = Acl_count
            }
         call scopy (cname, 1, Acl_user (1, i), 1)
         Acl_mode (i) = defval
         }
      if (cop == '='c || cop == ':'c)
         Acl_mode (i) = cprot
      else if (cop == '+'c)
         Acl_mode (i) |= cprot
      else if (cop == '-'c)
         Acl_mode (i) &= not (cprot)

      SKIPBL (str, sp)
      }  # end of while (str (sp) ...

  ### Clobber entries equal to $rest (get $rest, too)
   i = lookac ("$rest"s)
   if (i == ERR)
      defval = 0
   else
      defval = Acl_mode (i)
   for (i = 1; i <= Acl_count; i += 1)
      if (Acl_mode (i) == defval)
         Acl_user (1, i) = EOS

  ### Squash out deleted entries
   for ({i = 1; j = 1}; i <= Acl_count; i += 1)
      if (Acl_user (1, i) ~= EOS) {
         if (i ~= j) {
            call scopy (Acl_user (1, i), 1, Acl_user (1, j), 1)
            Acl_mode (j) = Acl_mode (i)
            }
         j += 1
         }
   Acl_count = j - 1

  ### Put in a $rest at the end
   Acl_count += 1
   if (Acl_count > 32)
      return (ERR)
   call scopy ("$rest"s, 1, Acl_user (1, Acl_count), 1)
   Acl_mode (Acl_count) = defval

   return (OK)


   # getname --- collect a name from str (sp) into text (1)

      procedure getname {

      local i; integer i

      text (1) = EOS
      if (IS_LETTER (str (sp)) || str (sp) == '.'c || str (sp) == '$'c) {
         text (1) = str (sp)
         for ({sp += 1; i = 2}; i <= 33
                    && (IS_LETTER (str (sp)) || IS_DIGIT (str (sp))
                       || str (sp) == '$'c || str (sp) == '_'c
                       || str (sp) == '.'c); {sp += 1; i += 1})
            text (i) = str (sp)
         text (i) = EOS
         }
      }


   # getprot --- get protection string from str (sp) and put in cprot

      procedure getprot {

      cprot = ACL_NONE

      if (str (sp) == '$'c) {
         getname
         select
            when (equal (text, "$owner"s) == YES)
               cprot = ACL_DELETE + ACL_ADD + ACL_LIST _
                           + ACL_USE + ACL_READ + ACL_WRITE
            when (equal (text, "$read"s) == YES)
               cprot = ACL_LIST + ACL_READ + ACL_USE
            when (equal (text, "$use"s) == YES)
               cprot = ACL_ADD + ACL_LIST + ACL_USE + ACL_READ
            when (equal (text, "$all"s) == YES)
               cprot = ACL_ALL
            when (equal (text, "$none"s) == YES)
               cprot = ACL_NONE
            when (equal (text, "$default"s) == YES)
               cprot = defval
            when (equal (text, "$def"s) == YES)
               cprot = defval
            else
               return (ERR)
            }
      else
         repeat {
            select (str (sp))
               when ('a'c)
                  cprot |= ACL_ADD
               when ('p'c)
                  cprot |= ACL_PROTECT
               when ('l'c)
                  cprot |= ACL_LIST
               when ('u'c)
                  cprot |= ACL_USE
               when ('r'c)
                  cprot |= ACL_READ
               when ('w'c)
                  cprot |= ACL_WRITE
               when ('d'c)
                  cprot |= ACL_DELETE
               when ('?'c)
                  cprot |= defval
               when ('*'c)
                  cprot |= ACL_ALL
               when ('0'c)
                  ;
               else
                  break
            sp += 1
            }
      }

   end
