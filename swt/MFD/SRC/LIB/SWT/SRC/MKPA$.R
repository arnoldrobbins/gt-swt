# mkpa$ --- convert a treename into a pathname

   integer function mkpa$ (tree, path, default)
   character path (ARB), tree (ARB)
   integer default

  # where default is YES or NO controlling the conversion
  #               of a simple name to a file in the current
  #               directory or a UFD name.
  #               YES assumes conversion to a UFD name

   integer i, tp
   integer index
   character mapdn

   procedure copy_and_convert forward

  #
  #  current state of conversions:
  #
  #  <NAME>DIR>SUBDIR>FILE   converts to    '/name/dir/subdir/file'
  #  DIR>SUBDIR>FILE         converts to    '//dir/subdir/file'
  #  *>SUBDIR>FILE           converts to    'subdir/file'
  #  SIMPLENAME              converts to either
  #                                         'simplename'
  #                          or
  #                                         '//simplename'
  #                          depending on argument default
  #

   i = 1
   SKIPBL (tree, i)

   if (index (tree, '>'c) == 0) {         # is it a simple name?
      if (default == YES) {
         call scopy ('//'s, 1, path, 1)   # give default disk name
         tp = 3                           # and copy rest after
         }
      else
         tp = 1
      copy_and_convert
      return (tp - 1)
      }

   if (tree (i) == '<'c)
      tp = 1
   else if (tree (i) == '*'c && tree (i + 1) == '>'c) {
      i += 2
      tp = 1
      }
   else {
      call scopy ('//'s, 1, path, 1)
      i = 1
      tp = 3
      }

   copy_and_convert

   return (tp - 1)


   # copy_and_convert --- copy tree body and convert to path
      procedure copy_and_convert {

      SKIPBL (tree, i)

      while (tree (i) ~= EOS) {
         select (tree (i))

            when ('<'c) {
               SKIPBL (tree, i)
               path (tp) = '/'c
               }

            when ('>'c) {
               SKIPBL (tree, i)
               path (tp) = '/'c
               }

            when ('/'c) {
               path (tp) = ESCAPE
               path (tp + 1) = '/'c
               tp += 1
               }

            when (' 'c) {
               SKIPBL (tree, i)
               if (tree (i) ~= EOS && tree (i) ~= '>'c)
                  path (tp) = ':'c
                  tp += 1
                  while (tree (i) ~= EOS && tree (i) ~= '>'c) {
                     path (tp) = tree (i)
                     tp += 1
                     i += 1
                     }
               }

         else
            path (tp) = mapdn (tree (i))

         i += 1
         tp += 1
         }

      path (tp) = EOS
      }

   end
