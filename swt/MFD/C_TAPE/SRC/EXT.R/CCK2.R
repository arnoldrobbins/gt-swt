# cck2 --- phase 2 of the C program checker

   include "cck2_def.r.i"

   include "cck2_com.r.i"

   integer getlin
   character ltype (MAXLINE)

   Fname (1) = EOS
   Fref = YES

   while (getlin (Buf, STDIN, MAXBUF) ~= EOF) {
      if (Buf (1) ~= '#'c) {
         call print (ERROUT, "cck2: bogus line: *s"p, Buf)
         next
         }
      Bp = 2
      call getwrd (Buf, Bp, Name)
      call getwrd (Buf, Bp, ltype)
      call getwrd (Buf, Bp, File)
      call getwrd (Buf, Bp, Line)

DB    call print (ERROUT, "main: *s *s *s *s*n"s, Name, ltype, File, Line)

      select (ltype (1))
         when ('d'c)
            call fn_def
         when ('i'c)
            call fn_call
      else
         call print (ERROUT, "cck2: unrecognized flag: *s*n", ltype)
      }

   if (Fref == NO) {
      call put_where (Fname, Ffile, Fline)
      call print (STDOUT, "not referenced*n"s)
      }

   stop
   end



# fn_def --- handle the definitions of a function

   subroutine fn_def

   include "cck2_com.r.i"

   character mode (MAXLINE)
   integer equal

   if (equal (Name, Fname) == YES) {
      call put_where (Name, File, Line)
      call print (STDOUT, "defined twice*n"s)
      return
      }

   if (Fref == NO) {
      call put_where (Fname, Ffile, Fline)
      call print (STDOUT, "not referenced*n"s)
      }

   call ctoc (Name, Fname, MAXLINE)
   call ctoc (Line, Fline, MAXLINE)
   call ctoc (File, Ffile, MAXLINE)
   Fref = NO

   for (Fnargs = 1; Fnargs <= MAXARGS && Buf (Bp) ~= EOS
         && Buf (Bp) ~= NEWLINE; Fnargs += 1) {
      call getwrd (Buf, Bp, mode)
      call cvt_mode (mode, Mtype (1, Fnargs), Mlen (1, Fnargs))
      }

   if (Buf (Bp) ~= EOS && Buf (Bp) ~= NEWLINE) {
      call put_where (Name, File, Line)
      call print (STDOUT, "too many arguments*n"s)
      }

   return
   end



# fn_call --- handle a function call

   subroutine fn_call

   include "cck2_com.r.i"

   character mode (MAXLINE)
   integer nargs
   integer type (MAXMODES)
   integer equal, cmp_mode
   longint len (MAXMODES)

   if (equal (Name, Fname) == NO) {
      call put_where (Name, File, Line)
      call print (STDOUT, "not defined*n"s)
      call fn_def
      Fref = YES
      return
      }

   for (nargs = 1; nargs <= Fnargs && Buf (Bp) ~= EOS
         && Buf (Bp) ~= NEWLINE; nargs += 1) {
      call getwrd (Buf, Bp, mode)
      call cvt_mode (mode, type, len)
      select (cmp_mode (type, len, Mtype (1, nargs), Mlen (1, nargs)))
         when (WARN) {
            call put_where (Fname, Fline, Ffile)
            call print (STDOUT, "in call ('*s' *s), "s, File, Line)
            if (nargs == 1)
               call print (STDOUT, "return value"s)
            else
               call print (STDOUT, "arg *i"s, nargs - 1)
            call print (STDOUT, " types don't agree (warning)*n"s)
            }
         when (FATAL) {
            call put_where (Fname, Fline, Ffile)
            call print (STDOUT, "in call ('*s' *s), "s, File, Line)
            if (nargs == 1)
               call print (STDOUT, "return value"s)
            else
               call print (STDOUT, "arg *i"s, nargs - 1)
            call print (STDOUT, " type mismatch -- call will fail*n"s)
            }
      }

   if (Buf (Bp) ~= EOS && Buf (Bp) ~= NEWLINE) {
      call put_where (Fname, Fline, Ffile)
      call print (STDOUT, "in call ('*s' *s), "s, File, Line)
      call print (STDOUT, "variable number of args*n"s)
      }

   Fref = YES

   return
   end



# put_where --- print the name and location for an error

   subroutine put_where (n, f, l)
   character n (MAXLINE), f (MAXLINE), l (MAXLINE)

   call print (STDOUT, "*s ('*s' *s):  "s, n, f, l)

   return
   end



