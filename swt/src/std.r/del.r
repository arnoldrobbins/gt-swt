# del --- delete files

  include PRIMOS_ERRD
  include LIBRARY_DEFS
  include ARGUMENT_DEFS

   ARG_DECL
   integer i, l, junk, level, entry (MAXDIRENTRY), max_levels, state(4), at
   character infbuf (MAXACLLIST), aux (MAXPATH), fprot (MAXPATH)
   integer getarg, getlin, tscan$, follow, remove, verify
   character path (MAXPATH), spath (MAXPATH)
   integer equal, gfnarg, gfdata, filtst

   procedure do_path forward
   procedure do_file forward
   procedure do_dir forward

   PARSE_COMMAND_LINE ("dfvs<oi>n<ign>"s,
         "Usage: del { -(d|f|s[<levels>]|v) } { -n | <path> }"s)
   ARG_DEFAULT_INT (s, MAX_INTEGER)
   max_levels = ARG_VALUE (s)
   if (ARG_PRESENT (f))
      call expand ("=user=+==dlu"s, fprot, MAXPATH)

   state(1) = 1
   while (gfnarg(path, state) ~= EOF) {
      if (equal(path, "/dev/stdin1"s) == YES)
         path(1) = EOS

      do_path
      }

   stop


   # do_dir --- operate on the contents of the current ufd

      procedure do_dir {

      level = 0
      repeat {
         select (tscan$ (path, entry, level, max_levels,
                                          POSTORDER+REATTACH))
            when (EOF)
               break
            when (OK) {
               call at$hom(junk)
               do_file
               }
         }

      }


   # do_file --- operate on a single file

      procedure do_file {
      local aclflag; integer aclflag

      include SWT_COMMON   # for Errcod

      if (~ARG_PRESENT (v) || verify (path) ~= NO) {

         aclflag = NO
         if (ARG_PRESENT (f))
            if (gfdata(FILE_ACL, path, infbuf, at, aux) == OK) {
               aclflag = YES
               call sfdata(FILE_ACL, aux(2), fprot, at, EOS)
               }
            else
               call sprot$ (path, "a"s)

         if (remove(path) == ERR)
            select (Errcod)
               when (EDNTE)   # directory not empty
                  call errmsg (path, "non-empty directory"s)
               when (ENRIT)   # file is protected
                  call errmsg (path, "protected"s)
               when (EFIUS)   # in use by someone else
                  call errmsg (path, "in use"s)
               when (EDLPR)   # file is delete protected
                  call errmsg (path, "delete protected"s)
               when (EFNTF)   # file doesn't exist
                  call errmsg (path, "not found"s)
            else              # unexpected error
               call errmsg (path, "can't delete"s)

         if (aclflag == YES && filtst(path, 0, 0, 1, 0, 0, 0, 0) == YES)
               call sfdata(FILE_ACL, aux(2), infbuf, junk, EOS)
         }
      }



   # do_path --- operate on a single <path_name> argument

      procedure do_path {

      local is_dir, ib, ax
      character ib(MAXACLLIST), ax(MAXPATH)
      integer is_dir

      if (ARG_PRESENT (f) && gfdata(FILE_ACL, path, ib, at, ax) ~= ERR)
         call sfdata(FILE_ACL, ax(2), fprot, at, EOS)

      if (path (1) == EOS && ~ARG_PRESENT (v))
         call remark ("delete current directory by name only"s)
      else {
         if (ARG_PRESENT (s) && follow (path, 0) ~= ERR) {
            is_dir = YES
            do_dir
            call at$hom(junk)
            }
         else
            is_dir = NO
         if (path (1) ~= EOS)    # not the empty pathname?
            if (is_dir == NO || ARG_PRESENT (d))
               do_file

         if (ARG_PRESENT (f) && (is_dir == NO || ~ARG_PRESENT (d)))
            if (filtst(path, 0, 0, 1, 0, 0, 0, 0) == YES)
               call sfdata(FILE_ACL, ax(2), ib, at, EOS)
         }
      }


   end


# verify --- ask user if its OK to delete a file

   integer function verify (str)
   character str (ARB)

   integer getlin
   character line (MAXLINE)

   call print (ERROUT, "*s ? "s, str)
   if (getlin (line, ERRIN) ~= EOF
         && (line (1) == 'y'c || line (1) == 'Y'c))
      verify = YES
   else
      verify = NO

   return
   end


# errmsg --- print out an error message

   subroutine errmsg (path, msg)
   integer path (ARB), msg (ARB)

   call print (ERROUT, "*s: *s*n"p, path, msg)

   return
   end
