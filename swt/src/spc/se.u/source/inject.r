# inject --- insert a new line after curln

   integer function inject (lin)
   character lin (ARB)

   include SE_COMMON

   integer i
   integer maklin
   pointer k1, k2, k3
   pointer getind

   for (i = 1; lin (i) ~= EOS; ) {
      i = maklin (lin, i, k3)    # create a single line
      if (i == ERR) {
         inject = ERR
         Errcode = ECANTINJECT
         break
         }
      k1 = getind (Curln)           # get pointer to curln
      k2 = Nextline (k1)            # get pointer to nextln
      call relink (k1, k3, k3, k2)  # set pointers of new line
      call relink (k3, k2, k1, k3)  # set pointers of prevln and nextln
      call svins (Curln, 1)
      Curln += 1                    # update Curln
      Lastln += 1                   # update Lastln
      inject = OK
      }

   return
   end
