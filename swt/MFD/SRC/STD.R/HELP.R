# help --- provide help for users in need

#     Usage:
#        help  { <option> | <item> }
#           <option> ::=  -c     # command
#                       | -d     # dumb terminals
#                       | -s     # subprogram
#                       | -g     # general_info
#                       | -i     # index (from manual)
#                       | -f     # find related commands
#                       | -p     # printer format
#                       | -u     # usage info only
#           <item> ::= <identifier>

#        Default search rule is commands/subprograms/general_info.
#        "help" is equivalent to "help -g general"

   define (MAXPAT,128)
   define (SCREENSIZE, 23)
   define (MAXLINE, 300)
   define (LINE_START, 13)

   define (SEARCH_ALL, -1)       # non-positive, to avoid confusion
   define (SEARCH_CMD, 1)
   define (SEARCH_SUB, 2)
   define (SEARCH_GEN, 3)
   define (SEARCH_INX, 4)

   define (CMD_LOCN, "=doc=/fman/s1/&.d"s)
   define (LCMD_LOCN,"=doc=/fman/s3/&.d"s)
   define (SUB_LOCN, "=doc=/fman/s2/&.d"s)
   define (LSUB_LOCN,"=doc=/fman/s4/&.d"s)
   define (LLCMD_LOCN,"=doc=/fman/s5/&.d"s)
   define (LLSUB_LOCN,"=doc=/fman/s6/&.d"s)
   define (GEN_LOCN, "=doc=/help/&.d"s)
   define (INX_LOCN, "=doc=/fman/contents"s)

   define (PRINTER_FORM, 1)
   define (TERMINAL_FORM, 2)

   character item (MAXLINE)
   integer form, lines_so_far, last_line_blank, usage_only, options
   common /helpcom/ form, lines_so_far, last_line_blank, usage_only, item, options

   integer search_rule, arg, junk
   integer getarg, equal, look_up, locate_inx
   integer page


   options = PG_VTH
   search_rule = SEARCH_ALL
   form = TERMINAL_FORM
   lines_so_far = 0
   last_line_blank = YES
   usage_only = NO
   item (1) = EOS

   for (arg = 1; getarg (arg, item, MAXLINE) ~= EOF; arg += 1) {
      call mapstr (item, LOWER)
      if (equal (item, "-c"s) == YES)
         search_rule = SEARCH_CMD
      elif (equal (item, "-d"s) == YES)
         options = 0
      elif (equal (item, "-f"s) == YES)
         search_rule = SEARCH_INX
      elif (equal (item, "-g"s) == YES)
         search_rule = SEARCH_GEN
      elif (equal (item, "-i"s) == YES) {
         junk = locate_inx ("?*"s)
         if (junk == EOF)       # from page, user wants out!
                stop
         }
      elif (equal (item, "-p"s) == YES)
         form = PRINTER_FORM
      elif (equal (item, "-s"s) == YES)
         search_rule = SEARCH_SUB
      elif (equal (item, "-u"s) == YES)
         usage_only = YES
      else {
         junk = look_up (item, search_rule)
         if (junk == NO)
            call print (ERROUT, "Sorry, no help is available for *s*n"p,
               item)
         elif (junk == EOF)
            stop
         }
      }

   if (arg == 1) {                  # no arguments
      call ctoc ("general help"s, item, MAXCARD)
      junk = look_up ("general"s, SEARCH_GEN)
      # don't need to check for EOF here, since fall thru immediately
      }

   stop
   end



# look_up --- locate information and print it, a screen at a time

   integer function look_up (item, search_rule)
   character item (ARB)
   integer search_rule

   integer locate_cmd, locate_sub, locate_inx, locate_gen

   select (search_rule)
      when (SEARCH_ALL) {
         look_up = locate_cmd (item)
         if (look_up == NO) {
            look_up = locate_sub (item)
            if (look_up == NO)
               look_up = locate_gen (item)
            }
         }
      when (SEARCH_CMD)
         look_up = locate_cmd (item)
      when (SEARCH_SUB)
         look_up = locate_sub (item)
      when (SEARCH_INX)
         look_up = locate_inx (item)
      when (SEARCH_GEN)
         look_up = locate_gen (item)
   else
      call error ("in look_up:  can't happen"p)

   return
   end



