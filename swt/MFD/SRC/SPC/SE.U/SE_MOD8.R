# se_mod8.r --- pattern matching stuff, private to switch styles

define(PAT_AND,'&'c)
define(PAT_CCL,'['c)
define(PAT_CCLEND,']'c)
define(PAT_CHAR,'a'c)
define(PAT_CLOSIZE,4)
define(PAT_CLOSURE,'*'c)
define(PAT_COUNT,1)
define(PAT_DASH,'-'c)
define(PAT_DITTO,-3)
define(PAT_EOL,'$'c)
define(PAT_MARK,-10)    # to different than any digit
define(PAT_NCCL,'n'c)
define(PAT_PREVCL,2)
define(PAT_START,3)

define(PAT_COM,"pattern_com.r.i")

# setpat --- set pattern to UNIX or SWT style

   subroutine setpat (tounix)
   integer tounix

   include PAT_COM

   if (tounix == YES)
   {
      PAT_ANY = '.'c
      PAT_BOL = '^'c
      PAT_NOT = '^'c
      PAT_START_TAG = '('c
      PAT_STOP_TAG = ')'c
      ESCAPE = '\'c
      Unix_style = YES
   }
   else
   {
      PAT_ANY = '?'c
      PAT_BOL = '%'c
      PAT_NOT = '~'c
      PAT_START_TAG = '{'c
      PAT_STOP_TAG = '}'c
      ESCAPE = '@'c
      Unix_style = NO
   }

   return
   end

# match --- find match anywhere on line

   integer function match (lin, pat)
   character lin (ARB), pat (MAXPAT)

   include PAT_COM

   integer amatch
   integer i, junk (9)

   for (i = 1; lin (i) ~= EOS; i += 1)
      if (amatch (lin, i, pat, junk, junk) > 0)
         return (YES)

   return (NO)

   end

# amatch --- (non-recursive) look for match starting at lin (from)

   integer function amatch (lin, from, pat, tagbeg, tagend)
   character lin (ARB), pat (MAXPAT)
   integer from, tagend (9), tagbeg (9)

   integer omatch, patsiz
   integer i, j, offset, stack

   include PAT_COM

   stack = 0
   offset = from      # next unexamined input character
   for (j = 1; pat (j) ~= EOS; j += patsiz (pat, j))
      if (pat (j) == PAT_CLOSURE) {      # a closure entry
         stack = j
         j += PAT_CLOSIZE      # step over PAT_CLOSURE
         for (i = offset; lin (i) ~= EOS; )   # match as many as
            if (omatch (lin, i, pat, j) == NO)   # possible
               break
         pat (stack + PAT_COUNT) = i - offset
         pat (stack + PAT_START) = offset
         offset = i      # character that made us fail
         }
      else if (pat (j) == PAT_START_TAG) {
         i = pat (j + 1)
         tagbeg (i) = offset
         }
      else if (pat (j) == PAT_STOP_TAG) {
         i = pat (j + 1)
         tagend (i) = offset
         }
      else if (omatch (lin, offset, pat, j) == NO) {  # non-closure
         for ( ; stack > 0; stack = pat (stack + PAT_PREVCL))
            if (pat (stack + PAT_COUNT) > 0)
               break
         if (stack <= 0) {      # stack is empty
            amatch = 0      # return failure
            return
            }
         pat (stack + PAT_COUNT) -= 1
         j = stack + PAT_CLOSIZE
         offset = pat (stack + PAT_START) + pat (stack + PAT_COUNT)
         }
      # else omatch succeeded
   amatch = offset

   return      # success
   end

