# diff --- isolate differences between two files

   define (MAX_UNIQUE_LINES,6000)   # no. of unique lines in all files
   define (MAX_UNIQUE_LINES2,12000) # must be twice MAX_UNIQUE_LINES
   define (NULL_POINTER,0)
   define (HASH_TABLE_SIZE,6073)    # must be prime, as large as possible
   define (MAX_FILE_SIZE,6000)      # no. of lines in largest input file
   define (MAXBUF,1024)             # size of buffer for binary compare

   define (sym_pointer,integer)     # large enough to index MAX_UNIQUE_LINES2
   define (hash_index,integer)      # large enough to index HASH_TABLE_SIZE
   define (file_mark,long_int)      # large enough to hold a file position

   define (DIFFERENCES,1)           # -d => list differences
   define (REVISION,2)              # -r => revision bar requests for 'fmt'
   define (SCRIPT,3)                # -s => update script for 'ed'
   define (COMPARISON,4)            # -c => simple line-by-line compare
   define (BINARY_COMPARISON,5)     # -b => simple word-by-word compare

   define (ON,)
   define (OFF,#)
   define (DEBUG,OFF)               # turn debugging output on/off
   define (TUNING,OFF)              # turn algorithm tuning output on/off

   include "diff_com.r.i"

   call initialize
   if (Option == COMPARISON)
      call simple_compare
   elif (Option == BINARY_COMPARISON)
      call binary_compare
   else {
      call load
      call pair
      call grow
      call label
      call report
      }

   stop
   end



# enter --- enter a line in the symbol table, return its index

   sym_pointer function enter (line)
   character line (ARB)

   include "diff_com.r.i"

   hash_index h
   hash_index hash

   sym_pointer i, p

   file_mark markf

   character text (MAXLINE)

   integer equal

   h = hash (line)
   p = Bucket (h)

   while (p ~= NULL_POINTER) {
      i = Sym_store (p + 1)      # grab index field of entry structure
      call seekf (Text_loc (i), Text_file, ABS)
      call getlin (text, Text_file)
      if (equal (line, text) == YES)
         return (i)              # we got it; return its useful index
      p = Sym_store (p)          # try next item in the chain
DEBUG call print (ERROUT, "probing in lookup: ptr = *i, line = '*s'*n"s,
DEBUG    p, line)
      }

   if (Next_inx >= MAX_UNIQUE_LINES)
      call error ("too many unique lines; symbol table overflow"p)
   i = Next_inx
   Next_inx += 1
   h = hash (line)
   Sym_store (Next_sym) = Bucket (h)   # link in new entry
   Sym_store (Next_sym + 1) = i
   Bucket (h) = Next_sym
   Next_sym += 2
   call wind (Text_file)
   Text_loc (i) = markf (Text_file)
   call putlin (line, Text_file)

   return (i)
   end



# gen_listing --- generate a full listing of changes to a file

   subroutine gen_listing

   include "diff_com.r.i"

   sym_pointer oi, ni

   integer junk
   integer getlin

   character line (MAXLINE)

   procedure collect_unchanged forward
   procedure collect_deletions (ch) forward
   procedure collect_insertions (ch) forward

   oi = 2
   ni = 2

   repeat
      select

         when (Old_count (oi) == 0 && New_count (ni) == 0)
            collect_unchanged

         when (Old_count (oi) ~= 1 && New_count (ni) == 1)
            collect_insertions (' 'c)

         when (Old_count (oi) == 1 && New_count (ni) ~= 1)
            collect_deletions (' 'c)

         when (Old_count (oi) == 1 && New_count (ni) == 1) {
            collect_deletions ('c'c)
            collect_insertions ('c'c)
            }

         when (Old_count (oi) == 2 && New_count (ni) == 2)
            break

   return


   procedure collect_unchanged {
      if (Verbose == YES)
         call putch (NEWLINE, STDOUT)
      for (; Old_count (oi) == 0 && New_count (ni) == 0;
       {oi += 1; ni += 1}) {
         junk = getlin (line, Old_copy)
         if (Verbose == YES) {
            call print (STDOUT, "   *4i *4i|"s, oi - 1, ni - 1)
            call putlin (line, STDOUT)
            }
         junk = getlin (line, New_copy)
         }
      }


   procedure collect_deletions (ch) {

      character ch

      call putch (NEWLINE, STDOUT)
      for (; Old_count (oi) == 1; oi += 1) {
         junk = getlin (line, Old_copy)
         if (Verbose == YES)
            call print (STDOUT, "*cd *4i *4x|"s, ch, oi - 1)
         else
            call print (STDOUT, "*cd *4io|"s, ch, oi - 1)
         call putlin (line, STDOUT)
         }
      }


   procedure collect_insertions (ch) {

      character ch

      call putch (NEWLINE, STDOUT)
      for (; New_count (ni) == 1; ni += 1) {
         junk = getlin (line, New_copy)
         if (Verbose == YES)
            call print (STDOUT, "*ci *4x *4i|"s, ch, ni - 1)
         else
            call print (STDOUT, "*ci *4in|"s, ch, ni - 1)
         call putlin (line, STDOUT)
         }
      }


   end



# gen_revision --- generate 'fmt' input text with revision bar requests

   subroutine gen_revision

   include "diff_com.r.i"

   sym_pointer oi, ni

   integer junk
   integer getlin

   character line (MAXLINE)

   procedure collect_deletions forward
   procedure collect_insertions forward

   oi = 2
   ni = 2

   repeat
      select

         when (Old_count (oi) == 0 && New_count (ni) == 0) {
            oi += 1
            ni += 1
            junk = getlin (line, New_copy)
            call putlin (line, STDOUT)
            }

         when (Old_count (oi) ~= 1 && New_count (ni) == 1) {
            call print (STDOUT, "[cc]mc |*n"s)
            collect_insertions
            call print (STDOUT, "[cc]mc*n"s)
            }

         when (Old_count (oi) == 1 && New_count (ni) ~= 1) {
            call print (STDOUT, "[cc]mc ***n"s)
            call print (STDOUT, "[cc]mc*n"s)
            collect_deletions
            }

         when (Old_count (oi) == 1 && New_count (ni) == 1) {
            collect_deletions
            call print (STDOUT, "[cc]mc |*n"s)
            collect_insertions
            call print (STDOUT, "[cc]mc*n"s)
            }

         when (Old_count (oi) == 2 && New_count (ni) == 2)
            break

   return


   procedure collect_deletions {
      for (; Old_count (oi) == 1; oi += 1)
         ;
      }


   procedure collect_insertions {
      for (; New_count (ni) == 1; ni += 1) {
         junk = getlin (line, New_copy)
         call putlin (line, STDOUT)
         }
      }


   end



# gen_script --- produce editor script to convert old file into new

   subroutine gen_script

   include "diff_com.r.i"

   sym_pointer oi, ni, offset, length

   integer junk
   integer getlin

   character line (MAXLINE)

   procedure collect_deletions forward
   procedure collect_insertions forward

   oi = 2
   ni = 2
   offset = 0

   repeat
      select

         when (Old_count (oi) == 0 && New_count (ni) == 0) {
            oi += 1
            ni += 1
            junk = getlin (line, New_copy)
            }

         when (Old_count (oi) ~= 1 && New_count (ni) == 1) {
            call print (STDOUT, "*ia*n"s, oi - 2 + offset)
            collect_insertions
            call print (STDOUT, ".*n"s)
            offset += length
            }

         when (Old_count (oi) == 1 && New_count (ni) ~= 1) {
            collect_deletions
            call print (STDOUT, "*i,*id*n"s, oi - 1 - length + offset,
               oi - 2 + offset)
            offset -= length
            }

         when (Old_count (oi) == 1 && New_count (ni) == 1) {
            collect_deletions
            call print (STDOUT, "*i,*ic*n"s, oi - 1 - length + offset,
               oi - 2 + offset)
            offset -= length
            collect_insertions
            call print (STDOUT, ".*n"s)
            offset += length
            }

         when (Old_count (oi) == 2 && New_count (ni) == 2)
            break

   call print (STDOUT, "w*n"s)
   return


   procedure collect_deletions {
      length = 0
      for (; Old_count (oi) == 1; oi += 1)
         length += 1
      }


   procedure collect_insertions {
      length = 0
      for (; New_count (ni) == 1; ni += 1) {
         length += 1
         junk = getlin (line, New_copy)
         call putlin (line, STDOUT)
         }
      }


   end



# grow --- grow unchanged blocks around unique line pairs

   subroutine grow

   include "diff_com.r.i"

   sym_pointer i, nx

   for (i = 1; i < New_size; i += 1) {
      nx = New_xref (i)
      if (nx > 0)       # is this line paired with an old line?
         if (New_xref (i + 1) < 0
          && New_xref (i + 1) == Old_xref (nx + 1)) {
            Old_xref (nx + 1) = i + 1
            New_xref (i + 1) = nx + 1
            }
      }

   for (i = New_size; i > 1; i -= 1) {
      nx = New_xref (i)
      if (nx > 0)       # is this line paired?
         if (New_xref (i - 1) < 0
          && New_xref (i - 1) == Old_xref (nx - 1)) {
            Old_xref (nx - 1) = i - 1
            New_xref (i - 1) = nx - 1
            }
      }

   return
   end



# hash --- hash a line into a hash_index

   hash_index function hash (line)
   character line (ARB)

   integer i

   hash = 0
   for (i = 1; line (i) ~= EOS; i += 1)
      hash += line (i)
   hash = mod (iabs (hash), HASH_TABLE_SIZE) + 1

   return
   end



# initialize --- set up everything needed for a file comparison

   subroutine initialize

   include "diff_com.r.i"

   file_des mktemp, open

   integer argno, i
   integer getarg

   character arg (MAXPATH)

   Option = DIFFERENCES    # the defaults
   Verbose = NO

   argno = 1      # where we expect to find file names
   if (getarg (1, arg, MAXPATH) ~= EOF && arg (1) == '-'c) {
      call mapstr (arg, LOWER)
      for (i = 2; arg (i) ~= EOS; i += 1)
         select (arg (i))
            when ('b'c)    Option = BINARY_COMPARISON
            when ('c'c)    Option = COMPARISON
            when ('d'c)    Option = DIFFERENCES
            when ('r'c)    Option = REVISION
            when ('s'c)    Option = SCRIPT
            when ('v'c)    Verbose = YES
         else
            call usage
      argno = 2
      }

   if (getarg (argno, arg, MAXPATH) == EOF) {   # no files, use STDIN
      Old_file = STDIN1
      New_file = STDIN2
      }
   else {
      Old_file = open (arg, READ)
      if (Old_file == ERR)
         call cant (arg)
      argno += 1
      if (getarg (argno, arg, MAXPATH) == EOF)
         New_file = STDIN1
      else {
         New_file = open (arg, READ)
         if (New_file == ERR)
            call cant (arg)
         argno += 1
         }
      }

   if (getarg (argno, arg, MAXPATH) ~= EOF)
      call usage

   Next_inx = 1
   Next_sym = 1

   Text_file = mktemp (READWRITE)
   if (Text_file == ERR)
      call error ("can't open temporary file"p)

   Old_copy = mktemp (READWRITE)
   if (Old_copy == ERR)
      call error ("can't open temporary file"p)

   New_copy = mktemp (READWRITE)
   if (New_copy == ERR)
      call error ("can't open temporary file"p)

   return
   end



# label --- label lines as "inserted," "deleted," or "unchanged"

   subroutine label

   include "diff_com.r.i"

   sym_pointer oi, ni, ox, nx

DEBUG call print (STDOUT, "input new xref:  "s)
DEBUG do ni = 1, New_size
DEBUG    call print (STDOUT, "  *i"s, New_xref (ni))
DEBUG call print (STDOUT, "*ninput old xref:  "s)
DEBUG do oi = 1, Old_size
DEBUG    call print (STDOUT, "  *i"s, Old_xref (oi))
DEBUG call putch (NEWLINE, STDOUT)

   oi = 2
   ni = 2

   repeat {

      ox = Old_xref (oi)
      nx = New_xref (ni)

      select
         when (oi >= Old_size && ni >= New_size)
            break

         when (oi < Old_size && ox < 0) { # deletion from old file
            Old_count (oi) = 1
            oi += 1
            }

         when (ni < New_size && nx < 0) { # insertion in new file
            New_count (ni) = 1
            ni += 1
            }

         when (ox == ni && nx == oi) {    # unchanged line
            Old_count (oi) = 0
            oi += 1
            New_count (ni) = 0
            ni += 1
            }

         when (oi <= Old_size && ni <= New_size) {  # out-of-order block
            New_count (ni) = 1
            ni += 1
            Old_count (nx) = 1
            Old_count (oi) = 1
            oi += 1
            New_count (ox) = 1
            }

         else {
            call print (ERROUT, "Old_xref (*i) = *i, New_xref (*i) = *i*n"s,
               oi, ox, ni, nx)
            call error ("in label:  can't happen"s)
            }

      }

   Old_count (1) = 2             # mark the null lines specially,
   Old_count (Old_size) = 2      #    so people won't have to deal
   New_count (1) = 2             #    with file sizes
   New_count (New_size) = 2

   return
   end



# load --- load symbol table, set up cross-reference structures

   subroutine load

   include "diff_com.r.i"

   sym_pointer lno, i
   sym_pointer enter

   hash_index h

   character line (MAXLINE)

   integer getlin

TUNING sym_pointer p
TUNING integer used, chain_len, max_chain_len, min_chain_len

   do h = 1, HASH_TABLE_SIZE
      Bucket (h) = NULL_POINTER

   do lno = 1, MAX_UNIQUE_LINES; {
      Old_count (lno) = 0
      New_count (lno) = 0
      }

  # Load the "old" file:
   for (lno = 2; getlin (line, Old_file) ~= EOF; lno += 1) {
      if (lno > MAX_FILE_SIZE)
         call error ("old file too large to handle"p)
      call putlin (line, Old_copy)
      i = enter (line)
      Old_count (i) += 1
      Old_lno (i) = lno
      Old_xref (lno) = -i
      }
   Old_size = lno    # includes null line at end

  # Load the "new" file:
   for (lno = 2; getlin (line, New_file) ~= EOF; lno += 1) {
      if (lno > MAX_FILE_SIZE)
         call error ("new file too large to handle"p)
      call putlin (line, New_copy)
      i = enter (line)
      New_count (i) += 1
      New_xref (lno) = -i
      }
   New_size = lno    # also allows for null line at end

TUNING call print (STDOUT2, "Old_size = *i, New_size = *i*n"s,
TUNING    Old_size, New_size)
TUNING call print (STDOUT2, "*i unique lines*n"s, Next_inx - 1)
TUNING used = 0
TUNING max_chain_len = 0
TUNING min_chain_len = MAX_UNIQUE_LINES
TUNING do h = 1, HASH_TABLE_SIZE; {
TUNING    p = Bucket (h)
TUNING    if (p ~= NULL_POINTER)
TUNING       used += 1
TUNING    chain_len = 0
TUNING    while (p ~= NULL_POINTER) {
TUNING       chain_len += 1
TUNING       p = Sym_store (p)
TUNING       }
TUNING    max_chain_len = max0 (chain_len, max_chain_len)
TUNING    min_chain_len = min0 (chain_len, min_chain_len)
TUNING    }
TUNING call print (STDOUT2, "chain lengths:  min = *i, avg = *i, max = *i*n"s,
TUNING    min_chain_len, (Next_inx - 1) / used, max_chain_len)
TUNING call print (STDOUT2, "hash buckets *i% full*n"s,
TUNING    (100*used)/HASH_TABLE_SIZE)

   return
   end



# pair --- pair up unique lines in both files

   subroutine pair

   include "diff_com.r.i"

   sym_pointer i, j

   for (i = 2; i < New_size; i += 1) {
      j = -New_xref (i)
      if (Old_count (j) == 1 && New_count (j) == 1) { # unique pair
         New_xref (i) = Old_lno (j)
         Old_xref (Old_lno (j)) = i
         }
      }

   New_xref (1) = 1                 # match null lines at BOF
   Old_xref (1) = 1
   New_xref (New_size) = Old_size   # ... and at EOF
   Old_xref (Old_size) = New_size

   return
   end



# report --- report differences between files in desired format

   subroutine report

   include "diff_com.r.i"

DEBUG sym_pointer i

DEBUG call print (ERROUT, "New mark: "s)
DEBUG do i = 1, New_size
DEBUG    call print (ERROUT, "  *i"s, New_count (i))
DEBUG call print (ERROUT, "*nOld mark: "s)
DEBUG do i = 1, Old_size
DEBUG    call print (ERROUT, "  *i"s, Old_count (i))
DEBUG call putch (NEWLINE, ERROUT)

   call rewind (Old_copy)
   call rewind (New_copy)

   select (Option)
      when (DIFFERENCES)            call gen_listing
      when (REVISION)               call gen_revision
      when (SCRIPT)                 call gen_script
   else
      call error ("in report:  can't happen"p)

   return
   end



# simple_compare --- do a line-by-line comparison of the input files

   subroutine simple_compare

   include "diff_com.r.i"

   character line1 (MAXLINE), line2 (MAXLINE)

   integer lineno, m1, m2
   integer equal, getlin

   lineno = 0
   repeat {
      m1 = getlin (line1, Old_file)
      m2 = getlin (line2, New_file)
      if (m1 == EOF || m2 == EOF)
         break
      lineno += 1
      if (equal (line1, line2) == NO)
         if (Verbose == YES)
            call print (STDOUT, "*5i*n*8x*s*8x*s"s, lineno, line1, line2)
         else {
            call print (STDOUT, "different*n"s)
            return
            }
      }

   if (m1 == m2)
      return
   if (Verbose == NO)
      call print (STDOUT, "different*n"s)
   elif (m1 == EOF)
      call print (STDOUT, "eof on old file*n"s)
   elif (m2 == EOF)
      call print (STDOUT, "eof on new file*n"s)

   return
   end



# binary_compare --- compare files in binary

   subroutine binary_compare

   include "diff_com.r.i"

   integer m1, m2, i, len, buf1 (MAXBUF), buf2 (MAXBUF)
   integer readf

   longint block

   block = -1     # minus 1 to compensate for 1-based indexing

   repeat {
      m1 = readf (buf1, MAXBUF, Old_file)
      m2 = readf (buf2, MAXBUF, New_file)
      if (m1 ~= m2 || m1 == EOF)
         break
      do i = 1, m1
         if (buf1 (i) ~= buf2 (i)) {
            if (Verbose == YES)
               call print (STDOUT, "*10l: *6,-8,0i *6,-8,0i*n"s,
                     block + i, buf1 (i), buf2 (i))
            else {
               call print (STDOUT, "different*n"s)
               return
               }
            }
      block += m1
      }

   if (m1 == m2)           # files are equal
      return
   if (Verbose == NO) {    # unequal but we don't care how
      call print (STDOUT, "different*n"s)
      return
      }
   if (m1 ~= EOF && m2 ~= EOF) {    # some words left to compare
      if (m1 < m2) {    # old file is shorter than new one
         len = m1
         m1 = EOF
         }
      else {            # new file is shorter than old one
         len = m2
         m2 = EOF
         }
      do i = 1, len     # compare remaining words
         if (buf1 (i) ~= buf2 (i))
            call print (STDOUT, "*10l: *6,-8,0i *6,-8,0i*n"s,
                  block + i, buf1 (i), buf2 (i))
      }
   if (m1 == EOF)
      call print (STDOUT, "eof on old file*n"s)
   elif (m2 == EOF)
      call print (STDOUT, "eof on new file*n"s)

   return
   end



# usage --- print usage message, then die

   subroutine usage

   call error ("Usage:  diff [-{b|c|d|r|s|v}] [old_file [new_file]]"p)

   end
