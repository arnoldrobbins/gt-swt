# kwic --- make keyword in context index

   define(FOLD,:140)
   define(MAX_KWDS,200)
   define(MAX_KWD_LEN,2048)

   character buf (MAXLINE)
   integer getlin

   call read_discards
   while (getlin (buf, STDIN) ~= EOF)
      call putrot (buf, STDOUT)

   stop
   end

# putrot --- create lines with keyword at front
   subroutine putrot (buf, outfil)
   character buf (ARB)
   integer outfil

   integer i, outfil
   integer discard

   for (i = 1; buf (i) ~= NEWLINE && buf (i) ~= EOS; ) {
      if (buf (i) ~= ' 'c && buf (i) ~= TAB) {  # start of a token
         if (discard (buf (i)) == NO)     # not a throw-away
            call rotate (buf, i, outfil)
         repeat
            i += 1
            until (buf (i) == ' 'c || buf (i) == TAB ||
                        buf (i) == NEWLINE || buf (i) == EOS)
         }
      while (buf (i) == ' 'c || buf (i) == TAB)
         i += 1
      }

   return
   end

# rotate --- output rotated line
   subroutine rotate (buf, n, outfil)
   character buf (ARB)
   integer i, n, outfil

   for (i = n; buf (i) ~= NEWLINE && buf (i) ~= EOS; i += 1)
      call putch (buf (i), outfil)
   call putch (FOLD, outfil)
   for (i = 1; i < n; i += 1)
      call putch (buf (i), outfil)
   call putch (NEWLINE, outfil)

   return
   end

# discard --- see if first word in buf is in throw-away list
   integer function discard (buf)
   character buf (ARB)

   character word (MAXLINE)
   integer i
   integer search

   for (i = 1; buf (i) ~= ' 'c && buf (i) ~= TAB && buf (i) ~= EOS &&
                  buf (i) ~= NEWLINE && i < MAXLINE; i = i + 1)
      word (i) = buf (i)

   word (i) = EOS
   call mapstr (word, LOWER)

   if (search (word) == EOF)
      discard = NO   # word not in list, don't throw it away
   else
      discard = YES

   return
   end

# search --- search keyword list for word
   integer function search (word)
   character word (ARB)

   integer i, j, k
   integer compare

   common /kwdcom/ kwd_pos, kwd_text, num_kwds
   integer kwd_pos (MAX_KWDS)       # keyword positions
   character kwd_text (MAX_KWD_LEN) # text of keywords
   integer num_kwds                 # number of keywords

   i = 1
   j = num_kwds
   if (i <= j)
      repeat { # perform binary search of the throw-away list
         k = (i + j) / 2
         select (compare (kwd_text (kwd_pos (k)), word))
            when (1)    # less
               i = k + 1
            when (2) {  # equal
               search = kwd_pos (k)
               return
               }
            when (3)    # greater
               j = k - 1
         } until (i > j)

   search = EOF
   return

   end

# compare --- compare two strings and return 1 2 or 3 for < = or >
   integer function compare (str1, str2)
   character str1 (ARB), str2 (ARB)

   integer i

   for (i = 1; str1 (i) == str2 (i); i = i + 1)
      if (str1 (i) == EOS | str2 (i) == EOS)
         break

   if (str1 (i) == str2 (i))                       # equal strings
      compare = 2

   else if (str1 (i) == EOS
     || str1 (i) < str2 (i) & str2 (i) ~= EOS)    # str1 < str2
      compare = 1

   else if (str2 (i) == EOS
     || str2 (i) < str1 (i) & str1 (i) ~= EOS)    # str1 > str2
      compare = 3

   else
      call error ("in compare: can't happen.")

   return
   end

# read_discards --- load throw-away list from file
   subroutine read_discards

   integer i, l, fd
   integer get_list, getlin

   character line (MAXLINE)

   common /kwdcom/ kwd_pos, kwd_text, num_kwds
   integer kwd_pos (MAX_KWDS)       # keyword positions
   character kwd_text (MAX_KWD_LEN) # text of keywords
   integer num_kwds                 # number of keywords

   num_kwds = 0   # initially zero
   if (get_list (fd) == ERR)
      return

   i = 1
   l = getlin (line, fd)
   while (l ~= EOF) {
      if (line (l) == NEWLINE) {
         line (l) = EOS
         l = l - 1
         }
      if (MAX_KWD_LEN - i > l && num_kwds < MAX_KWDS) { # check for room
         num_kwds = num_kwds + 1
         kwd_pos (num_kwds) = i
         call scopy (line, 1, kwd_text, i)
         i = i + l + 1
         }
      else {
         call print (ERROUT, "*s: discard list too long*n.", line)
         break
         }
      l = getlin (line, fd)
      }

   if (fd ~= STDIN2)
      call close (fd)

   return
   end

# get_list --- get throw-away list file descriptor
   integer function get_list (fd)
   integer fd

   character arg (MAXARG)
   integer getarg, open

   if (getarg (1, arg, MAXARG) ~= EOF)
      if (arg (1) == '-'c && (arg (2) == 'd'c | arg (2) == 'D'c)) {
         if (getarg (2, arg, MAXARG) ~= EOF) {
            fd = open (arg, READ)
            if (fd == ERR)
               call cant (arg)
            }
         else
            fd = STDIN2
         }
      else
         call error ("Usage: kwic [ -d [ <discard_list> ] ].")
   else
      fd = ERR

   get_list = fd

   return
   end
