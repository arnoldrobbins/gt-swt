# filtst --- function to perform several tests upon pathname

integer function filtst (path, zero, permissions, exists, type,
      readable, writeable, dumped)

integer path(MAXPATH)
integer zero         # file is or is not zero length
integer permissions  # type of permissions on the file
integer exists       # does path exist or not
integer type         # file type (SAM, DAM, UFD)
integer readable     # is file readable or not
integer writeable    # is file writeable or not
integer dumped       # is the dumped bit set or not

#------------------------------------------------------------------------
#
#  returns YES, NO, ERR depending on if the specified
#  arguments were true, false, or not determinable
#
#------------------------------------------------------------------------
#
#  how args are represented:
#
#  pathname:      unpacked, EOS terminated string, SWT style
#
#  exists:        -1 == does not exist
#                  0 == do not test for existence
#                 +1 == does exist
#
#  permissions:   as per PRIMOS directory bits
#
#  zero:          -1 == has non-zero length
#                  0 == do not test length
#                 +1 == has zero length
#
#  type:           0 == do not test type
#                 otherwise, as per PRIMOS directory bits
#                 except that the high order bit must be on
#                 in order to distinguish between SAM file
#                 test and do not test type.
#
#  readable:      -1 == file is not readable
#                  0 == do not test file readablilty
#                 +1 == file is readable
#
#  writeable:     -1 == file is not writeable
#                  0 == do not test file writability
#                 +1 == file is writeable
#
#  dumped:        -1 == file has not been dumped
#                  0 == do not test dumped bit
#                 +1 == file has been dumped
#
#------------------------------------------------------------------------

   integer p_fd, ppwd(32), pname(32), attach, temp
   character vname(MAXVARYFNAME)
   integer getto, open
   integer code, buf(MAXDIRENTRY), junk

   procedure return_NO forward
   procedure return_ERR forward

   if (getto (path, pname, ppwd, attach) == ERR)   # get to the file
      return (ERR)

   if (exists ~= 0) {      # check for existence
      call srch$$ (KEXST, pname, 32, p_fd, temp, code)
      if   ((code == EFNTF && exists == -1)
         || (code == EFNTS && exists == -1)
         || (code == 0 && exists == 1))
         ;
      else
         return_NO
      }

   if (readable ~= 0) {    # check if readable
      temp = open (path, READ)
      if (temp ~= ERR)
         call close (temp)
      if (temp == ERR && readable == 1
         || temp ~= ERR && readable == -1)
         return_NO
      }

   if (writeable ~= 0) {
      temp = open (path, WRITE)
      if (temp ~= ERR)
         call close (temp)
      if (temp == ERR && writeable == 1
         || temp ~= ERR && writeable == -1)
         return_NO
      }

   if (zero ~= 0) {           # check for zero / non-zero length
      call srch$$ (KREAD+KGETU, pname, 32, p_fd, temp, code)
      if (code ~= 0)
         return_ERR
      call prwf$$ (KPOSN+KPREA, p_fd, loc(temp), 0, intl(1), 0, code)
      call srch$$ (KCLOS, pname, 32, p_fd, temp, junk)
      if   ((code == 0 && zero == -1)
         || (code == EEOF && zero == 1))
         ;
      else
         return_NO
      }

   if (dumped ~= 0 || permissions ~= 0 || type ~= 0) {
      call srch$$ (KREAD+KGETU, KCURR, 0, p_fd, temp, code)
      if (code ~= 0)
         return_ERR
      call ptov (pname, ' 'c, vname, MAXVARYFNAME)
      call ent$rd (p_fd, vname, loc(buf), MAXDIRENTRY, code)
      call srch$$ (KCLOS, 0, 0, p_fd, temp, junk)
      if (code ~= 0)
         return_ERR

      if (permissions ~= 0) {
         if (permissions == and (buf(18), permissions))
            ;
         else
            return_NO
         }

      if (type ~= 0) {
         temp = and (type, :77)
         if (temp == and (buf(20), :77))
            ;
         else
            return_NO
         }

      if (dumped ~= 0) {
         if    ((dumped == -1 && and (buf(20), :40000) == 0)
             || (dumped == 1 && and (buf(20), :40000) ~= 0))
            ;
         else
            return_NO
         }
      }

   if (attach == YES)
      call at$hom (code)

   return (YES)


   # return_NO --- attach home and return NO
   procedure return_NO {

      if (attach == YES)
         call at$hom (code)
      return (NO)
      }


   # return_ERR --- attach home and return ERR
   procedure return_ERR {

      if (attach == YES)
         call at$hom (code)
      return (ERR)
      }

   end
