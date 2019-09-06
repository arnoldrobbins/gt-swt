# lam --- laminate lines from separate files

   define (FILE_ENTRY,0)
   define (STRING_ENTRY,1)

   define (NOT_EOF,1)

   define (MAXENTRIES,256)

   integer etype (MAXENTRIES),
      eeof (MAXENTRIES)
   integer i, num_entries, fcount, eofcount, l, outlen
   integer getarg, getlin, ctoc

   file_des efd (MAXENTRIES)
   file_des open

   character arg (MAXLINE),
      strings (MAXLINE, MAXENTRIES),
      line (MAXLINE)

  # Build the lamination description:
   fcount = 0     # the number of files being read
   for (i = 1; getarg (i, arg, MAXLINE) ~= EOF; i += 1) {
      if (i > MAXENTRIES)
         call error ("too many files or insertion strings"p)
      if (arg (1) == '-'c && (arg (2) == 'i'c || arg (2) == 'I'c)) {
         etype (i) = STRING_ENTRY
         call scopy (arg, 3, strings (1, i), 1)    # subarray
         }
      else {
         etype (i) = FILE_ENTRY
         efd (i) = open (arg, READ)
         if (efd (i) == ERR)
            call cant (arg)
         eeof (i) = NOT_EOF
         fcount += 1
         }
      }
   if (i == 1) {     # the default---lam /dev/stdin1 /dev/stdin2
      etype (1) = FILE_ENTRY
      efd (1) = STDIN1
      eeof (1) = NOT_EOF
      etype (2) = FILE_ENTRY
      efd (2) = STDIN2
      eeof (2) = NOT_EOF
      i = 3
      fcount = 2
      }
   num_entries = i - 1

   if (fcount == 0)
      call error ("there must be at least one input file.")

  # Now laminate the files and padding strings until all files
  #   reach EOF:
   eofcount = 0
   repeat {
      outlen = 0
      for (i = 1; i <= num_entries; i += 1)
         if (etype (i) == STRING_ENTRY)
            outlen += ctoc (strings (1, i), line (outlen + 1),
               MAXLINE - outlen - 2)   # note subarray refs above
         else {   # etype (i) == FILE_ENTRY
            if (eeof (i) == NOT_EOF) {
               l = getlin (arg, efd (i))
               if (l == EOF) {
                  eeof (i) = EOF
                  eofcount += 1
                  if (eofcount >= fcount)
                     break 2
                  }
               else {
                  if (arg (l) == NEWLINE)
                     arg (l) = EOS
                  outlen += ctoc (arg, line (outlen + 1),   # subarray
                     MAXLINE - outlen - 2)
                  }
               }
            }
      line (outlen + 1) = NEWLINE
      line (outlen + 2) = EOS
      call putlin (line, STDOUT)
      }

   stop
   end