# cvt_mode --- convert text representation of a mode

   subroutine cvt_mode (str, type, len)
   character str (MAXLINE)
   integer type (MAXMODES)
   longint len (MAXMODES)

   integer i, m, nm
   longint l
   longint ctol

   for ({i = 1; nm = 1}; str (i) ~= EOS; nm += 1) {
      m = ctol (str, i)
      if (str (i) == ':'c) {
         i += 1
         l = ctol (str, i)
         }
      else
         l = 0
      if (nm >= MAXMODES) {
         call print (STDOUT, "cck2: mode too complicated*n"p)
         break
         }
      type (nm) = m
      len (nm) = l
      if (str (i) ~= EOS)
         i += 1
      }

   type (nm) = EOS
   len (nm) = 0

DB call print (ERROUT, "cvt_mode: '*s' "s, str)
DB for (i = 1; type (i) ~= EOS; i += 1)
DB    call print (ERROUT, " *i:*l"s, type (i), len (i))
DB call print (ERROUT, "*n"s)

   return
   end



# cmp_mode --- compare two modes for compatibility

   integer function cmp_mode (t1, l1, t2, l2)
   integer t1 (MAXMODES), t2 (MAXMODES)
   longint l1 (MAXMODES), l2 (MAXMODES)

   define (G, 0)     # identical modes
   define (W, 1)     # not identical, but compatible
   define (F, 2)     # not compatible
   define (P1, 3)    # remove parent of mode 1; try again
   define (P2, 4)    # remove parent of mode 2; try again
   define (P3, 5)    # remove parents of both; try again
   define (S, 6)     # compare sizes

   integer i1, i2, code, fatalok

   integer cmp_tbl (17, 17)

   data cmp_tbl /_
   ######################################################
   #                U  S                       F        #
   #    C           N  H  L           P        U        #
   #    H           S  O  O     D     O        N  S     #
   #    A     S     I  R  N  F  O  F  I  A     C  T  U  #
   # C  R     H  L  G  T  G  L  U  I  N  R  E  T  R  N  #
   # H  U  I  O  O  N  U  U  O  B  E  T  R  N  I  U  I  #
   # A  N  N  R  N  E  N  N  A  L  L  E  A  U  O  C  O  #
   # R  S  T  T  G  D  S  S  T  E  D  R  Y  M  N  T  N  #
   ###############################################################
     G ,W ,G ,W ,F ,W ,W ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# CHAR
     W ,G ,W ,W ,F ,G ,W ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# CHARUNS
     G ,W ,G ,W ,F ,W ,W ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# INT
     W ,W ,W ,G ,F ,W ,W ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# SHORT
     F ,F ,F ,F ,G ,F ,F ,W ,F ,F ,P1,F ,F ,F ,F ,F ,F ,# LONG
     W ,G ,W ,W ,F ,G ,W ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# UNSIGNED
     W ,W ,W ,W ,F ,W ,G ,F ,F ,F ,P1,F ,F ,W ,F ,F ,F ,# SHORTUNS
     F ,F ,F ,F ,W ,F ,F ,G ,F ,F ,P1,F ,F ,F ,F ,F ,F ,# LONGUNS
     F ,F ,F ,F ,F ,F ,F ,F ,G ,G ,F ,F ,F ,F ,F ,F ,F ,# FLOAT
     F ,F ,F ,F ,F ,F ,F ,F ,G ,G ,F ,F ,F ,F ,F ,F ,F ,# DOUBLE
     P2,P2,P2,P2,P2,P2,P2,P2,F ,F ,P3,F ,F ,P2,F ,F ,F ,# FIELD
     F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,P3,P3,F ,P1,F ,F ,# POINTER
     F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,P3,P3,F ,F ,F ,F ,# ARRAY
     W ,W ,W ,W ,F ,W ,W ,F ,F ,F ,P1,F ,F ,G ,F ,F ,F ,# ENUM
     F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,P2,F ,F ,P3,F ,F ,# FUNCTION
     F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,S ,S ,# STRUCT
     F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,F ,S ,S /# UNION
   ###############################################################

   fatalok = YES

   i1 = 1
   i2 = 1
   while (t1 (i1) ~= EOS && t1 (i2) ~= EOS) {
      if (t1 (i1) < 1 || t1 (i1) > 17 || t2 (i2) < 1 || t2 (i2) > 17)
         code = F
      else
         code = cmp_tbl (t1 (i1), t2 (i2))

DB    call print (ERROUT, "cmp_mode: t1=*i t2=*i c=*i*n"s,
DB          t1 (i1), t2 (i2), code)

      select (code)
         when (G)
            return (GOOD)
         when (W)
            return (WARN)
         when (F)
            if (fatalok == YES)
               return (FATAL)
            else
               return (WARN)
         when (P1)
            i1 += 1
         when (P2)
            i2 += 1
         when (P3) {
            i1 += 1
            i2 += 1
            fatalok = NO
            }
         when (S) {
            if (l1 (i1) == l2 (i2))
               return (GOOD)
            else if (fatalok == YES)
               return (FATAL)
            else
               return (WARN)
            }
      }

   if (fatalok == YES)
      return (FATAL)
   else
      return (WARN)

   end
