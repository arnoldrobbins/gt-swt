# tputl$ --- write one line to a cooked tty file

   integer function tputl$ (line, f)
   character line (ARB)
   integer f

   include SWT_COMMON

   integer i, bp, buf (MAXLINE)
   character c

   procedure putchar (ch) forward
   procedure outbuf forward

   bp = 0

   for (i = 1; line (i) ~= EOS; i += 1) {

      c = or (16r80, line (i))               # get the character

      select (c)

         when (SET_OF_UPPER_CASE) {
            if (Term_attr (TA_UPPER_ONLY) == YES)
               putchar (ESCAPE)
            putchar (c)
            }

         when (SET_OF_LOWER_CASE) {
            if (Term_attr (TA_UPPER_ONLY) == YES)
               putchar (c - 'a'c + 'A'c)
            else
               putchar (c)
            }

         when (ESCAPE) {
            if (Term_attr (TA_UPPER_ONLY) == YES)
               putchar (ESCAPE)
            putchar (ESCAPE)
            }

         when ('{'c)
            if (Term_attr (TA_UPPER_ONLY) == YES) {
               putchar (ESCAPE)
               putchar ('('c)
               }
            else
               putchar ('{'c)

         when ('}'c)
            if (Term_attr (TA_UPPER_ONLY) == YES) {
               putchar (ESCAPE)
               putchar (')'c)
               }
            else
               putchar ('}'c)

         when ('|'c)
            if (Term_attr (TA_UPPER_ONLY) == YES) {
               putchar (ESCAPE)
               putchar ('!'c)
               }
            else
               putchar ('|'c)

         when ('`'c)
            if (Term_attr (TA_UPPER_ONLY) == YES) {
               putchar (ESCAPE)
               putchar ("'"c)
               }
            else
               putchar ('`'c)

         when ('~'c)
            if (Term_attr (TA_UPPER_ONLY) == YES) {
               putchar (ESCAPE)
               putchar ('_'c)
               }
            else
               putchar ('~'c)

         when (NEWLINE) {
            putchar (CR)
            putchar (LF)
            }

      else
         putchar (c)

      }

   outbuf

   return (i - 1)


   # outbuf --- put the buffer out to the terminal

      procedure outbuf {

      if (bp > 0)
         call tnoua (buf, bp)
      bp = 0

      }


   # putchar --- put a character in the buffer

      procedure putchar (ch) {

      integer ch

      if (bp >= MAXLINE * 2)
         outbuf

      spchar (buf, bp, ch)

      }

   end
