# sp_inject --- special inject for reading files

   pointer function sp_inject (lin, len, line)
   character lin (ARB)
   integer len
   pointer line

   include SE_COMMON

   pointer k, ptr
   pointer alloc

   sp_inject = alloc (ptr)
   if (ptr == NOMORE) {
      Errcode = ECANTINJECT
      return
      }

   Seekaddr (ptr) = Scrend
   Lineleng (ptr) = len + 1
   Globmark (ptr) = NO
   Markname (ptr) = DEFAULTNAME

   call seekf (Scrend, Scr)
   call writef (lin, len + 1, Scr)
   Scrend += len + 1
   Lastln += 1

   Buffer_changed = YES

   k = Nextline (line)
   call relink (line, ptr, ptr, k)
   call relink (ptr, k, line, ptr)

   return
   end
