# memo --- automated memo and reminder system

define (MAXSP, 32)      # never underestimate the power of a two
define (MEMSIZE, 1000)

include "memo.stacc.defs"

   call initialize
   call memo

   stop
   end



# initialize --- set up symbol tables, temp files, conditions, etc.

   subroutine initialize

   include "memo_com.r.i"

   integer val, month, day, year
   integer ctoi, get_dow

   pointer mktabl

   character dattim (9)

   call dsinit (MEMSIZE)
   Symtab = mktabl (1)

   call enter ("sunday"s,     1, Symtab)
   call enter ("sun"s,        1, Symtab)
   call enter ("monday"s,     2, Symtab)
   call enter ("mon"s,        2, Symtab)
   call enter ("tuesday"s,    3, Symtab)
   call enter ("tue"s,        3, Symtab)
   call enter ("wednesday"s,  4, Symtab)
   call enter ("wed"s,        4, Symtab)
   call enter ("thursday"s,   5, Symtab)
   call enter ("thu"s,        5, Symtab)
   call enter ("friday"s,     6, Symtab)
   call enter ("fri"s,        6, Symtab)
   call enter ("saturday"s,   7, Symtab)
   call enter ("sat"s,        7, Symtab)

   call enter ("january"s,    1, Symtab)
   call enter ("jan"s,        1, Symtab)
   call enter ("february"s,   2, Symtab)
   call enter ("feb"s,        2, Symtab)
   call enter ("march"s,      3, Symtab)
   call enter ("mar"s,        3, Symtab)
   call enter ("april"s,      4, Symtab)
   call enter ("apr"s,        4, Symtab)
   call enter ("may"s,        5, Symtab)
   call enter ("june"s,       6, Symtab)
   call enter ("jun"s,        6, Symtab)
   call enter ("july"s,       7, Symtab)
   call enter ("jul"s,        7, Symtab)
   call enter ("august"s,     8, Symtab)
   call enter ("aug"s,        8, Symtab)
   call enter ("september"s,  9, Symtab)
   call enter ("sep"s,        9, Symtab)
   call enter ("october"s,   10, Symtab)
   call enter ("oct"s,       10, Symtab)
   call enter ("november"s,  11, Symtab)
   call enter ("nov"s,       11, Symtab)
   call enter ("december"s,  12, Symtab)
   call enter ("dec"s,       12, Symtab)

   call date (SYS_DATE, dattim)
   val = 1
   month = ctoi (dattim, val)
   val = 4
   day = ctoi (dattim, val)
   val = 7
   year = ctoi (dattim, val)

   call enter ("month"s, month, Symtab)
   call enter ("day"s, day, Symtab)
   call enter ("year"s, year, Symtab)
   call enter ("dow"s, get_dow (month, day, year), Symtab)

   call date (SYS_TIME, dattim)
   val = 1
   call enter ("hour"s, ctoi (dattim, val), Symtab)
   val = 4
   call enter ("minute"s, ctoi (dattim, val), Symtab)

   call date (SYS_USERID, To_user)
   call mapstr (To_user, LOWER)

   call scopy ("always"s, 1, Display_cond, 1)

   call scopy ("always"s, 1, Erase_cond, 1)

   return
   end



# errmsg --- print error message

   subroutine errmsg (msg)
   character msg (ARB)

   call print (ERROUT, "*s*n"p, msg)

   return
   end



# eval --- evaluate boolean expression, return YES/NO/ERR

   integer function eval (expr)
   character expr (ARB)

   include "memo_com.r.i"

   integer state

   call scopy (expr, 1, Expression, 1)
   Ep = 1
   Sp = 0

   call getsym

   call bexpr (state)

   if (state == FAILURE)
      return (ERR)
   if (Symbol ~= NEWLINE && Symbol ~= EOS) {
      call errmsg ("bogus character in expression"s)
      return (ERR)
      }
   if (state == NOMATCH)
      return (ERR)

   if (Stack (1) ~= 0)
      return (YES)

   return (NO)
   end



# get_dow --- get day-of-week corresponding to month,day,year

   integer function get_dow (month, day, year)
   integer month, day, year

   integer lmonth, lday, lyear

   lmonth = month - 2
   lday = day
   lyear = year

   if (lmonth <= 0) {
      lmonth = lmonth + 12
      lyear = lyear - 1
      }

   get_dow = mod (lday + (26 * lmonth - 2) / 10 + lyear + lyear / 4 - 34,
       7) + 1

   return
   end



# getsym --- get next symbol in expression text

   subroutine getsym

   include "memo_com.r.i"

   integer i
   integer lookup, equal

   character token (MAXLINE)

   while (Expression (Ep) == ' 'c || Expression (Ep) == TAB)
      Ep += 1

   if (IS_LOWER (Expression (Ep))) {
      for(i = 1; IS_LOWER (Expression (Ep)); i += 1) {
         token (i) = Expression (Ep)
         Ep += 1
         }
      token (i) = EOS
      if (equal (token, "always"s) == YES)
         Symbol = ALWAYS
      elif (equal (token, "never"s) == YES)
         Symbol = NEVER
      elif (lookup (token, Symval, Symtab) == YES)
         Symbol = CONSTANT
      else
         call errmsg ("undefined variable"s)
      }

   elif (IS_DIGIT (Expression (Ep))) {
      Symval = 0
      for (; IS_DIGIT (Expression (Ep)); Ep += 1)
         Symval = 10 * Symval + Expression (Ep) - '0'c
      Symbol = CONSTANT
      }

   else {
      Symbol = Expression (Ep)
      if (Symbol ~= NEWLINE && Symbol ~= EOS)
         Ep += 1
      }

   return
   end