# omatch --- try to match a single pattern at pat (j)

   integer function omatch (lin, i, pat, j)
   character lin (ARB), pat (MAXPAT)
   integer i, j

   include PAT_COM

   integer locate
   integer bump

   omatch = NO
   if (lin (i) == EOS)
      return
   bump = -1
   select (pat (j))
      when (PAT_CHAR) {
         if (lin (i) == pat (j + 1))
            bump = 1
         }
      when (PAT_BOL) {
         if (i == 1)
            bump = 0
         }
      when (PAT_ANY) {
         if (lin (i) ~= NEWLINE)
            bump = 1
         }
      when (PAT_EOL) {
         if (lin (i) == NEWLINE)
            bump = 0
         }
      when (PAT_CCL) {
         if (locate (lin (i), pat, j + 1) == YES)
            bump = 1
         }
      when (PAT_NCCL) {
         if (lin (i) ~= NEWLINE && locate (lin (i), pat, j + 1) == NO)
            bump = 1
         }
   else
      call error ("in omatch: can't happen"s)

   if (bump >= 0) {
      i += bump
      omatch = YES
      }

   return
   end

# locate --- look for c in char class at pat (offset)

   integer function locate (c, pat, offset)
   character c, pat (MAXPAT)
   integer offset

   include PAT_COM

   integer i

   # size of class is at pat (offset), characters follow
   for (i = offset + pat (offset); i > offset; i -= 1)
      if (c == pat (i))
         return (YES)

   return (NO)

   end

# patsiz --- returns size of pattern entry at pat (n)

   integer function patsiz (pat, n)
   character pat (MAXPAT)
   integer n

   include PAT_COM

   if (pat (n) == PAT_CHAR || pat (n) == PAT_START_TAG || pat (n) == PAT_STOP_TAG)
      patsiz = 2
   else if (pat (n) == PAT_BOL || pat (n) == PAT_EOL || pat (n) == PAT_ANY)
      patsiz = 1
   else if (pat (n) == PAT_CCL || pat (n) == PAT_NCCL)
      patsiz = pat (n + 1) + 2
   else if (pat (n) == PAT_CLOSURE)      # optional
      patsiz = PAT_CLOSIZE
   else
      call error ("in patsiz: can't happen"s)

   return
   end

# makpat --- make pattern from arg (from), terminate at delim

   integer function makpat (arg, from, delim, pat)
   character arg (MAXARG), delim, pat (MAXPAT)
   integer from

   include PAT_COM

   character esc
   integer addset, getccl, stclos
   integer i, j, junk, lastcl, lastj, lj,
      tag_nest, tag_num, tag_stack (9)
   logical start_tag, stop_tag   # knows about UNIX or SWT

   j = 1      # pat index
   lastj = 1
   lastcl = 0
   tag_num = 0
   tag_nest = 0
   for (i = from; arg (i) ~= delim && arg (i) ~= EOS; i += 1) {
      lj = j
      if (arg (i) == PAT_ANY)
         junk = addset (PAT_ANY, pat, j, MAXPAT)
      else if (arg (i) == PAT_BOL && i == from)
         junk = addset (PAT_BOL, pat, j, MAXPAT)
      else if (arg (i) == PAT_EOL && arg (i + 1) == delim)
         junk = addset (PAT_EOL, pat, j, MAXPAT)
      else if (arg (i) == PAT_CCL) {
         if (getccl (arg, i, pat, j) == ERR) {
            makpat = ERR
            return
            }
         }
      else if (arg (i) == PAT_CLOSURE && i > from) {
         lj = lastj
         if (pat (lj) == PAT_BOL || pat (lj) == PAT_EOL || pat (lj) == PAT_CLOSURE ||
               pat (lj) == PAT_START_TAG || pat (lj) == PAT_STOP_TAG)
            break
         lastcl = stclos (pat, j, lastj, lastcl)
         }
      else if (start_tag (arg, i)) {
         if (tag_num >= 9)    # too many tagged sub-patterns
            break
         tag_num += 1
         tag_nest += 1
         tag_stack (tag_nest) = tag_num
         junk = addset (PAT_START_TAG, pat, j, MAXPAT)
         junk = addset (tag_num, pat, j, MAXPAT)
         }
      else if (stop_tag (arg, i) && tag_nest > 0) {
         junk = addset (PAT_STOP_TAG, pat, j, MAXPAT)
         junk = addset (tag_stack (tag_nest), pat, j, MAXPAT)
         tag_nest -= 1
         }
      else {
         junk = addset (PAT_CHAR, pat, j, MAXPAT)
         junk = addset (esc (arg, i), pat, j, MAXPAT)
         }
      lastj = lj
      }
   if (arg (i) ~= delim)   # terminated early
      makpat = ERR
   else if (addset (EOS, pat, j, MAXPAT) == NO)   # no room
      makpat = ERR
   else if (tag_nest ~= 0)
      makpat = ERR
   else
      makpat = i

   return
   end

