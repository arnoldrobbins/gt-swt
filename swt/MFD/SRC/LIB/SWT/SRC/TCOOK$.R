#  tcook$ --- read and cook a line from the terminal

   define(AFLAG,16r100)
   define(EFLAG,16r200)

   integer function tcook$ (ubuf, size, tbuf, tptr)
   character ubuf (ARB), tbuf (MAXTERMBUF)
   integer size, tptr

   include SWT_COMMON

   integer duplx$

   character c, t
   integer uptr

   procedure fill_term_buf forward
   procedure get_char forward
   procedure get_escape forward
   procedure put_kill_resp forward
   procedure erase_char forward
   procedure display_line forward
   procedure put_char forward

   for (uptr = 1; uptr < size; {uptr += 1; tptr += 1})
   {
      if (tbuf (tptr) == EOS)
         fill_term_buf

      ubuf (uptr) = tbuf (tptr)

      if (ubuf (uptr) == NEWLINE || ubuf (uptr) == EOS)
      {
         if (ubuf (uptr) == NEWLINE)
         {
            uptr += 1
            tptr += 1
         }

         break
      }
   }
   ubuf (uptr) = EOS

   for (uptr = 1; ubuf (uptr) ~= EOS; uptr += 1)
   {
      if (and (ubuf (uptr), EFLAG) ~= 0)
         ubuf (uptr) -= EFLAG

      if (Termattr (TA_UPPER_ONLY) == YES)
         if (and (ubuf (uptr), AFLAG) ~= 0)
         {
            ubuf (uptr) -= AFLAG
            c = or (ubuf (uptr), 16r80)

            select
               when (c == "("c)
                  ubuf (uptr) = or (and (ubuf (uptr), 16r80), and ("{"c, 16r7f))

               when (c == ")"c)
                  ubuf (uptr) = or (and (ubuf (uptr), 16r80), and ("}"c, 16r7f))

               when (c == "!"c)
                  ubuf (uptr) = or (and (ubuf (uptr), 16r80), and ("|"c, 16r7f))

               when (c == "_"c)
                  ubuf (uptr) = or (and (ubuf (uptr), 16r80), and ("~"c, 16r7f))

               when (c == "'"c)
                  ubuf (uptr) = or (and (ubuf (uptr), 16r80), and ("`"c, 16r7f))
         }
         else
         {
            c = or (ubuf (uptr), 16r80)

            select
               when (c >= "a"c && c <= "z"c)
                  ubuf (uptr) = ubuf (uptr) - "a"c + "A"c

               when (c >= "A"c && c <= "Z"c)
                  ubuf (uptr) = ubuf (uptr) - "A"c + "a"c
         }
   }

   return (uptr - 1)


#  fill_term_buf --- fill the terminal buffer with cooked input

   procedure fill_term_buf
   {
      local i; integer i

      tptr = 1
      tbuf (tptr) = EOS

      for (i = 1; i < MAXTERMBUF; i += 1)
      {
         get_char

         if (and (c, AFLAG) ~= 0)
            t = c - AFLAG
         else
            t = c

         select
            when (t == Escchar)
            {
               get_escape

               tbuf (i) = c
            }

            when (t == Kchar)
            {
               put_kill_resp

               uptr = 1
               i = 0
            }

            when (t == Echar)
            {
               if (t ~= c)
                  call t1ou (Echar)

               if (i > 1)
               {
                  i -= 1
                  t = tbuf (i)
               }
               else
                  if (uptr > 1)
                  {
                     uptr -= 1
                     t = ubuf (uptr)
                  }
                  else
                     t = 0

               erase_char

               i -= 1
            }

            when (t == Rtchar)
            {
               put_kill_resp

               display_line

               i -= 1
            }

            when (t == Eofchar)
            {
               if (i > 1 || uptr > 1)
                  put_kill_resp

               uptr = 1

               i = 1
               tbuf (i) = EOS
               break
            }

            when (t == Nlchar)
            {
               if (t ~= NEWLINE)
                  call tonl

               tbuf (i) = NEWLINE
               tbuf (i + 1) = EOS
               break
            }

         else
            tbuf (i) = c

         tbuf (i + 1) = EOS
      }
   }


#  get_char --- read a character and convert case if necessary

   procedure get_char
   {
      call c1in (c)

      if (Termattr (TA_UPPER_ONLY) == YES && c == "@"c)
      {
         call c1in (c)

         if (c == Escchar)
            get_escape

         c += AFLAG
      }
   }


#  get_escape --- interpret and convert escape sequences

   procedure get_escape
   {
      local duplx; integer duplx

      duplx = duplx$ (-1)
      call duplx$ (or (duplx, -8r40000))

      if (Escchar < " "c || Escchar > "~"c)
         call t1ou (NUL)
      else
         call t1ou (BS)
      call t1ou ("^"c)

      call c1in (c)

      select
         when ('0'c <= c && c <= '7'c)
         {
            t = ls (c - "0"c, 6)

            call c1in (c)

            t += ls (c - "0"c, 3)

            call c1in (c)

            c = t + c - "0"c
         }

         when (c == "/"c)
         {
            call t1ou (c)

            call c1in (c)

            c &= 16r7f
         }

      c += EFLAG

      put_char

      call duplx$ (duplx)
   }


#  put_kill_resp --- display the user's personal kill response

   procedure put_kill_resp
   {
      local i; integer i

      for (i = 1; Kill_resp (i) ~= EOS; i += 1)
         call t1ou (Kill_resp (i))
   }


#  erase_char --- backspace over one character

   procedure erase_char
   {
      if (and (t, AFLAG) ~= 0)
      {
         call t1ou (Echar)

         t -= AFLAG
      }

      if (and (t, EFLAG) ~= 0)
      {
         t -= EFLAG

         if (t < 16r80)
         {
            call t1ou (Echar)

            t += 16r80
         }

         if (t >= NUL && t <= US || t == DEL)
            call t1ou (Echar)

         call t1ou (Echar)
      }
   }


#  display_line --- display current terminal buffer

   procedure display_line
   {
      local p; integer p

      for (p = 1; p < uptr; p += 1)
      {
         c = ubuf (p)

         if (and (c, AFLAG) ~= 0)
         {
            call t1ou ("@"c)

            c -= AFLAG
         }

         if (and (c, EFLAG) ~= 0)
         {
            call t1ou ("^"c)

            if (c - EFLAG < 16r80)
               call t1ou ("/"c)
         }

         put_char
      }

      for (p = 1; tbuf (p) ~= EOS; p += 1)
      {
         c = tbuf (p)

         if (and (c, AFLAG) ~= 0)
         {
            call t1ou ("@"c)

            c -= AFLAG
         }

         if (and (c, EFLAG) ~= 0)
         {
            call t1ou ("^"c)

            if (c - EFLAG < 16r80)
               call t1ou ("/"c)
         }

         put_char
      }
   }


#  put_char --- display a single character

   procedure put_char
   {
      t = c

      if (and (t, EFLAG) ~= 0)
      {
         t -= EFLAG

         if (t < 16r80)
            t += 16r80

         if (t >= NUL && t <= US || t == DEL)
         {
            call t1ou ("="c)

            if (t ~= DEL)
               call t1ou (t - NUL + "@"c)
            else
               call t1ou ("#"c)
         }
         else
            call t1ou (t)
      }
      else
         call t1ou (t)
   }
   end
