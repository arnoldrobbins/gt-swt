# file --- test for file conditions on specified file

integer filtst, result, getarg, argno
character pathname (MAXLINE)
integer zero_length, exists, type, permissions, got_path, i
integer readable, writable, dumped
character arg (MAXLINE)
integer p_bits (6)

permissions = 0   # default permission list:       NO
type = 0          # default type list:             NO
exists = 1        # default finding if file exists:YES
zero_length = 0   # default length test:           NO
readable = 0      # default readability test:      NO
writable = 0      # default writability test:      NO
dumped = 0        # default dumped test:           NO
argno = 1       # first argument number
got_path = NO   # did caller pass a pathname?

#  set up bit flag array for primos permissions
p_bits(1) = :2000       # owner delete/truncate
p_bits(2) = :1000       # owner write permission
p_bits(3) = :400        # owner read permission
p_bits(4) = :4          # non-owner delete/truncate
p_bits(5) = :2          # non-owner write permission
p_bits(6) = :1          # non-owner read permission

#
#  expecting only one pathname per call, find all args and then process
#
while (EOF ~= getarg (argno, arg, MAXLINE)) {
   if (arg(1) == '-'c) {
      call mapstr (arg, UPPER)
#
# check found arg for one of the known arg types
      if (arg(2) ~= 'D'c &&
          arg(2) ~= 'E'c &&
          arg(2) ~= 'N'c &&
          arg(2) ~= 'P'c &&
          arg(2) ~= 'S'c &&
          arg(2) ~= 'U'c &&
          arg(2) ~= 'W'c &&
          arg(2) ~= 'R'c &&
          arg(2) ~= 'Z'c )
            call usage

      if (arg(2) == 'D'c)
         type = :100001
      if (arg(2) == 'E'c)
         exists = 1
      if (arg(2) == 'P'c) {
         if (EOF == getarg (argno + 1, arg, MAXLINE))
            call usage
         argno = argno + 1
         for (i=1; i<=6; i=i+1)
            if (arg(i) ~= '-'c)
               permissions = or (permissions, p_bits (i))
         }
      if (arg(2) == 'R'c)
         readable = 1
      if (arg(2) == 'S'c)
         type = :100000
      if (arg(2) == 'U'c)
         type = :100004
      if (arg(2) == 'W'c)
         writable = 1
      if (arg(2) == 'Z'c)
         zero_length = 1
      if (arg(2) == 'N'c) {
         if (arg(3) ~= 'E'c &&
             arg(3) ~= 'W'c &&
             arg(3) ~= 'R'c &&
             arg(3) ~= 'Z'c )
               call usage

         if (arg(3) == 'E'c)
            exists = -1
         if (arg(3) == 'R'c)
            readable = -1
         if (arg(3) == 'W'c)
            writable = -1
         if (arg(3) == 'Z'c)
            zero_length = -1
         }
      }
#------ end of minus options ------
#
#------ if not a minus option, assume it was a pathname
   else {
      call scopy (arg, 1, pathname, 1)
      got_path = YES
      }

   argno = argno + 1
   }     # end of while loop for arg processing

if (got_path == NO) {      # no pathname... error!
   call usage
   }

result = filtst (pathname, zero_length, permissions, exists, type,
   readable, writable, dumped)
#
#  filtst returns ERR, YES, NO...
if (result == YES)
   call print (STDOUT, "1*n.")
else if (result == NO)
   call print (STDOUT, "0*n.")
else if (result == ERR) {
   call print (STDOUT, "0*n.")
   call print (ERROUT, "*s: cannot test conditions*n"s, pathname)
   }

stop
end

subroutine usage

call error ("Usage: file <pathname> -d -[n]e -p twrtwr -[n]r -s -u -[n]w -[n]z"p)

return
end
