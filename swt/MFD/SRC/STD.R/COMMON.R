# common --- print lines common to sorted files

   define (COLUMN_WIDTH,24)
   define (LESS_THAN,-1)
   define (EQUAL_TO,0)
   define (GREATER_THAN,1)

   integer t1, t2
   integer getlin, compare
   character line1 (MAXLINE), line2 (MAXLINE)

   include "common_com.r.i"

   call get_params
   t1 = getlin (line1, Fd1)
   t2 = getlin (line2, Fd2)
   while (t1 ~= EOF || t2 ~= EOF) {
      if (t1 == EOF && t2 ~= EOF) {
         repeat call output (line2, 2)
            until (getlin (line2, Fd2) == EOF)
         break
         }
      elif (t1 ~= EOF && t2 == EOF) {
         repeat call output (line1, 1)
            until (getlin (line1, Fd1) == EOF)
         break
         }
      else
         select (compare (line1, line2))
            when (LESS_THAN) {
               call output (line1, 1)
               t1 = getlin (line1, Fd1)
               }
            when (EQUAL_TO) {
               call output (line1, 3)
               t1 = getlin (line1, Fd1)
               t2 = getlin (line2, Fd2)
               }
            when (GREATER_THAN) {
               call output (line2, 2)
               t2 = getlin (line2, Fd2)
               }
      }

   call close (Fd1)
   call close (Fd2)

   stop
   end


# compare --- compare two strings; return -1 for <, 0 for ==, 1 for >

   integer function compare (str1, str2)
   character str1 (ARB), str2 (ARB)

   integer i

   for (i = 1; str1 (i) == str2 (i); i += 1)
      if (str1 (i) == EOS)
         return (EQUAL_TO)

   if (str1 (i) < str2 (i))
      compare = LESS_THAN
   else
      compare = GREATER_THAN

   return
   end


# get_params --- get options and file names from argument list

   subroutine get_params

   include "common_com.r.i"

   integer getarg, open
   integer i, j
   character arg (MAXLINE)

   i = 1
   Out_col (1) = YES
   Out_col (2) = YES
   Out_col (3) = YES
   if (getarg (i, arg, MAXLINE) == EOF) {
      Fd1 = STDIN1
      Fd2 = STDIN2
      return
      }
   if (arg (1) == '-'c) {
      i += 1
      Out_col (1) = NO
      Out_col (2) = NO
      Out_col (3) = NO
      for (j = 2; arg (j) ~= EOS; j += 1)
         select (arg (j))
            when ('1'c)
               Out_col (1) = YES
            when ('2'c)
               Out_col (2) = YES
            when ('3'c)
               Out_col (3) = YES
      }
   if (getarg (i, arg, MAXLINE) == EOF) {
      Fd1 = STDIN1
      Fd2 = STDIN2
      return
      }
   Fd1 = open (arg, READ)
   if (Fd1 == ERR)
      call cant (arg)
   i += 1
   if (getarg (i, arg, MAXLINE) == EOF)
      Fd2 = STDIN1
   else {
      Fd2 = open (arg, READ)
      if (Fd2 == ERR)
         call cant (arg)
      }

   return
   end


# output --- output line to column col (first draft)

   subroutine output (line, col)
   character line (ARB)
   integer col

   include "common_com.r.i"

   if (Out_col (col) ~= NO) {
      select (col)
         when (2)
            ;
         when (3)
            if (Out_col (2) ~= NO)
               call print (STDOUT, "*#x"s, COLUMN_WIDTH)
      ifany
         if (Out_col (1) ~= NO)
            call print (STDOUT, "*#x"s, COLUMN_WIDTH)
      call putlin (line, STDOUT)
      }

   return
   end
