# vt$ier --- report error in initialization file

   integer function vt$ier (msg, name, line, fd)
   character msg (ARB), name (ARB), line (ARB)
   file_des fd

   call print (ERROUT, "error in vth file: *s*n"s, name)
   call print (ERROUT, "*s*nline: *s*n"s, msg, line)

   call close (fd)

   return (ERR)
   end
