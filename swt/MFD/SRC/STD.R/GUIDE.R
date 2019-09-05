# guide --- retrieve User's guides for users in need

#     Usage:

#        guide  { <option> | <item> }
#           <option> ::=  -p     # printer format
#           <item> ::= <identifier>


   define (SCREENSIZE, 23)
   define (MAXLINE, 500)
   define (LINE_START, 13)

   define (CMD_LOCN, "=doc=/fguide/&")

   define (PRINTER_FORM, 1)
   define (TERMINAL_FORM, 2)

   string general_info "general"

   integer form, lines_so_far, last_line_blank
   common /guidecom/ form, lines_so_far, last_line_blank

   integer arg, junk
   integer getarg, equal, locate

   character item (MAXLINE)

   string dash_p "-p"

   form = TERMINAL_FORM
   lines_so_far = 0
   last_line_blank = YES

   for (arg = 1; getarg (arg, item, MAXLINE) ~= EOF; arg = arg + 1) {
      call mapstr (item, LOWER)
      if (equal (item, dash_p) == YES)
         form = PRINTER_FORM
      else
         if (locate (item) == NO)
            call print (ERROUT, "Sorry, no *s guide is available*n.",
               item)
      }

   if (arg == 1)
      junk = locate (general_info)

   stop
   end



# locate --- locate information and print it, a screen at a time

   integer function locate (item)
   character item (ARB)

   string template CMD_LOCN

   character path (MAXLINE)

   integer file
   integer open

   call substitute (template, item, path, MAXLINE)
   file = open (path, READ)
   if (file == ERR)
      locate = NO
   else {
      locate = YES
      call display (file)
      call close (file)
      }

   return
   end



# substitute --- place an item in a template, return resulting string

   subroutine substitute (template, item, result, maxlen)
   integer maxlen
   character template (ARB), item (ARB), result (maxlen)

   integer i, j, k

   i = 1    # the index into the template
   j = 1    # the index into the result

   while (template (i) ~= EOS & j < maxlen)
      if (template (i) ~= '&'c) {
         result (j) = template (i)
         i = i + 1
         j = j + 1
         }
      else {
         i = i + 1
         for (k = 1; item (k) ~= EOS & j < maxlen; k = k + 1) {
            result (j) = item (k)
            j = j + 1
            }
         }
   result (j) = EOS

   return
   end



# display --- display a file on the terminal in screen-sized chunks

   subroutine display (file)
   integer file

   character line (MAXLINE)
   integer display_line, getlin

   integer form, lines_so_far, last_line_blank
   common /guidecom/ form, lines_so_far, last_line_blank

   while (getlin (line, file, MAXLINE) ~= EOF) {
      if (display_line (line) == ERR)
         break
      }

   return
   end



# display_line --- display a line on the terminal, wait if screen is full

   integer function display_line (line)
   character line (ARB)

   integer form, lines_so_far, last_line_blank
   common /guidecom/ form, lines_so_far, last_line_blank

   integer i, j
   integer getlin

   character response (MAXLINE)

   if (form == PRINTER_FORM) {
      call putlin (line, STDOUT)
      return
      }

   if (line (1) == NEWLINE)
      if (last_line_blank == YES)
         return
      else
         last_line_blank = YES
   else
      last_line_blank = NO

   if (lines_so_far >= SCREENSIZE - 1) {
      lines_so_far = 0
      call print (ERROUT, "more? .")
      if (getlin (response, ERRIN) == EOF
        || response (1) == 'n'c || response (1) == 'N'c
        || response (1) == 'q'c || response (1) == 'Q'c) {
         display_line = ERR
         return
         }
      }
   j = 1
   for (i = 1; line (i) ~= EOS; i = i + 1)
      if (line (i) == BACKSPACE)
         j = j - 1
      else {
         line (j) = line (i)
         j = j + 1
         }
   line (j) = EOS
   i = 1
   while (i < LINE_START && line (i) ~= NEWLINE && line (i) ~= EOS)
      i = i + 1
   call putlin (line (i), STDOUT)      # Subarray
   lines_so_far = lines_so_far + 1
   display_line = OK

   return
   end
