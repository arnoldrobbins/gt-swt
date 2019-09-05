# build_cross_ref --- build the cross reference of a single file

   subroutine build_cross_ref (ifd, tfd)
   filedes ifd, tfd

   include XREF_COMMON

   integer l
   integer lookup, equal, scopy
   filedes open
   character filename (MAXPATH)
   untyped info (SYMINFOSIZE)

   Level = 1
   Infile (Level) = ifd
   Line_number (Level) = 0

   call getsym
   repeat {
      if (Symbol == IDSYM) {
         if (lookup (Sym_name, info, Id_table) == YES) {
            call output_keyword
            if (ARG_PRESENT (i) && equal (Sym_text, "include"s) ~= NO) {
               call getsym
               call outstr (Sym_text)
               if (Symbol == STRCONSTANTSYM) {
                  l = scopy (Sym_text, 2, filename, 1)
                  filename (l) = EOS
                  }
               else
                  call scopy (Sym_text, 1, filename, 1)
               repeat {    # dump rest of line before changing level
                  call getsym
                  call outstr (Sym_text)
                  } until (Symbol == NEWLINE)
               if (Level >= MAXLEVEL)
                  SYNERR ("includes nested too deeply"p)
               else {
                  Level += 1
                  Line_number (Level) = 0
                  Infile (Level) = open (filename, READ)
                  if (Infile (Level) == ERR) {
                     Level -= 1
                     SYNERR ("can't open include file"p)
                     call print (ERROUT, "File name: *s*n"p, filename)
                     }
                  }
               }
            }
         else {
            call print (tfd, "*s,*6i*n"p, Sym_name, Out_line)
            call outstr (Sym_text)
            }
         }
      else if (ARG_PRESENT (l) && Symbol == NUMBERSYM) {
         call print (tfd, "*s,*6i*n"p, Sym_text, Out_line)
         call outstr (Sym_text)
         }
#     else if (ARG_PRESENT (l) && Symbol == STRCONSTANTSYM) {
#        call outstr (Sym_text)
#        call print (tfd, "*s,*6i*n"p, Sym_text, Out_line)
#        }
      else
         call outstr (Sym_text)
      call getsym
      } until (Symbol == EOF)

   return
   end


# output_keyword --- output a keyword with underlining or boldfacing

   subroutine output_keyword

   include XREF_COMMON

   character symbuf (MAXLINE)

   if (ARG_PRESENT (b)) {
      call boldface (Sym_text, symbuf)
      call outstr (symbuf)
      }
   else if (ARG_PRESENT (u)) {
      call underline (Sym_text, symbuf)
      call outstr (symbuf)
      }
   else
      call outstr (Sym_text)

   return
   end



# boldface --- boldface a word by overstriking

   subroutine boldface (in, out)
   character in (ARB), out (MAXLINE)

   integer i, j

   j = 1
   for (i = 1; in (i) ~= EOS; i += 1) {
      out (j) = in (i)
      out (j + 1) = BS
      out (j + 2) = in (i)
      j += 3
      }

   out (j) = EOS

   return
   end



# underline --- underline a word

   subroutine underline (in, out)
   character in (ARB), out (MAXLINE)

   integer i, j

   j = 1
   for (i = 1; in (i) ~= EOS; i += 1) {
      out (j) = '_'c
      out (j + 1) = BS
      out (j + 2) = in (i)
      j += 3
      }

   out (j) = EOS

   return
   end



# outch --- output a single character to the file

   subroutine outch (c)
   character c

   include XREF_COMMON

   if (c == NEWLINE)
      call dump_buffer
   else if (Outp < Outwidth) {          # truncate past Outwidth
      Outbuf (Outp) = c
      Outp += 1
      }

   return
   end



# outstr --- output a string to the file

   subroutine outstr (str)
   character str (ARB)

   include XREF_COMMON

   integer i

   for (i = 1; str (i) ~= EOS; i += 1)
      if (str (i) == NEWLINE)
         call dump_buffer
      else if (Outp < Outwidth) {
         Outbuf (Outp) = str (i)
         Outp += 1
         }

   return
   end



# dump_buffer --- print the output buffer and bump the line number

   subroutine dump_buffer

   include XREF_COMMON

   if (Level > 1)
      call print (STDOUT, "*i "p, Level - 1)
   else
      call putlin ("  "s, STDOUT)

   Outbuf (Outp) = EOS
   call print (STDOUT, "*4i: *s*n"p, Out_line, Outbuf)

   Outp = 1
   Out_line += 1

   return
   end



# print_cross_ref --- print the concordance

   subroutine print_cross_ref (tfd)
   integer tfd

   include XREF_COMMON

   integer i, ptr, num, s, j, l
   integer input, equal
   character name (MAXLINE), oldname (MAXLINE)

   oldname (1) = EOS

   s = input (tfd, "*,,,s*i"s, name, num)
   while (s ~= EOF) {

      call putlin (name, STDOUT)
      l = length (name)
      j = max0 (TABFIRST, ((length (name) - 1) / 6 + 1) * 6)
      for (i = l + 1; i <= j; i += 1)
         call putch (' 'c, STDOUT)
      ptr = TABFIRST + 1
      call scopy (name, 1, oldname, 1)

      while (equal (name, oldname) == YES && s ~= EOF) {
         if (ptr > Out_width) {
            call putch (NEWLINE, STDOUT)
            do i = 1, TABFIRST
               call putch (' 'c, STDOUT)
            ptr = TABFIRST + 1
            }
         call print (STDOUT, "*6i"p, num)
         ptr += 6

         s = input (tfd, "*,,,s*i"s, name, num)
         }

      call putch (NEWLINE, STDOUT)
      }

   return
   end
