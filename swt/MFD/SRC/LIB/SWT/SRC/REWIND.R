# rewind --- position to beginning-of-file

   integer function rewind (fd)
   integer fd

   integer seekf

   return (seekf (intl (0), fd))
   end
