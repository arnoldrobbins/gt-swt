define (DB,#)

# comopt --- process compiler options for SWT/Primos compiler interfaces

   integer function comopt (ARG_BUF, cpos, ctab, ipos, itab)
   ARG_DECL
   integer cpos (ARB), ctab (ARB), ipos (ARB), itab (ARB)

   integer c, i, pos, fpos, lp, nlp, list (26), nlist (26)

   procedure process_actions (opos, level) forward
   procedure find_option (c) forward
   procedure find_unrestricted_options forward

   ### Build initial option list from those specified by the user:
   lp = 0
   for (i = 1; i <= ipos (1); i += 1) {
      pos = ipos (i + 1)
      c = OPTION_LETTER (pos)
      if (ARG_PRESENT_I (c)) {   # option was specified
         ARG_DEFAULT_INT_I (c, MAX_LEVEL (pos))
         LEVEL_SELECTED (pos) = ARG_VALUE_I (c)
         ADD_TO_LIST (pos, list, lp)
         if (ARG_VALUE_I (c) < MIN_LEVEL (pos)
               || ARG_VALUE_I (c) > MAX_LEVEL (pos)) {
            call print (ERROUT, "level numbers for -*c are *i to *i*n"p,
               c - 1 + 'a'c, MIN_LEVEL (pos), MAX_LEVEL (pos))
            return (ERR)
            }
         }
      }

   if (lp <= 0)   # no user-specified options
      find_unrestricted_options

   ### Process current list; build list of newly restricted options:
   while (lp > 0) {
      nlp = 0
      do i = 1, lp; {
         pos = list (i)
         c = OPTION_LETTER (pos)
         if (LEVEL_SELECTED (pos) == UNDEFINED)
            select
               when (DEFAULT_LEVEL (pos) < LIMITED_LWB (pos))
                  LEVEL_SELECTED (pos) = LIMITED_LWB (pos)
               when (DEFAULT_LEVEL (pos) > LIMITED_UPB (pos))
                  LEVEL_SELECTED (pos) = LIMITED_UPB (pos)
            else
               LEVEL_SELECTED (pos) = DEFAULT_LEVEL (pos)
         process_actions (pos, LEVEL_SELECTED (pos))
         }
      if (nlp <= 0)  # no newly restricted options this pass
         find_unrestricted_options
      else {         # replace list by nlist
         lp = nlp
         do i = 1, nlp
            list (i) = nlist (i)
         }
      }

   return (OK)


   # process_actions --- perform the actions for the specified options

      procedure process_actions (opos, level) {
      integer opos, level

      local c, i, j
      integer c, i, j
      integer length

DB    call print (ERROUT, "processing -*c*i*n"p,
DB          OPTION_LETTER (opos) - 1 + 'a'c, level)

      for (i = opos + 1;   # find the desired level entry
            (itab (i) ~= LEVEL || itab (i + 1) ~= level)
            && itab (i) ~= END_OF_OPTION; i += 1)
         ;

      if (itab (i) ~= LEVEL) {
DB       call print (ERROUT, "level *i undefined for -*c*n"p,
DB             level, OPTION_LETTER (opos) - 1 + 'a'c)
         return (ERR)
         }

      i += 2   # advance to first action entry
      repeat
         select (itab (i))
            when (SELECT) {
DB             call putlin ("SELECT"s, ERROUT)
               for (i += 1; itab (i) > 0; i += 1)
                  for (j = 1; j <= cpos (1); j += 1)
                     if (itab (i) == COMPILER_OPTION (cpos (j + 1))) {
                        CURRENT_STATE (cpos (j + 1)) = YES
DB                      call print (ERROUT, " -*s"p,
DB                            REPRESENTATION (cpos (j + 1)))
                        break
                        }
DB             call putch (NEWLINE, ERROUT)
               }
            when (DESELECT) {
DB             call putlin ("DESELECT"s, ERROUT)
               for (i += 1; itab (i) > 0; i += 1)
                  for (j = 1; j <= cpos (1); j += 1)
                     if (itab (i) == COMPILER_OPTION (cpos (j + 1))) {
                        CURRENT_STATE (cpos (j + 1)) = NO
DB                      call print (ERROUT, " -*s"p,
DB                            REPRESENTATION (cpos (j + 1)))
                        break
                        }
DB             call putch (NEWLINE, ERROUT)
               }
            when (RESTRICT) {
               c = RESTRICTED_OPTION (i)
DB             call print (ERROUT, "RESTRICT *c to [*i..*i]*n"p,
DB                   c - 1 + 'a'c, LOWER_LIMIT (i), UPPER_LIMIT (i))
               find_option (c)   # sets the global variable 'fpos'
               select
                  when (LEVEL_SELECTED (fpos) ~= UNDEFINED)
                     if (LEVEL_SELECTED (fpos) > UPPER_LIMIT (i)
                           || LEVEL_SELECTED (fpos) < LOWER_LIMIT (i)) {
                        call print (ERROUT, "-*c*i: *s*n"p,
                              OPTION_LETTER (opos) - 1 + 'a'c, level,
                              ERROR_MESSAGE (i))
                        return (ERR)
                        }
                  when (LIMITED_LWB (fpos) == UNDEFINED) {
                     LIMITED_LWB (fpos) = LOWER_LIMIT (i)
                     LIMITED_UPB (fpos) = UPPER_LIMIT (i)
                     ADD_TO_LIST (fpos, nlist, nlp)
                     }
                  when (LOWER_LIMIT (i) <= LIMITED_UPB (fpos)
                        && UPPER_LIMIT (i) >= LIMITED_LWB (fpos)) {
                     LIMITED_LWB (fpos) = max0 (LIMITED_LWB (fpos),
                                                LOWER_LIMIT (i))
                     LIMITED_UPB (fpos) = min0 (LIMITED_UPB (fpos),
                                                UPPER_LIMIT (i))
                     ADD_TO_LIST (fpos, nlist, nlp)
                     }
               else {
                  call print (ERROUT, "-*c*i: *s*n"p,
                        OPTION_LETTER (opos) - 1 + 'a'c, level,
                        ERROR_MESSAGE (i))
                  return (ERR)
                  }
               i += 5 + length (ERROR_MESSAGE (i))
               }
            when (END_OF_LEVEL)
               break
         else {
DB          call print (ERROUT, "unrecognized command at *i*n"p, i)
            return (ERR)
            }

      }  # process_actions


   # find_option --- find the table position of the specified option

      procedure find_option (c) {
      integer c

      for (fpos = 1; fpos <= ipos (1); fpos += 1)
         if (c == OPTION_LETTER (ipos (fpos + 1)))
            break

      if (fpos <= ipos (1))
         fpos = ipos (fpos + 1)
      else {
DB       call print (ERROUT, "can't find entry for *c*n"p, c - 1 + 'a'c)
         return (ERR)
         }

      }


   # find_unrestricted_options --- make list of unrestricted options

      procedure find_unrestricted_options {

      local i, pos
      integer i, pos

      lp = 0
      for (i = 1; i <= ipos (1); i += 1) {
         pos = ipos (i + 1)
         if (LEVEL_SELECTED (pos) == UNDEFINED) {
            LEVEL_SELECTED (pos) = DEFAULT_LEVEL (pos)
            ADD_TO_LIST (pos, list, lp)
            }
         }

      }



   end



# comfn --- extract file names for compiler interfaces

   integer function comfn (ARG_BUF, inpf, ext, listf, lext, binf, bext)
   ARG_DECL
   character inpf (ARB), ext (ARB), listf (ARB)
   character lext (ARB), binf (ARB), bext (ARB)

   integer getarg, deveq

   file_des fd
   file_des create, open

   if (getarg (1, inpf, MAXPATH) == EOF) {
      call remark ("missing input file name"p)
      return (ERR)
      }
   call mapstr (inpf, LOWER)
   if (deveq (inpf, "/dev/lps"s) == YES
         || deveq (inpf, "/dev/null"s) == YES) {
      call print (ERROUT, "*s: unreasonable input file*n"p, inpf)
      return (ERR)
      }
#  fd = open (inpf, READ)
#  if (fd == ERR) {
#     call print (ERROUT, "*s: can't open*n"p, inpf)
#     return (ERR)
#     }
#  call close (fd)

   if (ARG_TEXT (l) == EOS) {
      if (deveq (inpf, "/dev/tty"s) == YES)
         call scopy ("/dev/tty"s, 1, listf, 1)
      else
         call make_default (inpf, ext, listf, lext)
      }
   else
      call scopy (ARG_TEXT (l), 1, listf, 1)

#  fd = create (listf, WRITE)
#  if (fd == ERR) {
#     call print (ERROUT, "*s: can't create*n"p, listf)
#     return (ERR)
#     }
#  call close (fd)
   call convert_name (listf)

   if (ARG_TEXT (b) == EOS) {
      if (deveq (inpf, "/dev/tty"s) == YES)
         call scopy (bext, 1, binf, 1)
      else
         call make_default (inpf, ext, binf, bext)
      }
   else
      call scopy (ARG_TEXT (b), 1, binf, 1)

   if (deveq (binf, "/dev/lps"s) == YES
        || deveq (binf, "/dev/tty"s) == YES) {
      call print (ERROUT, "*s: unreasonable binary file*n"p, binf)
      return (ERR)
      }

#  fd = create (binf, WRITE)
#  if (fd == ERR) {
#     call print (ERROUT, "*s: can't create*n"p, binf)
#     return (ERR)
#     }
#  call close (fd)
   call convert_name (binf)

   call convert_name (inpf)

   return (OK)
   end



# comnl --- set and reset compiler options for omitted listing

   subroutine comnl (cpos, ctab, off, on)
   integer cpos (ARB), ctab (ARB), off (ARB), on (ARB)

   integer i, j

   for (i = 1; off (i) ~= EOS; i += 1)
      for (j = 1; j <= cpos (1); j += 1)
         if (off (i) == COMPILER_OPTION (cpos (j + 1))) {
            CURRENT_STATE (cpos (j + 1)) = NO
            break
            }

   for (i = 1; on (i) ~= EOS; i += 1)
      for (j = 1; j <= cpos (1); j += 1)
         if (on (i) == COMPILER_OPTION (cpos (j + 1))) {
            CURRENT_STATE (cpos (j + 1)) = YES
            break
            }

   return
   end



# make_default --- generate default name by manipulating extension

   subroutine make_default (source, sext, dest, dext)
   character source (ARB), sext (ARB), dest (ARB), dext (ARB)

   integer dlen, tlen, sp, tp
   integer equal, scopy
   character text (MAXLINE)

   dlen = scopy (source, 1, dest, 1)

   sp = 1
   while (sext (sp) ~= EOS) {
      for (tp = 1; sext (sp) ~= EOS && sext (sp) ~= ','c;
                            {tp += 1; sp += 1})
         text (tp) = sext (sp)
      text (tp) = EOS
      tlen = tp - 1

      if (tlen <= dlen && equal (text, dest (dlen - tlen + 1)) == YES) {
         call scopy (dext, 1, dest, dlen - tlen + 1)
         return
         }

      if (sext (sp) == ','c)
         sp += 1
      }

   call scopy (dext, 1, dest, dlen + 1)

   return
   end



# convert_name --- convert SWT pathnames and device names to treenames

   subroutine convert_name (name)
   character name (ARB)

   character temp (MAXLINE)

   integer i
   integer deveq, mktr$, index
   external index

   if (deveq (name, "/dev/tty"s) == YES)
      call scopy ("tty"s, 1, name, 1)
   else if (deveq (name, "/dev/lps"s) == YES)
      call scopy ("spool"s, 1, name, 1)
   else if (deveq (name, "/dev/null"s) == YES)
      call scopy ("no"s, 1, name, 1)
   else {
      call expand (name, temp, MAXLINE)
      if (index (temp, ':'c) == 0)
         i = mktr$ (temp, name)
      else {
         name (1) = "'"c
         i = mktr$ (temp, name (2)) + 2
         name (i) = "'"c
         name (i + 1) = EOS
         }
      }

   return
   end



# deveq --- see if a pathname corresponds to a SWT device name

   integer function deveq (path, device)
   character path (ARB), device (ARB)

   character temp (MAXPATH)

   integer l
   integer equal, stake

   l = stake (path, temp, 9)  # 9 = length of longest dev name (/dev/null)
   if (temp (l) == '/'c)
      temp (l) = EOS
   deveq = equal (temp, device)

   return
   end
