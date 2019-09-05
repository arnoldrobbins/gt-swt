# set_cmd --- set value of a shell variable

   subroutine set_cmd

   integer getarg, equal
   character junk (3), var (MAXLINE), val (MAXLINE)
   string usage "Usage: set [ <var> ]  =  [ <exp> ]"

   procedure getval (arg) forward

   if (getarg (1, var, MAXLINE) == EOF)      # must be at least one arg
      call error (usage)

   if (var (1) == '='c && var (2) == EOS) {  # var name omitted, use STDOUT1
      if (getarg (3, junk, 1) ~= EOF)        # complain if extra args
         call error (usage)
      getval (2)
      call print (STDOUT, "*s*n"p, val)
      }
   elif (getarg (2, junk, 3) == EOF
         || equal (junk, "="s) == NO
         || getarg (4, junk, 1) ~= EOF)
      call error (usage)
   else {
      getval (3)
      call svput (var, val)
      }

   stop


   # getval --- get value from arg list or STDIN1

      procedure getval (arg) {
      integer arg

      local l
      integer l
      integer getlin, getarg

      if (getarg (arg, val, MAXLINE) == EOF) {
         l = getlin (val, STDIN)
         if (l == EOF)
            val (1) = EOS
         elif (val (l) == NEWLINE)
            val (l) = EOS
         }

      }


   end
