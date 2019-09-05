# init$p --- initialize the Pascal INPUT and OUTPUT files

   subroutine init$p

   integer f, i, path (MAXPATH), tree (MAXPATH)
   integer mapfd, mapsu, gfnam$

   integer iflag, i1, i2, i3, i4, i5, iunit, i6, i7, i8
   integer ifnam (64), i9, ibuf (128)
   common /p$ainp/ iflag, i1, i2, i3, i4, i5, iunit, i6, i7, i8,
                     ifnam, i9, ibuf

   integer oflag, o1, o2, o3, o4, o5, ounit, o6, o7, o8
   integer ofnam (64), o9, obuf (128)
   common /p$aout/ oflag, o1, o2, o3, o4, o5, ounit, o6, o7, o8,
                     ofnam, o9, obuf

   call flush$ (mapsu (STDIN))
   call flush$ (mapsu (STDOUT))

   f = mapfd (STDIN)
   if (f > 0) {
      call attdev (f, 7, f, 128)
      iflag &= not (:1000)
      iunit = f
      i = 1
      if (gfnam$ (STDIN, path, MAXPATH) ~= ERR) {
         call mktr$ (path, tree)
         call ctop (tree, i, ifnam, 64)
         }
      else
         call ctop ("pathname unobtainable"s, i, ifnam, 64)
      }

   f = mapfd (STDOUT)
   if (f > 0) {
      call attdev (f, 7, f, 128)
      oflag &= not (:1000)
      ounit = f
      i = 1
      if (gfnam$ (STDOUT, path, MAXPATH) ~= ERR) {
         call mktr$ (path, tree)
         call ctop (tree, i, ofnam, 64)
         }
      else
         call ctop ("pathname unobtainable"s, i, ofnam, 64)
      }

   return
   end