# getccl --- expand char class at arg (i) into pat (j)

   integer function getccl (arg, i, pat, j)
   character arg (MAXARG), pat (MAXPAT)
   integer i, j

   include PAT_COM

   integer addset
   integer jstart, junk

   i += 1      # skip over [
   if (arg (i) == PAT_NOT) {
      junk = addset (PAT_NCCL, pat, j, MAXPAT)
      i += 1
      }
   else
      junk = addset (PAT_CCL, pat, j, MAXPAT)
   jstart = j
   junk = addset (0, pat, j, MAXPAT)      # leave room for count
   call filset (PAT_CCLEND, arg, i, pat, j, MAXPAT)
   pat (jstart) = j - jstart - 1
   if (arg (i) == PAT_CCLEND)
      getccl = OK
   else
      getccl = ERR

   return
   end

# stclos --- insert closure entry at pat (j)

   integer function stclos (pat, j, lastj, lastcl)
   character pat (MAXPAT)
   integer j, lastj, lastcl

   include PAT_COM

   integer addset
   integer jp, jt, junk

   for (jp = j - 1; jp >= lastj; jp -= 1) {   # make a hole
      jt = jp + PAT_CLOSIZE
      junk = addset (pat (jp), pat, jt, MAXPAT)
      }
   j += PAT_CLOSIZE
   stclos = lastj
   junk = addset (PAT_CLOSURE, pat, lastj, MAXPAT)   # put closure in it
   junk = addset (0, pat, lastj, MAXPAT)      # PAT_COUNT
   junk = addset (lastcl, pat, lastj, MAXPAT)   # PAT_PREVCL
   junk = addset (0, pat, lastj, MAXPAT)      # PAT_START

   return
   end

# maksub --- make substitution string in sub

   integer function maksub (arg, from, delim, sub)
   character arg (ARB), delim, sub (MAXPAT)
   integer from

   include PAT_COM

   character esc, type
   integer addset
   integer i, j, junk

   j = 1
   for (i = from; arg (i) ~= delim && arg (i) ~= EOS; i += 1)
      if (arg (i) == PAT_AND) {
         junk = addset (PAT_DITTO, sub, j, MAXPAT)
         junk = addset (0 + PAT_MARK, sub, j, MAXPAT)
         }
      else if (arg (i) == ESCAPE && type (arg (i + 1)) == DIGIT) {
         i += 1
         junk = addset (PAT_DITTO, sub, j, MAXPAT)
         junk = addset (arg (i) - '0'c + PAT_MARK, sub, j, MAXPAT)
         }
      else
         junk = addset (esc (arg, i), sub, j, MAXPAT)
   if (arg (i) ~= delim)   # missing delimiter
      maksub = ERR
   else if (addset (EOS, sub, j, MAXPAT) == NO)   # no room
      maksub = ERR
   else
      maksub = i

   return
   end

# catsub --- add replacement text to end of  new

   subroutine catsub (lin, from, to, sub, new, k, maxnew)
   integer from (10), to (10), k, maxnew
   character lin (MAXLINE), new (maxnew), sub (MAXPAT)

   include PAT_COM

   integer addset
   integer i, j, junk, ri

   for (i = 1; sub (i) ~= EOS; i += 1)
      if (sub (i) == PAT_DITTO) {
         i += 1
         ri = sub (i) + 1 - PAT_MARK
         for (j = from (ri); j < to (ri); j += 1)
            junk = addset (lin (j), new, k, maxnew)
         }
      else
         junk = addset (sub (i), new, k, maxnew)

   return
   end