# locate_cmd --- locate and print information about a command

   integer function locate_cmd (item)
   character item (ARB)

   character path (MAXLINE)

   integer file
   integer open, display

   call substitute (CMD_LOCN, item, path, MAXLINE)
   file = open (path, READ)
   if (file == ERR) {
      call substitute (LCMD_LOCN, item, path, MAXLINE)
      file = open (path, READ)
      if (file == ERR) {
         call substitute (LLCMD_LOCN, item, path, MAXLINE)
         file = open (path, READ)
         if (file == ERR)
            return (NO)
         }
      }
   if (display (file) == EOF) {
      call close (file)
      return (EOF)
      }
   # else
   call close (file)

   return (YES)
   end



# locate_sub --- locate and print information about a subprogram

   integer function locate_sub (item)
   character item (ARB)

   character path (MAXLINE)

   integer file
   integer open, display

   call substitute (SUB_LOCN, item, path, MAXLINE)
   file = open (path, READ)
   if (file == ERR) {
      call substitute (LSUB_LOCN, item, path, MAXLINE)
      file = open (path, READ)
      if (file == ERR) {
         call substitute (LLSUB_LOCN, item, path, MAXLINE)
         file = open (path, READ)
         if (file == ERR)
            return (NO)
         }
      }
   if (display (file) == EOF) {
      call close (file)
      return (EOF)
      }
   # else
   call close (file)

   return (YES)
   end



# locate_gen --- locate and print general information

   integer function locate_gen (item)
   character item (ARB)

   character path (MAXLINE)

   integer file
   integer open, display

   call substitute (GEN_LOCN, item, path, MAXLINE)
   file = open (path, READ)
   if (file == ERR)
      return (NO)

   if (display (file) == EOF) {
      call close (file)
      return (EOF)
      }
   # else
   call close (file)

   return (YES)
   end



# locate_inx --- find and print all index items matching a given pattern

   integer function locate_inx (index_item)
   character index_item (ARB)

   character item (MAXLINE)
   integer form, lines_so_far, last_line_blank, usage_only, options
   common /helpcom/ form, lines_so_far, last_line_blank, usage_only, item, options

   character pat (MAXPAT), line (MAXLINE), lcline (MAXLINE)
   character p_prompt (MAXLINE), ep_prompt (MAXLINE), str (MAXLINE)

   integer file, page
   integer open, makpat, match, display_line, getlin, equal, i, j

   file_des scratch_fd, mktemp, rmtemp

   locate_inx = YES

   if (makpat (index_item, 1, EOS, pat) == ERR) {
      call print (ERROUT, "*s:  ill-formed pattern*n"s, index_item)
      return
      }

   file = open (INX_LOCN, READ)
   if (file == ERR) {
      call print (ERROUT, "cannot open index file *s*n"s, INX_LOCN)
      return
      }

   scratch_fd = mktemp (READWRITE)

   if (scratch_fd == ERR)
      call error ("cannot create scratch file for help entry"p)

   while (getlin (line, file, MAXLINE) ~= EOF) {
      call scopy (line, 1, lcline, 1)
      call mapstr (lcline, LOWER)
      if (match (lcline, pat) == YES)
         if (display_line (line, scratch_fd) == ERR)
            break
      }

   call close (file)
   call rewind (scratch_fd)

   if (equal (index_item, "?*"s) == YES) {      # complete index
      call encode (p_prompt, MAXCARD, "help index [**i+] more ? "s)
      call encode (ep_prompt, MAXCARD, "help index [**i$] more ? "s)
      }
   else {                     # pattern search....  double up stars
      for ({i = 1; j = 1}; index_item (i) ~= EOS; i += 1)
         if (j < MAXLINE - 1) {
            str (j) = index_item (i)

            if (str (j) == '*'c) {
               str (j + 1) = '*'c
               j += 1
               }

            j += 1
            }

      str (j) = EOS
      call encode (p_prompt, MAXCARD, "*s [**i+] more ? "s, str)
      call encode (ep_prompt, MAXCARD, "*s [**i$] more ? "s, str)
      }

   if (page (scratch_fd, p_prompt, ep_prompt, SCREENSIZE, STDOUT, options)
                        == EOF)
      locate_inx = EOF

   if (rmtemp (scratch_fd) == ERR)
      call error ("cannot close scratch file"p)

   return
   end



