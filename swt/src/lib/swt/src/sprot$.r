# sprot$ --- set protection attributes for a file

   integer function sprot$ (name, attr)
   character name (ARB), attr (ARB)

   include SWT_COMMON

   string permissions "twra"

   integer owner_bits (4), non_owner_bits (4)   # 4 = length (permissions)
   integer i, j, owner, packed_name (16), code, prot (2), junk (3)
   integer attach, index, getto

   data owner_bits / :2000, :1000, :400, :3400 /
   data non_owner_bits / :4, :2, :1, :7 /

   prot (1) = 0   # default --- no permissions for owner or nonowner
   prot (2) = 0
   sprot$ = ERR    # guilty before trial

   owner = YES
   for (i = 1; attr (i) ~= EOS; i += 1)
      if (attr (i) == '/'c)
         owner = NO
      else {
         j = index (permissions, attr (i))
         if (j < 1)     # illegal protection key
            return
         if (owner == YES)
            prot (1) |= owner_bits (j)
         else
            prot (1) |= non_owner_bits (j)
         }

   if (getto (name, packed_name, junk, attach) == ERR)
      return

   call satr$$ (KPROT, packed_name, 32, prot, Errcod)
   if (attach ~= NO)
      call at$hom (code)

   if (Errcod == 0)
      sprot$ = OK

   return
   end
