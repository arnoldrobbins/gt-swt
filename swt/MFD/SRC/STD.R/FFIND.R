#  ffind --- find lines matching a given pattern (kmp style)

   include ARGUMENT_DEFS

   define (MAXLINE,512)
   define (MAXMATCH,32766)

   ARG_DECL
   bool found
   file_des fd
   file_des open
   integer lcnt, ocnt, i, j
   character name (MAXARG), pat (MAXARG)
   character buf (MAXLINE), ibuf (MAXLINE)
   integer state (4), dfa (MAXARG), fs, plen, blen

   integer occurrence
   bool count, ignore, number, verify, exclude

   file_des open
   integer gfnarg, getarg, getlin, mapdn

   procedure do_args forward
   procedure do_file forward

   string usage _
      "Usage: ffind <pattern> {-{c|i|l|o<num>|v|x}} {<file spec>}"


   do_args
   state (1) = 1

   fs = gfnarg (name, state)
   while (fs ~= EOF) {
      if (fs == OK) {
         fd = open (name, READ)
         if (fd == ERR) {
            call print (ERROUT, "*s: can't open*n"s, name)
            }
         else {
            do_file
            call close (fd)
            }
         }
      else
         call print (ERROUT, "*s: can't open*n"s, name)

      fs = gfnarg (name, state)
      }

   stop



#  do_args --- process command line arguments

   procedure do_args {


      plen = getarg (1, pat, MAXARG)
      if (plen == EOF)
         call error (usage)

      call delarg (1)

      PARSE_COMMAND_LINE ("cilvxn<ign>o<oi>"s, usage)
      if (ARG_PRESENT (o))
         ARG_DEFAULT_INT (o, 1)
      else
         ARG_DEFAULT_INT (o, MAXMATCH)
      occurrence = ARG_VALUE (o)

      count = FALSE
      ignore = FALSE
      number = FALSE
      verify = FALSE
      exclude = FALSE

      if (ARG_PRESENT (c))
         count = TRUE
      if (ARG_PRESENT (i))
         ignore = TRUE
      if (ARG_PRESENT (l))
         number = TRUE
      if (ARG_PRESENT (v))
         verify = TRUE
      if (ARG_PRESENT (x))
         exclude = TRUE

      if (ignore)
         call mapstr (pat, LOWER)

      dfa (1) = 0
      for (i = 2; i <= plen; i += 1) {
         j = dfa (i - 1)
         while (j ~= 0 && pat (j) ~= pat (i - 1))
            j = dfa (j)

         dfa (i) = j + 1
         }
      }



# do_file --- match strings in 1 file

   procedure do_file {

      lcnt = 0
      ocnt = 0

      repeat {
         if (ignore) {
            blen = getlin (ibuf, fd, MAXLINE)
            j = blen + 1
            do i = 1, j
               buf (i) = mapdn (ibuf (i))
            }
         else
            blen = getlin (buf, fd, MAXLINE)

         if (blen == EOF)
            break

         i = 1
         j = 1
         lcnt += 1

         while (buf (i) ~= EOS && pat (j) ~= EOS) {
            if (buf (i) == pat (j)) {
               i += 1; j += 1
               }
            else
               j = dfa (j)

            if (j == 0) {
               i += 1; j += 1
               }
            }

         found = FALSE
         if (((pat (j) == EOS) & ~exclude) || ((pat (j) ~= EOS) & exclude))
            found = TRUE

         if (found) {
            ocnt += 1

            if (~ count) {
               if (verify)
                  call print (STDOUT, "*s:"s, name)
               if (number)
                  call print (STDOUT, "*i:"s, lcnt)
               if (~ ignore)
                  call putlin (buf, STDOUT)
               else
                  call putlin (ibuf, STDOUT)
               }
            }
         } until (ocnt >= occurrence)

      if (count) {
         if (verify)
            call print (STDOUT, "*s:"s, name)
         call print (STDOUT, "*i*n"s, ocnt)
         }
      }

   end