# filset --- expand set at  array (i)  into  set (j),  stop at  delim

   subroutine filset (delim, array, i, set, j, maxset)
   integer i, j, maxset
   character array (ARB), delim, set (maxset)

   include PAT_COM

   character esc
   integer addset, index
   integer junk
   string digits "0123456789"
   string lowalf "abcdefghijklmnopqrstuvwxyz"
   string upalf "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

   for ( ; array (i) ~= delim && array (i) ~= EOS; i += 1)
      if (array (i) == ESCAPE)
         junk = addset (esc (array, i), set, j, maxset)
      else if (array (i) ~= PAT_DASH)
         junk = addset (array (i), set, j, maxset)
      else if (j <= 1 || array (i + 1) == EOS)   # literal -
         junk = addset (PAT_DASH, set, j, maxset)
      else if (index (digits, set (j - 1)) > 0)
         call dodash (digits, array, i, set, j, maxset)
      else if (index (lowalf, set (j - 1)) > 0)
         call dodash (lowalf, array, i, set, j, maxset)
      else if (index (upalf, set (j - 1)) > 0)
         call dodash (upalf, array, i, set, j, maxset)
      else
         junk = addset (PAT_DASH, set, j, maxset)

   return
   end

# dodash --- expand array (i-1) - array (i+1) into set (j)... from valid

   subroutine dodash (valid, array, i, set, j, maxset)
   integer i, j, maxset
   character array (ARB), set (maxset), valid (ARB)

   include PAT_COM

   character esc
   integer addset, index
   integer junk, k, limit

   i += 1
   j -= 1
   limit = index (valid, esc (array, i))
   for (k = index (valid, set (j)); k <= limit; k += 1)
      junk = addset (valid (k), set, j, maxset)

   return
   end

# addset --- put  c  in  set (j)  if it fits,  increment  j

   integer function addset (c, set, j, maxsiz)
   integer j, maxsiz
   character c, set (maxsiz)

   include PAT_COM

   if (j > maxsiz)
      addset = NO
   else {
      set (j) = c
      j += 1
      addset = YES
      }

   return
   end

# esc --- map  array (i)  into escaped character if appropriate

   character function esc (array, i)
   character array (ARB)
   integer i

   include PAT_COM

   if (array (i) ~= ESCAPE)
      esc = array (i)
   else if (array (i + 1) == EOS)   # @ not special at end
      esc = ESCAPE
   else {
      i += 1
      if (array (i) == 'n'c)
         esc = NEWLINE
      else if (array (i) == 't'c)
         esc = TAB
      else
         esc = array (i)
      }

   return
   end

# start_tag --- check for the beginning of a tagged pattern

   logical function start_tag (arg, i)
   character arg (ARB)
   integer i

   include PAT_COM

   if (Unix_style == YES)
      if (arg (i) == ESCAPE && arg (i + 1) == PAT_START_TAG)
      {
         i += 1
         return (TRUE)
      }
      else
         return (FALSE)
   else
      if (arg (i) == PAT_START_TAG)
         return (TRUE)
      else
         return (FALSE)

   end

# stop_tag --- check for the beginning of a tagged pattern

   logical function stop_tag (arg, i)
   character arg (ARB)
   integer i

   include PAT_COM

   if (Unix_style == YES)
      if (arg (i) == ESCAPE && arg (i + 1) == PAT_STOP_TAG)
      {
         i += 1
         return (TRUE)
      }
      else
         return (FALSE)
   else
      if (arg (i) == PAT_STOP_TAG)
         return (TRUE)
      else
         return (FALSE)

   end
