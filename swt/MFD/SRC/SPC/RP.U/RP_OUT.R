# outtab --- get past column 6 in output

   subroutine outtab (stream)
   integer stream

   include "rp_com.i"

   integer i, op, lim

   if (Outp (stream) < 6) {
      op = Outp (stream)
      while (op < 6) {
         op += 1
         Outbuf (op, stream) = ' 'c
         }
      if (stream == CODE) {
         if (Indent <= MAXINDENT)
            lim = Indent
         else
            lim = MAXINDENT
         for (i = 1; i <= lim; i += 1) {
            op += 2
            Outbuf (op - 1, stream) = ' 'c
            Outbuf (op, stream) = ' 'c
            }
         }
      Outp (stream) = op
      }

   return
   end



# outch --- put one character into output buffer

   subroutine outch (c, stream)
   character c
   integer stream

   include "rp_com.i"

   integer i

   if (Outp (stream) < 72) {
      Outp (stream) += 1
      Outbuf (Outp (stream), stream) = c
      }
   else {
      call outdon (stream)
      do i = 1, 5
         Outbuf (i, stream) = ' 'c
      Outbuf (6, stream) = '*'c
      Outbuf (7, stream) = c
      Outp (stream) = 7
      }

   return
   end



# outstr --- output string (depends on ASCII)

   subroutine outstr (str, stream)
   character str (ARB)
   integer stream

   include "rp_com.i"

   integer i, k
   character c

   for (i = 1; str (i) ~= EOS; i += 1) {
      c = str (i)
      if ('a'c <= c && c <= 'z'c)
         c = c - 'a'c + 'A'c

      if (Outp (stream) < 72) {
         Outp (stream) += 1
         Outbuf (Outp (stream), stream) = c
         }
      else {
         call outdon (stream)
         do k = 1, 5
            Outbuf (k, stream) = ' 'c
         Outbuf (6, stream) = '*'c
         Outbuf (7, stream) = c
         Outp (stream) = 7
         }
      }

   return
   end



# outdon --- finish off a output buffer

   subroutine outdon (stream)
   integer stream

   include "rp_com.i"

   integer op, i
   character blanks (73)

   data blanks /72 * ' 'c, EOS/

   op = Outp (stream)

   if (op ~= 0) {
      if (stream == CODE)
         Code_line_num += 1
      if (ARG_PRESENT (l)) {
         Outbuf (op + 1, stream) = EOS
         call putlin (Outbuf (1, stream), Outfile (stream))
         call putlin (blanks (op + 1), Outfile (stream))
         for (i = 1; i < Level; i += 1)
            call print (Outfile (stream), "*i,"p, Line_number (i))
         call print (Outfile (stream), "*i*n"p, Line_number (i))
DEBUG    call putlin (Outbuf (1, stream), ERROUT)
DEBUG    call putch (NEWLINE, ERROUT)
         }
      else {
         Outbuf (op + 1, stream) = NEWLINE
         Outbuf (op + 2, stream) = EOS
         call putlin (Outbuf (1, stream), Outfile (stream))
DEBUG    call putlin (Outbuf (1, stream), ERROUT)
         }
      Outp (stream) = 0
      }

   return
   end



# outgo --- output "goto n" to code stream

   subroutine outgo (n)
   integer n

   include "rp_com.i"

   integer i, j, m
   integer labgen, ctoi

   procedure enter_go forward

   m = 0
   if (Outp (CODE) > 0) {
      i = 1
      m = ctoi (Outbuf (1, CODE), i)
      }

   if (ARG_PRESENT (g) && m >= START_LAB && Last_dispatch_flag == YES) {
      for (; Outp (CODE) > 0; Outp (CODE) -= 1)
         Outbuf (Outp (CODE), CODE) = ' 'c
      if (n == 0)
         n = labgen (1)
      enter_go
      }

   else if (Dispatch_flag == NO) {                 # generate a GOTO
      call outtab (CODE)
      call outstr ("GOTO "s, CODE)
      if (n == 0)
         n = labgen (1)
      if (ARG_PRESENT (g) && m >= START_LAB)
         enter_go
      call outgolab (n)
      call outdon (CODE)
      }
   Dispatch_flag = YES

   return


   # enter_go --- enter the GOTO in the hash table

      procedure enter_go {

      i = mod (m, MAXGOHASH) + 1
      for (j = 1; j <= MAXGOHASH && Xgo_from (i) ~= 0; j += 1)
         if (i >= MAXGOHASH)
            i = 1
         else
            i += 1

DEBUG call print (ERROUT, "in enter_go: (*i) *i *i*n"s, i, m, n)

      if (Xgo_from (i) ~= 0)
         FATAL ("No more room in GOTO hash table -- leave off '-g' opt")
      Xgo_from (i) = m
      Xgo_to (i) = n

      }


   end



