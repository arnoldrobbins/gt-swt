# hd --- summarize disk free space

   include PRIMOS_ERRD
   include PRIMOS_KEYS

   define (MAXRAT,8808)
   define (DEFAULT_NORM,NO)   # normalize on 448 word records by default?

   define (OLDENTRYTYPE,8r400)
   define (NEWENTRYTYPE,8r1000)
   define (MAX_DISK,62)
   define (NODISK,-1)
   define (out,1)

   include ARGUMENT_DEFS

   ARG_DECL
   integer ap, i, junk, disk, code, mfd, rfd, norm,
         rat_length, rat_buf (MAXRAT)
   integer read_rat, open_rat, bit_count, getarg, follow, gctoi
   longint recs, total_recs, number_of_records
   real percent_full
   character rat_name (MAXFNAME), arg (MAXLINE)

   equivalence (rat_buf (3), number_of_records)

   procedure do_current_disk forward

   PARSE_COMMAND_LINE ("nuv"s, "Usage: hd [-u|-n|-v] { <pack id> }"s)
   if (ARG_PRESENT (u)) {
      if (ARG_PRESENT (n))
         call error ("-n and -u are mutually exclusive"s)
      norm = NO
      }
   elif (ARG_PRESENT (n))
      norm = YES
   else  # default case
      norm = DEFAULT_NORM

   arg (1) = '/'c

   for (ap = 1; getarg (ap, arg (2), MAXLINE - 1) ~= EOF; ap += 1) {
      if (follow (arg, 0) == ERR) {
         call print (ERROUT, "*s: bad packname*n"s, arg (2))
         next
         }
      if (IS_DIGIT (arg (2))) {
         i = 2
         disk = gctoi (arg, i, 8)
         if (arg (i) ~= EOS)
            disk = NODISK
         }
      else
         disk = NODISK
      do_current_disk
      }

   if (ap == 1)   # no arguments, do all disks
      do disk = 0, MAX_DISK; {
         call encode (arg, MAXLINE, "/*,8i"s, disk)
         if (follow (arg, 0) == OK)
            do_current_disk
         }

   stop


# do_current_disk --- print information on the current disk pack

   procedure do_current_disk {

      call srch$$ (KREAD + KGETU, KCURR, 0, mfd, junk, code)
      if (code ~= 0) {
         call print (ERROUT, "*s: mfd unreadable*n"s, arg)
         goto out
         }

      rfd = open_rat (mfd, rat_name)   # open rat and return its name
      if (rfd == ERR) {
         call srch$$ (KCLOS, 0, 0, mfd, junk, code)
         call print (ERROUT, "*s: disk-rat unreadable*n"s, arg)
         goto out
         }

      rat_length = read_rat (rfd, rat_buf)
      if (rat_length == ERR) {
         call srch$$ (KCLOS, 0, 0, rfd, junk, code)
         call srch$$ (KCLOS, 0, 0, mfd, junk, code)
         call print (ERROUT, "*s: disk-rat badly formatted*n"s, arg)
         goto out
         }

      recs = 0
      for (i = rat_buf (1) + 1; i <= rat_length; i += 1)
         recs += bit_count (rat_buf (i))

      if (rat_buf (1) == 5)
         total_recs = rt (intl (rat_buf (3)), 16)
      else
         total_recs = number_of_records

      percent_full = (100.0 * (total_recs - recs)) / total_recs
      if (norm == YES && rat_buf (2) == 1040)
         recs = intl ((recs * 1024.0) / 440.0 + 0.5)

      if (disk == NODISK)
         call print (STDOUT, "    "s)
      else
         call print (STDOUT, "*2,8i: "s, disk)

      if (ARG_PRESENT (v))
         call print (STDOUT, "*2i heads  *6l recs  "s,
                     rat_buf (5), total_recs)
      call print (STDOUT, "*6l free  *6,2r% full *s*n"s,
                  recs, percent_full, rat_name)

      call srch$$ (KCLOS, 0, 0, mfd, junk, code)
      call srch$$ (KCLOS, 0, 0, rfd, junk, code)

   out
      continue

      }

   end


# bit_count --- count bits in a word

   integer function bit_count (word)
   integer word

   integer hex, bit_table (16)
   data bit_table /0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4/


   hex = rs (word, 12)
   bit_count = bit_table (hex + 1)

   hex = rt (rs (word, 8), 4)
   bit_count += bit_table (hex + 1)

   hex = rt (rs (word, 4), 4)
   bit_count += bit_table (hex + 1)

   hex = rt (word, 4)

   return (bit_count + bit_table (hex + 1))

   end


# open_rat --- open record availability table and return its name

   integer function open_rat (fd, name)
   integer fd
   character name (MAXFNAME)

   integer buf (MAXDIRENTRY), nwr, code

   call dir$rd (KINIT, fd, loc(buf), MAXDIRENTRY, code)
   repeat {
      call dir$rd (KREAD, fd, loc(buf), MAXDIRENTRY, code)
      if (code ~= 0)
         return (ERR)
      } until (and (buf (1), 8r177400) == OLDENTRYTYPE
               || and (buf (1), 8r177400) == NEWENTRYTYPE)

   call ptoc (buf (2), ' 'c, name, MAXFNAME)
   call mapstr (name, LOWER)

   call srch$$ (KREAD + KGETU, buf (2), 32, open_rat, nwr, code)
   if (code ~= 0)
      open_rat = ERR

   return
   end


# read_rat --- read record availability table, return length

   integer function read_rat (fd, buf)
   integer fd, buf (MAXRAT)

   integer nwr, code

   call prwf$$ (1, fd, loc (buf), MAXRAT, intl (0), nwr, code)
   if (code ~= 0 && code ~= EEOF)
      read_rat = ERR
   else
      read_rat = nwr

   return
   end
