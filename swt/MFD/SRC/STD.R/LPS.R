# lps --- spool queue status monitor

   include ARGUMENT_DEFS
   include PRIMOS_KEYS
   include PRIMOS_ERRD
   include "lps_def.r.i"

   ARG_DECL
   integer Td (28), Dest (3), Paper (3)
   integer getarg
   character Queue_path (MAXPATH), Pack (33)

   string no_spoolq_msg "Can't find SPOOLQ directory"
   string no_qctrl_msg "Can't read queue"

   procedure cancel_entries forward
   procedure list_queue forward

   call timdat (Td, 28)    # we need our login name in packed format

   PARSE_COMMAND_LINE ("c a<rs>dmp<rs>q"s, _
      "Usage: lps (-c {<seq>} | {<pack>} [-{a <dest>|d|m|p <paper>|q}])"s)

   if (ARG_PRESENT (c))
      cancel_entries
   else {                  # list spool queue(s)
      do i = 1, 3; {
         Paper (i) = "  "
         Dest (i) = "  "
         }
      if (ARG_PRESENT (p)) {
         call mapstr (ARG_TEXT (p), UPPER)
         i = 1
         call ctop (ARG_TEXT (p), i, Paper, 3)
         }
      if (ARG_PRESENT (a)) {
         call mapstr (ARG_TEXT (q), UPPER)
         i = 1
         call ctop (ARG_TEXT (a), i, Dest, 3)
         }
      for (i = 1; getarg (i, Pack, 33) ~= EOF; i += 1) {
         call mapstr (Pack, UPPER)
         list_queue
         }
      if (i == 1) {
         Pack (1) = EOS
         list_queue
         }
      }


# cancel_entries --- cancel one or more entries from the queue

   procedure cancel_entries {

   local arg, junk, qnam, qent
   character arg (MAXARG), sprt (7)
   integer at, ap, code, entry, fd, i,
         junk (3), prt (3), qnam (16), qent (ENTSIZ)
   integer getto, getarg, ctoi
   longint entpos
   bool nameqv

   if (getto ("//spoolq/q.ctrl"s, qnam, junk, at) == ERR) {
      call print (ERROUT, "*s.*n"s, no_spoolq_msg)
      call error (EOS)
      }

   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1) {
      call mapstr (arg, LOWER)
      if (arg (1) == 'p'c && arg (2) == 'r'c && arg (3) == 't'c)
         i = 4
      else
         i = 1
      entry = ctoi (arg, i)
      if (arg (i) ~= EOS || entry <= 0 || entry >= MAXENTRIES) {
         call print (ERROUT, "*s: bad sequence number*n"s, arg)
         next
         }
      call encode (sprt, 7, "prt*3,,0i"s, entry)
      i = 1
      call ctop (sprt, i, prt, 3)
      entpos = intl ((entry - 1) * ENTSIZ + HDRSIZ)
      call q$offc (fd, qnam, 6, KREAD + KGETU, code)
      if (code == 0) {
         call prwf$$ (KREAD + KPREA, fd, loc (qent), 4,
                  entpos, junk, code)
         call srch$$ (KCLOS, 0, 0, fd, 0, junk)
         call break$ (ENABLE)
         }
      if (code ~= 0) {
         call print (ERROUT, "*s.*n"s, no_qctrl_msg)
         call error (EOS)
         }
      if (qent (1) == 0)
         call print (ERROUT, "*,6h: not found*n"p, prt)
      elif (~nameqv (qent (2), LOGIN_NAME)
            && ~nameqv (LOGIN_NAME, "SYSTEM")) {
         code = ERR
         call print (ERROUT, "*,6h: not yours*n"p, prt)
         }
      else {
         call satr$$ (KPROT, prt, 6, 16r4000000, junk)
         call srch$$ (KCLOS, prt, 6, 0, 0, junk)
         call srch$$ (KDELE, prt, 6, 0, 0, code)
         call satr$$ (KPROT, prt, 6, 16r7000000, junk)
         if (code == EFNTF)   # print file already gone
            code = 0
         if (code ~= 0)
            call print (ERROUT, "*,6h: in use*n"p, prt)
         }
      if (code == 0) {
         call q$rem (qnam, fd, entry, code)
         call srch$$ (KCLOS, 0, 0, fd, 0, junk)
         call break$ (ENABLE)
         if (code ~= 0)
            call print (ERROUT, "*,6h: can't cancel*n"p, prt)
         }
      }

   }


# list_queue --- list the contents of the specified queue(s)

   procedure list_queue {

   local junk, qnam, f
   integer at, code, f1, f2, i, t1, t2, f,
         Buf (BUFSIZE), junk (3), qnam (16)
   integer getto
   bool Header_printed

   procedure print_area (from, to) forward

   call encode (Queue_path, MAXPATH, "/*s/spoolq/q.ctrl"s, Pack)

   if (getto (Queue_path, qnam, junk, at) ~= ERR) {
      call read_queue (qnam, f, Buf, f1, t1, f2, t2, code)
      call follow (EOS, 0)
      if (code == 0) {
         Header_printed = FALSE
         if (f1 ~= 0) {
            print_area (f1, t1)
            if (f2 ~= 0)
               print_area (f2, t2)
            }
         }
      else
         if (Pack (1) == EOS)
            call print (ERROUT, "*s.*n", no_qctrl_msg)
         else
            call print (ERROUT, "*s on disk *s.*n"s, no_qctrl_msg, Pack)
      }
   else
      if (Pack (1) == EOS)
         call print (ERROUT, "*s.*n"s, no_spoolq_msg)
      else
         call print (ERROUT, "*s on disk *s.*n"s, no_spoolq_msg, Pack)

   }


