# xcc --- compile a (single) C program with Prime's C compiler

   include ARGUMENT_DEFS

   ARG_DECL

   character prime_file (MAXPATH)
   character filename (MAXPATH)
   character binary (MAXPATH)
   character listing (MAXPATH)
   integer getarg, length, index, filtst
   integer i, j

   PARSE_COMMAND_LINE ("b<opt str> l<opt str> c<flag>"s,
      "usage: xcc <file_spec> [-c] [-b [<path>]] [-l [<path>]]"p)

   if (getarg (2, filename, MAXPATH) ~= EOF || getarg (1, filename, MAXPATH) == EOF)
      call error ("usage: xcc <file_spec> [-c] [-b [<path>]] [-l [<path>]]"p)
      # more than one C file named
      #     or
      # no C files named


   i = length (filename)
   j = index (filename, '.'c)


   if (j == i - 1 && filename (i) ~= 'c'c)
      call error ("xcc: source program must be in a .c file"p)
   else if (j ~= 0)
      filename (i - 1) = EOS  # remove suffix

   call encode (binary, MAXPATH, "*s.b"s, filename)
   call encode (listing, MAXPATH, "*s.l"s, filename)

   if (j == 0)  # no suffix, so make room
        i += 2

   filename (i - 1) = '.'c
   filename (i) = 'c'c
   filename (i + 1) = EOS

   ARG_DEFAULT_STR (b, binary)
   ARG_DEFAULT_STR (l, listing)

   if (ARG_PRESENT (b))
      call ctoc (ARG_TEXT (b), binary, MAXPATH)

   if (ARG_PRESENT (l))
      call ctoc (ARG_TEXT (l), listing, MAXPATH)

   # test for file existence
   if (filtst(filename, NO, NO, YES, NO, YES, NO, NO) == NO)
   {
      call print (ERROUT, "*s: can't open"s, filename)
      call error (""p)
   }

   # now make the command line

   if (~ ARG_PRESENT (c))
      call print (STDOUT, "CC -NOCONVERT "s)
   elif (~ ARG_PRESENT (b) && ~ ARG_PRESENT (l))
      call print (STDOUT, "CC -NOCONVERT -CHECKOUT "s)
   else
      call error ("xcc: -c disallows -b and -l"p)

   call tree_name (filename, prime_file)
   call print (STDOUT,"-INPUT *s "s, prime_file)

   call tree_name (binary, prime_file)
   call print (STDOUT,"-BINARY *s "s, prime_file)

   if (ARG_PRESENT (l))
   {
      call tree_name (listing, prime_file)
      call print (STDOUT,"-LISTING *s "s, prime_file)
   }

   call print (STDOUT, "*n"s)

   stop
   end

# tree_name --- turn swt name into primos name

   subroutine tree_name (path, prime_path)
   character path (ARB), prime_path (ARB)

   character temp1 (MAXLINE), temp2 (MAXLINE)

   call expand (path, temp1, MAXLINE)
   call mktr$ (temp1, temp2)

   call ctoc (temp2, prime_path, MAXLINE)

   return
   end
