# col --- convert single-column input to multi-column output

   include ARGUMENT_DEFS

   define (COLWIDTH,ARG_VALUE(w))
   define (GUTTER,ARG_VALUE(g))
   define (INDENT,ARG_VALUE(i))
   define (LINK,0)
   define (MAXBUF,32767)
   define (MAXCOLS,8)
   define (NCOLS,ARG_VALUE(c))
   define (NROWS,ARG_VALUE(l))
   define (TEXT,1)
   define (MAXLINE,300)    # to account for some backspacing

   ARG_DECL
   integer i, l, old_i, row, col, ptr (MAXCOLS), buf (MAXBUF)
   integer getlin, width
   string usage _
      "Usage: col {-c<cols>|-g<gutter>|-i<indent>|-l<lines>|-w<width>}"

   procedure fill_buf forward

   PARSE_COMMAND_LINE ("c<ri>g<ri>i<ri>l<ri>tw<ri>"s, usage)
   if (ARG_PRESENT (t)) {  # set parameters for terminal display
      ARG_DEFAULT_INT (c, 5)
      ARG_DEFAULT_INT (g, 2)
      ARG_DEFAULT_INT (i, 0)
      ARG_DEFAULT_INT (l, 22)
      ARG_DEFAULT_INT (w, 14)
      }
   else {                  # set parameters for piping to print
      ARG_DEFAULT_INT (c, 2)
      ARG_DEFAULT_INT (g, 5)
      ARG_DEFAULT_INT (i, 0)
      ARG_DEFAULT_INT (l, 54)
      ARG_DEFAULT_INT (w, 30)
      }
   if (NCOLS > MAXCOLS)
      call error ("too many columns"s)

   for (fill_buf; ptr (1) ~= LAMBDA; fill_buf) {
      repeat {
         call print (STDOUT, "*#x"s, max0 (INDENT, 0))
         for (col = 1; col <= NCOLS && ptr (col) ~= LAMBDA; col += 1) {
            call print (STDOUT, "*s*#x"s, buf (ptr (col) + TEXT),
                  max0 (0, COLWIDTH - width (buf (ptr (col) + TEXT))))
            if (col ~= NCOLS)
               call print (STDOUT, "*#x"s, max0 (0, GUTTER))
            ptr (col) = buf (ptr (col) + LINK)
            }
         call putch (NEWLINE, STDOUT)
         } until (ptr (1) == LAMBDA)
      }

   stop


   # fill_buf --- read a page of text; set up 'buf' and 'ptr' arrays

      procedure fill_buf {

         i = 1
         old_i = 1
         l = 0
         for (col = 1; col <= NCOLS; col += 1) {
            if (l == EOF)
               ptr (col) = LAMBDA
            else {
               ptr (col) = i
               for (row = 1; row <= NROWS; row += 1) {
                  if (i > MAXBUF - (MAXLINE + 1) + 1)
                     call error ("too many lines"s)
                  l = getlin (buf (i + TEXT), STDIN, MAXLINE)
                  if (l == EOF)
                     break
                  if (buf (i + TEXT + l - 1) == NEWLINE) {
                     buf (i + TEXT + l - 1) = EOS
                     l -= 1
                     }
                  old_i = i
                  i += l + 2
                  buf (old_i + LINK) = i
                  }
               if (i == ptr (col))
                  ptr (col) = LAMBDA
               else
                  buf (old_i + LINK) = LAMBDA
               }
            }

         }

   end


# width --- compute width of character string

   integer function width (buf)
   character buf (MAXLINE)

   integer i, c

   width = 0
   for (i = 1; buf (i) ~= EOS; i += 1) {
      c = or (buf (i), 8r200)
      select
         when (c >= ' 'c && c < DEL)
            width += 1
         when (c == BACKSPACE)
            width -= 1
      }

   return
   end