# memo --- parse argument list, call memo sender or scanner

   subroutine memo

   include "memo_com.r.i"

   character arg (MAXLINE)

   integer ap
   integer getarg, equal, vfyusr

   for (ap = 1; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1) {
      call mapstr (arg, LOWER)

      if (equal (arg, "-t"s) == YES) {
         ap += 1
         if (getarg (ap, To_user, MAXLINE) == EOF)
            call usage
         call mapstr (To_user, LOWER)
         if (vfyusr (To_user) == ERR)
            call error ("illegal user name"p)
         }

      elif (equal (arg, "-d"s) == YES) {
         ap += 1
         if (getarg (ap, Display_cond, MAXLINE) == EOF)
            call usage
         call mapstr (Display_cond, LOWER)
         }

      elif (equal (arg, "-e"s) == YES) {
         ap += 1
         if (getarg (ap, Erase_cond, MAXLINE) == EOF)
            call usage
         call mapstr (Erase_cond, LOWER)
         }

      elif (vfyusr (arg) == OK)
         call scopy (arg, 1, To_user, 1)

      else {
         call remark ("illegal user name or improper argument syntax"p)
         call usage
         }
      }

   if (ap > 1)       # are we sending something?
      call send_memo
   else
      call scan_memos

   return
   end



# scan_memos --- scan the user's memo file, displaying and/or erasing

   subroutine scan_memos

   include "memo_com.r.i"

   integer memof, tempf, display, erase, junk
   integer open, getlin, eval

   character id (MAXLINE)

   memof = open ("=extra=/memo/=user="s, READWRITE)
   if (memof == ERR)
      call error ("can't open memo file.")

   tempf = mktemp (READWRITE)

   while (getlin (id, memof) ~= EOF) {

      if (getlin (Display_cond, memof) == EOF
        || getlin (Erase_cond, memof) == EOF) {
         call close (memof)
         call rmtemp (tempf)
         call error ("badly-formed memo file.")
         }

      display = eval (Display_cond)
      erase = eval (Erase_cond)

      if (erase == NO && display == NO) {
         call putlin (id, tempf)
         call putlin (Display_cond, tempf)
         call putlin (Erase_cond, tempf)
         repeat {
            junk = getlin (id, memof)
            call putlin (id, tempf)
            } until (id (1) == '.'c)
         }

      elif (erase == YES && display == NO) {
         repeat
            junk = getlin (id, memof)
            until (id (1) == '.'c)
         }

      elif (erase == NO && display == YES) {
         call print (STDOUT, "*n*n*s*n"p, id)
         call putlin (id, tempf)
         call putlin (Display_cond, tempf)
         call putlin (Erase_cond, tempf)
         repeat {
            junk = getlin (id, memof)
            call putlin (id, tempf)
            call putlin (id (2), STDOUT)     # subarray
            } until (id (1) == '.'c)
         }

      elif (erase == YES && display == YES) {
         call print (STDOUT, "*n*n*s*n"p, id)
         repeat {
            junk = getlin (id, memof)
            call putlin (id (2), STDOUT)
            } until (id (1) == '.'c)
         }

      }  # while ...

   call rewind (memof)
   call rewind (tempf)

   call fcopy (tempf, memof)
   call trunc (memof)

   call close (memof)
   call rmtemp (tempf)

   return
   end



# send_memo --- send a memo to the designated user

   subroutine send_memo

   include "memo_com.r.i"

   integer memof, i, tempf
   integer open, scopy, mktemp, getlin, eval

   character mfname (MAXLINE), user (MAXUSERNAME), tim (9), dat (9)
   character buf (MAXLINE)

   i = eval (Display_cond)
   if (i == ERR)
      return
   i = eval (Erase_cond)
   if (i == ERR)
      return

   tempf = mktemp (READWRITE)
   call fcopy (STDIN, tempf)
   call rewind (tempf)

   i = scopy ("=extra=/memo/"s, 1, mfname, 1)
   i = scopy (To_user, 1, mfname, i + 1)

   memof = open (mfname, READWRITE)
   if (memof == ERR)
      call error ("memo file not available.")
   call wind (memof)

   call date (SYS_USERID, user)
   call mapstr (user, LOWER)
   call date (SYS_DATE, dat)
   call date (SYS_TIME, tim)

   call print (memof, "Memo from *s at *s *s*n"p, user, tim, dat)
   call print (memof, "*s*n"p, Display_cond)
   call print (memof, "*s*n"p, Erase_cond)

   while (getlin (buf, tempf) ~= EOF) {
      call putch (' 'c, memof)
      call putlin (buf, memof)
      }

   call print (memof, ".*n"p)

   call close (memof)
   call rmtemp (tempf)

   return
   end



# usage --- print usage message, then die

   subroutine usage

   call error ("Usage: memo {[-t] user|-d display_cond|-e erase_cond}"p)

   return
   end



include "memo.stacc.r"
