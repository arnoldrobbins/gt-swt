# fsize --- program to size file structures

   include LIBRARY_DEFS
   include PRIMOS_KEYS
   include PRIMOS_ERRD
   include ARGUMENT_DEFS

   ARG_DECL
   character path (MAXPATH)
   integer state (4), record_size
   integer gfnarg, equal, gtrcsz
   longint size
   longint fsize$

   PARSE_COMMAND_LINE ("vfrwn<ign>"s,
         "Usage: fsize [-{f|r|v|w}] { <pathname> }"s)
   if (ARG_PRESENT (r) && ARG_PRESENT (w))
      call error ("-r and -w are mutually exclusive."s)

   state (1) = 1
   while (gfnarg (path, state) ~= EOF) {
      if (equal (path, "/dev/stdin1"s) == YES)
         path (1) = EOS    # case for no args, default to current dir
      record_size = gtrcsz (path)
      if (record_size == ERR)
         call print (ERROUT, "*s: can't get record size*n"s, path)
      else {
         size = fsize$ (path, ARG_PRESENT (f), record_size)
         if (size == ERR)
            call print (ERROUT, "*s: can't determine size*n"s, path)
         else {
            if (ARG_PRESENT (w))    # default to size in records
               size *= record_size
            call print (STDOUT, "*6l"s, size)
            if (ARG_PRESENT (v))
               call print (STDOUT, " | *s"s, path)
            call print (STDOUT, "*n"s)
            }
         }
      }

   stop
   end



# fsize$ --- return the size of any file system structure

   longint function fsize$ (path, force, record_size)
   character path (MAXPATH)
   bool force
   integer record_size

   define (MAX_LEVEL,128)        # maximum nesting level for tscan$
   define (BIG_VALUE,:17777777777)
   define (READPROT,:100000000)  # SATR$$: set r/ protection
   define (MULTREAD,:400000)     # SATR$$: set n+1 read/write lock

   integer code, code2, fd, junk, level, type
   integer entry (MAXDIRENTRY), fname (16), passwd (3)
   integer getto, tscan$
   bool nameqv
   longint size
   longint szfil$

   procedure freak forward
   procedure accumulate forward
   procedure force_open forward

   ### See if this is a valid pathname:
   if (getto (path, fname, passwd, junk) == ERR)
      freak

   ### First, we see what type of beastie we're dealing with.
   ### If it's in use or not readable then we have to do awful
   ### things to try and force it open.
   size = 0
   if (path (1) == EOS)
      call srch$$ (KREAD + KGETU, KCURR, 0, fd, type, code)
   else {
      call srch$$ (KREAD + KGETU, fname, 32, fd, type, code)
      if (force && (code == EFIUS || code == ENRIT)) {   # in use/unreadable?
         call srch$$ (KREAD + KGETU, KCURR, 0, fd, type, junk)
         call rden$$ (KNAME, fd, entry, MAXDIRENTRY, junk, fname, 32, code2)
         call srch$$ (KCLOS, 0, 0, fd, 0, junk)
         if (code2 == 0)
            force_open
         }
      }

   if (code ~= 0)
      freak
   else
      accumulate

   if (type ~= 4) {  # if not a directory
      call follow (EOS, 0)
      return (size)
      }

   if (path (1) ~= EOS) {
      call at$swt (fname, 32, 0, passwd, KICUR, code)
      if (code ~= 0) {
         call follow (EOS, 0)
         call print (ERROUT, "*s: can't size directory contents*n"s, path)
         return (size)
         }
      }

   level = 0
   repeat
      select (tscan$ (path, entry, level, MAX_LEVEL, PREORDER))
         when (ERR)
            call print (ERROUT, "*s: can't size directory contents*n"s, path)
         when (OK) {
            if (and (entry (20), 8r10000) ~= 0
                  && nameqv (entry (2), "MFD   "))
               next  # we have already sized the MFD
            call srch$$ (KREAD + KGETU, entry (2), 32, fd, type, code)
            if (force && (code == EFIUS || code == ENRIT))
               force_open
            if (code ~= 0)
               call print (ERROUT, "*s: can't determine size*n"s, path)
            else
               accumulate
            }
         when (EOF) {
            call follow (EOS, 0)
            return (size)
            }


   # freak --- clean up and return with error status

      procedure freak {

      call srch$$ (KCLOS, 0, 0, fd, 0, junk)
      call follow (EOS, 0)
      return (ERR)

      }


   # force_open --- try to force-open a file

      procedure force_open {

      local changes
      integer changes

      changes = 0          # indicate no changes made
      call break$ (DISABLE)
      repeat {
         select (code)
            when (ENRIT) { # failed because of insufficient rights
               call satr$$ (KPROT, entry (2), 32, READPROT, code)
               if (code ~= 0)
                  break
               changes |= 1   # indicate we changed the protection
               }
            when (EFIUS) {
               call satr$$ (KRWLK, entry (2), 32, MULTREAD, code)
               if (code ~= 0)
                  break
               changes |= 2   # indecate we changed the read/write lock
               }
         else
            break
         call srch$$ (KREAD + KGETU, entry (2), 32, fd, type, code)
         }

      if (and (changes, 1) ~= 0) {  # need to reset protection
         entry (19) = 0
         call satr$$ (KPROT, entry (2), 32, entry (18), junk)
         }

      if (and (changes, 2) ~= 0) {  # need to reset read/write lock
         entry (21) = 0
         entry (20) = rs (and (entry (20), 8r6000), 10)
         call satr$$ (KRWLK, entry (2), 32, entry (20), junk)
         }

      call break$ (ENABLE)

      }


   # accumulate --- add size of current file to total

      procedure accumulate {

      local temp
      longint temp

      select (type)
         when (0, 1)    # SAM or DAM file
            temp = szfil$ (fd, type, record_size)
         when (2, 3)    # SAM or DAM segment directory
            call szseg$ (temp, fd, type, record_size)
         when (4) {
            call rden$$ (KUPOS, fd, 0, 0, 0, BIG_VALUE, 0, code)
            call rden$$ (KGPOS, fd, 0, 0, 0, temp, 0, code)
            if (code ~= 0)
               temp = ERR
            else
               temp = (temp + record_size - 1) / record_size
            }
      if (temp == ERR)
         freak
      else
         size += temp
      call srch$$ (KCLOS, 0, 0, fd, 0, code)

      }

   end


