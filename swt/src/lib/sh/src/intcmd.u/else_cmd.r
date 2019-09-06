# else --- remainder of conditional statement for Shell
#          See 'if' for more details.

   subroutine else_cmd

   integer nesting
   integer getnet, equal
   character cmd (MAXLINE), arg (MAXLINE)

   nesting = 0
   repeat {
      if (getnet (cmd, arg) == EOF)
         call error ("missing 'fi'"p)
      select
         when (equal (cmd, "fi"s) ~= NO)
            if (nesting == 0)
               break
            else
               nesting -= 1
         when (equal (cmd, "if"s) ~= NO)
            nesting += 1
      }

   stop
   end