# print_area --- print one area of the spool queue

   procedure print_area (from, to) {
   integer from, to

   local i
   character pflag (2), ssize (6), sdest (17), sname (25)
   integer i, ent, qent (ENTSIZ)
   integer ptoc
   bool nameqv

   string heading_format _
      "*,,#u*6s *3s *5s *16s *5s *6s *6s *5s *14s*n"

   do ent = from, to; {
      if (Buf (ent * ENTSIZ - ENTSIZ + 1) == 0)    # no entry here
         next
      call move$ (Buf (ent * ENTSIZ - ENTSIZ + 2), qent, ENTSIZ - 1)
      if (ARG_PRESENT (m) && ~nameqv (qent (OWNER_NAME), LOGIN_NAME)
            || ARG_PRESENT (d) && and (qent (OPTION_WORD), DEFER_BIT) == 0
            || ARG_PRESENT (p) && ~nameqv (qent (PAPER_TYPE), Paper)
            || ARG_PRESENT (a) && ~nameqv (qent (DEST_NAME), Dest))
         next
      if (and (qent (OPTION_WORD), COPIES_BIT) == 0)
         qent (COPIES) = 1
      if (qent (ENTRY_SIZE) < 0)    # still spooling
         call ctoc (" open"s, ssize, 6)
      else
         call encode (ssize, 6, "*5i"s, qent (ENTRY_SIZE))
      pflag (1) = EOS
      if (and (qent (OPTION_WORD), DEST_BIT) ~= 0
            || qent (PRINT_FLAG) == "<-") {
         i = ptoc (qent (DEST_NAME), ' 'c, sdest, 17)
         if (qent (DEST_NAME2) ~= "  ")
            i += ptoc (qent (DEST_NAME2), ' 'c, sdest (i + 1), 17 - i)
         if (qent (PRINT_FLAG) == "<-")
            call ctoc ("*"s, pflag, 2)
         }
      else
         sdest (1) = EOS
      call ptoc (qent (ENTRY_NAME), ' 'c, sname, 25)
      if (~Header_printed) {
         Header_printed = TRUE
         if (Pack (1) ~= EOS)
            call print (STDOUT, "****** *s:*n"s, Pack)
         if (~ARG_PRESENT (q)) {
            call print (STDOUT, heading_format, ' 'c,
               "user"s, "prt"s, "time"s, "banner"s, " size"s,
               "copies"s, "form"s, "defer"s, "destination"s)
            call print (STDOUT, heading_format, '='c,
               EOS, EOS, EOS, EOS, EOS, EOS, EOS, EOS, EOS)
            }
         }
      if (ARG_PRESENT (q))
         call print (STDOUT, "*3,,0i *,6h *5s *1s*6s *s*n"p,
            ent, qent (OWNER_NAME), ssize, pflag, sdest, sname)
      else {
         call print (STDOUT,
            "*,6h *3,,0i *2i:*2,,0i *,16h *5s *6i *,6h "p,
            qent (OWNER_NAME), ent, qent (ENTRY_TIME) / 60,
            mod (qent (ENTRY_TIME), 60), qent (ENTRY_NAME),
            ssize, qent (COPIES), qent (PAPER_TYPE))
         if (and (qent (OPTION_WORD), DEFER_BIT) ~= 0)
            call print (STDOUT, "*2i:*2,,0i "s, qent (DEFER_TIME) / 60,
               mod (qent (DEFER_TIME), 60))
         else
            call print (STDOUT, "*6x"p)
         call print (STDOUT, "*s*s*n"p, pflag, sdest)
         }
      }

   }


   stop
   end



# read_queue --- read queue into buffer

   subroutine read_queue (qnam, f, qbuf, f1, t1, f2, t2, code)
   integer qnam (3), f, qbuf (ARB), f1, t1, f2, t2, code

   integer code, hbuf (HDRSIZ), junk
   longint pos

   procedure finish forward

   f1 = 0
   f2 = 0
   call q$offc (f, qnam, 6, KREAD+KGETU, code)
   if (code ~= 0)
      return

   call prwf$$ (KREAD, f, loc (hbuf), HDRSIZ, intl (0), junk, code)
   if (code ~= 0)
      finish

   if (hbuf (7) == 0)   # queue is empty
      finish

   f1 = hbuf (3)        # start of first valid area
   t1 = hbuf (4) - 1    # end of first valid area
   if (t1 - f1 < 0)     # check for wrap around
      t1 = MAXENTRIES

   pos = intl (f1) * ENTSIZ + HDRSIZ - ENTSIZ
   call prwf$$ (KREAD+KPREA, f, loc (qbuf (pos - HDRSIZ + 1)),
         (t1 - f1 + 1) * ENTSIZ, pos, junk, code)
   if (code ~= 0)
      finish
   if (t1 ~= MAXENTRIES)   # only one valid area
      finish

   t2 = hbuf (4) - 1       # end of second valid area
   if (t2 <= 0)            # no entries in the second area
      finish
   f2 = 1                  # second area always begins at first entry
   call prwf$$ (KREAD+KPREA, f, loc (qbuf), t2 * ENTSIZ,
         intl (HDRSIZ), junk, code)

   finish


   # finish --- close queue file, enable breaks and return

      procedure finish {

      call srch$$ (KCLOS, 0, 0, f, 0, junk)
      call break$ (ENABLE)
      return

      }

   end



#  q$offc --- open file fight contention

   subroutine q$offc(fd, name, len, key, code)
   integer fd, name(16), len, key, code

   integer i, junk


   for (i = 1; i <= 30; i += 1) {
      call break$(DISABLE)
      call srch$$(key, name, len, fd, junk, code)

      if (code ~= EFIUS)
         break

      call break$(ENABLE)
      call sleep$(intl(1000))
      }

   if (code ~= 0 && i <= 30)
      call break$(ENABLE)

   return
   end
