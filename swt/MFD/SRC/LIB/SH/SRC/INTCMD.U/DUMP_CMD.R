# dump_cmd --- dump various Subsystem databases for debugging

   subroutine dump_cmd

   include SWT_COMMON

   integer ap, i, l
   integer getarg, ctoi, strlsr
   character arg (MAXARG)

   string_table apos, atxt,
      / 1, "ls",
      / 1, "linked_string",
      / 2, "sv",
      / 2, "shell_variable",
      / 2, "shell_variables",
      / 3, "fd",
      / 3, "file_desc",
      / 3, "file_descriptor",
      / 4, "cm",
      / 4, "common",
      / 4, "swt_common",
      / 4, "swt$cm"

   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1) {
      l = strlsr (apos, atxt, 1, arg)
      if (l == EOF) {
         call remark ("Usage:  dump { ls | linked_string"p)
         call remark ("             | sv | shell_variables"p)
         call remark ("             | fd [ <num> ] | file_desc [ <num> ]"p)
         call error  ("             | cm | swt_common }"p)
         }

      select (atxt (apos (l)))
         when (1)
            call lsdump (STDOUT)
         when (2)
            call svdump (STDOUT)
         when (3) {
            if (getarg (ap + 1, arg, MAXARG) ~= EOF && IS_DIGIT (arg (1))) {
               i = 1
               l = ctoi (arg, i)
               if (l >= 1 && l <= NFILES && arg (i) == EOS)
                  call dmpfd$ (l, STDOUT)
               else
                  call print (ERROUT, "*s: bad file desc number*n"s, arg)
               ap += 1
               }
            else
               for (i = 1; i <= NFILES; i += 1)
                  if (Fd_flags (fd_offset (i)) ~= 0)
                     call dmpfd$ (i, STDOUT)
            }
         when (4)
            call dmpcm$ (STDOUT)
      }

   stop
   end