# substitute --- place an item in a template, return resulting string

   subroutine substitute (template, item, result, maxlen)
   integer maxlen
   character template (ARB), item (ARB), result (maxlen)

   integer i, j, k

   i = 1    # the index into the template
   j = 1    # the index into the result

   while (template (i) ~= EOS && j < maxlen)
      if (template (i) ~= '&'c) {
         result (j) = template (i)
         i += 1
         j += 1
         }
      else {
         i += 1
         for (k = 1; item (k) ~= EOS && j < maxlen; k += 1) {
            result (j) = item (k)
            j += 1
            }
         }
   result (j) = EOS

   return
   end



# display --- display a file on the terminal in screen-sized chunks

   integer function display (file)
   integer file

   character item (MAXLINE)
   integer form, lines_so_far, last_line_blank, usage_only, options
   common /helpcom/ form, lines_so_far, last_line_blank, usage_only, item, options

   character line (MAXLINE), sfunction (26), sdescription (35)
   character p_prompt (MAXLINE), ep_prompt (MAXLINE), str (MAXLINE)

   integer getlin, display_line, equal, i, j, page
   file_des scratch_fd, mktemp, rmtemp

  # Note secret knowledge of reference manual format implicit
  #   in the following data statements:

   data sfunction / _
      '_'c, BS, 'F'c,
      '_'c, BS, 'u'c,
      '_'c, BS, 'n'c,
      '_'c, BS, 'c'c,
      '_'c, BS, 't'c,
      '_'c, BS, 'i'c,
      '_'c, BS, 'o'c,
      '_'c, BS, 'n'c,
      NEWLINE,
      EOS/

   data sdescription / _
      '_'c, BS, 'D'c,
      '_'c, BS, 'e'c,
      '_'c, BS, 's'c,
      '_'c, BS, 'c'c,
      '_'c, BS, 'r'c,
      '_'c, BS, 'i'c,
      '_'c, BS, 'p'c,
      '_'c, BS, 't'c,
      '_'c, BS, 'i'c,
      '_'c, BS, 'o'c,
      '_'c, BS, 'n'c,
      NEWLINE,
      EOS/

   if (usage_only == NO) {             # don't page usage info
      scratch_fd = mktemp (READWRITE)

      if (scratch_fd == ERR)
         call error ("cannot create scratch file for help entry"p)
      }

   while (getlin (line, file, MAXLINE) ~= EOF) {
      if (usage_only == YES)
         if (equal (line (LINE_START), sfunction) == YES
           || equal (line (LINE_START), sdescription) == YES)
            break
      if (usage_only == YES) {
         if (display_line (line, STDOUT) == ERR)
            break
         }
      elif (display_line (line, scratch_fd) == ERR)
         break
      }

   if (usage_only == NO) {
      call rewind (scratch_fd)

      for ({i = 1; j = 1}; item (i) ~= EOS; i += 1)
         if (j < MAXLINE - 1) {               # double up stars
            str (j) = item (i)

            if (str (j) == '*'c) {
               str (j + 1) = '*'c
               j += 1
               }

            j += 1
            }

      str (j) = EOS

      call encode (p_prompt, MAXCARD, "*s [**i+] more ? "s, str)
      call encode (ep_prompt, MAXCARD, "*s [**i$] more ? "s, str)
      display = page (scratch_fd, p_prompt, ep_prompt, SCREENSIZE, STDOUT, options)

      if (rmtemp (scratch_fd) == ERR)
         call error ("cannot close scratch file"p)
      }

   return
   end



# display_line --- edit a line for display on a terminal

   integer function display_line (line, fd)
   character line (ARB)
   file_des fd

   character item (MAXLINE)
   integer form, lines_so_far, last_line_blank, usage_only, options
   common /helpcom/ form, lines_so_far, last_line_blank, usage_only, item, options

   integer i, j

   if (form == PRINTER_FORM) {
      call putlin (line, fd)
      return (OK)
      }

   if (line (1) == NEWLINE)
      if (last_line_blank == YES)
         return (OK)
      else
         last_line_blank = YES
   else
      last_line_blank = NO

   j = 1
   for (i = 1; line (i) ~= EOS; i += 1)
      if (line (i) == BACKSPACE)
         j -= 1
      else {
         line (j) = line (i)
         j += 1
         }

   line (j) = EOS
   i = 1

   while (i < LINE_START && line (i) ~= NEWLINE && line (i) ~= EOS)
      i += 1

   call putlin (line (i), fd)      # Subarray
   lines_so_far += 1

   return (OK)
   end