# szfil$ --- find number of records in a file

   longint function szfil$ (fd, type, record_size)
   integer fd, type, record_size

   integer code, junk
   longint size

   repeat
      call prwf$$ (KPOSN + KPRER, fd, loc (0), 0, BIG_VALUE, junk, code)
      until (code ~= 0)

   if (code ~= EEOF)    # encountered some error besides EOF
      return (ERR)

   call prwf$$ (KRPOS, fd, loc (0), 0, size, junk, code)

   size = (size + record_size - 1) / record_size
   if (size == 0)    # every file has at least one data record
      size = 1
   if (type == 1)    # DAM file; include index records
      size += 1 + (2 * size - 1) / record_size

   return (size)
   end


# szseg$ --- find number of records in a segment directory

   subroutine szseg$ (size, fd, type, record_size)
   longint size
   integer fd, type, record_size

   integer entry_a, entry_b, nfd, ntype, code
   longint temp
   longint szfil$

   size = ERR
   call sgdr$$ (KGOND, fd, entry_a, entry_b, code)
   call sgdr$$ (KSPOS, fd, 0, entry_a, code)
   if (code ~= 0)
      return

   if (entry_b == 0)
      size = 1
   else
      size = (entry_b + record_size - 1) / record_size

   if (type == 3)    # DAM segment directory; include index records
      size += 1 + (2 * entry_b - 1 ) / record_size

   ### now size the contents of the segment directory:
   entry_b = -1
   repeat {
      entry_a = entry_b + 1
      call sgdr$$ (KFULL, fd, entry_a, entry_b, code)
      if (entry_b == -1 || code ~= 0)
         break
      call srch$$ (KREAD + KGETU + KISEG, fd, 0, nfd, ntype, code)
      if (code ~= 0) {
         size = ERR
         return
         }
      select (ntype)
         when (0, 1)    # SAM or DAM file
            temp = szfil$ (nfd, ntype, record_size)
         when (2, 3)    # SAM or DAM segment directory
            call szseg$ (temp, nfd, ntype, record_size)
      if (temp == ERR) {
         size = ERR
         return
         }
      else
         size += temp
      call srch$$ (KCLOS, 0, 0, nfd, 0, code)
      }

   return
   end



# gtrcsz --- find the record size of the device containing path

   integer function gtrcsz (path)
   character path (ARB)

   integer code, fd, junk, nwr, entry (24), fname (16), passwd (3)
   integer getto

   ### open the MFD of the disk containing path:
   if (getto (path, fname, passwd, junk) == ERR)
      return (ERR)
   call at$swt ("MFD", 3, KCURR, "XXXXXX", KIMFD, code)
   if (code ~= 0)
      return (ERR)
   call srch$$ (KREAD + KGETU, KCURR, 0, fd, junk, code)
   if (code ~= 0)
      return (ERR)

   ### read the entry for the disk record availability table:
   call rden$$ (KREAD, fd, entry, MAXDIRENTRY, nwr, 0, 0, code)
   call srch$$ (KCLOS, 0, 0, fd, 0, junk)
   if (code ~= 0 || nwr < 20)
      return (ERR)
   nwr = 440    # start by assuming a standard disk
   if (entry (20) < 0)  # msb of type word is set on storage modules
      nwr = 1024

   call follow (EOS, 0)

   return (nwr)
   end