# outnum --- output decimal number in stream

   subroutine outnum (n, stream)
   integer n, stream

   include "rp_com.i"

   character chars (MAXLINE)

   integer len
   integer itoc

   if (0 < Outp (stream) & Outp (stream) <= 5) {   # Is there only a statement number?
      call outtab (stream)
      call outstr ("CONTINUE"s, stream)
      call outdon (stream)
      }

   if (Outp (stream) == 0) {
      if (n == 0)
         return
      Last_dispatch_flag = Dispatch_flag
      Dispatch_flag = NO
      }

   len = itoc (n, chars, MAXLINE)
   chars (len + 1) = EOS
   call outstr (chars, stream)

   return
   end



# outgolab --- output goto label in code stream

   subroutine outgolab (n)
   integer n

   include "rp_com.i"


   if (n >= START_LAB && ARG_PRESENT (g)) {
      if (Outp (CODE) > 72 - 5)  # be sure number fits on one line
         call outstr ("     "s, CODE)
      if (Lgo_lp >= MAXGOLIST)      # must leave room for last entry, too
         FATAL ("No more room in GOTO list -- leave off '-g' opt"p)

      Lgo_line (Lgo_lp) = Code_line_num
      Lgo_pos (Lgo_lp) = Outp (CODE)
      Lgo_stmt (Lgo_lp) = n
      Lgo_lp += 1
      }

   call outnum (n, CODE)

   return
   end



# cleanup_gotos --- copy code buffer, cleaning up gotos

   subroutine cleanup_gotos

   include "rp_com.i"

   integer tp, ln, sn, nsn, i
   character buf (MAXLINE), str (10)
   integer findgo, getlin

   Lgo_line (Lgo_lp) = MAXINT

DEBUG call print (ERROUT, "Contents of GOTO table:*n"s)
DEBUG for (i = 1; i <= MAXGOHASH; i += 1)
DEBUG    if (Xgo_from (i) ~= 0)
DEBUG       call print (ERROUT, "*5i -> *5i*n"s, Xgo_from (i), Xgo_to (i))

   tp = 1
   for (ln = 1; getlin (buf, Outfile (CODE)) ~= EOF; ln += 1) {
      if (Lgo_line (tp) < ln)
         FATAL ("Line numbers out of order in GOTO list"p)
      while (Lgo_line (tp) == ln) {
         sn = Lgo_stmt (tp)
         for (i = 1; i <= 100 && findgo (sn, nsn) == YES; i += 1)
            sn = nsn
         if (i > 100)
            FATAL ("Circular GOTO chain"p)
DEBUG    call print (ERROUT, "in cleanup_goto: (*i,*i) *i -> *i*n"s,
DEBUG       Lgo_line (tp), Lgo_pos (tp), Lgo_stmt (tp), sn)
         call itoc (sn, str, 10)
         do i = 1, 5
            buf (Lgo_pos (tp) + i) = str (i)
         tp += 1
         }
      call putlin (buf, Fortfile)
      }

   Lgo_lp = 1
   do i = 1, MAXGOHASH
      Xgo_from (i) = 0
   Code_line_num = 1

   return
   end


# findgo --- find a GOTO in the hash table and return the 'to' label

   integer function findgo (f, t)
   integer f, t

   include "rp_com.i"

   integer i, j

   i = mod (f, MAXGOHASH) + 1
   for (j = 1; Xgo_from (i) ~= f && j <= MAXGOHASH; j += 1)
      if (i >= MAXGOHASH)
         i = 1
      else
         i += 1

   if (Xgo_from (i) ~= f)
      return (NO)

   t = Xgo_to (i)
   return (YES)

   end



# outlit --- write out an F66 or F77 character literal

   subroutine outlit (literal, length, stream)

   integer length, i
   character literal (ARB)
   file_des stream

   include "rp_com.i"

   if (ARG_PRESENT (h)) {
      call outnum (length, stream)
      call outch ('H'c, stream)
      for (i = 1; i <= length; i += 1)
         call outch (literal (i), stream)
      }
   else {
      call outch ("'"c, stream)
      for (i = 1; i <= length; i += 1) {
         if (literal (i) == "'"c)
            call outch ("'"c, stream)
         call outch (literal (i), stream)
         }
      call outch ("'"c, stream)
      }

   return
   end
