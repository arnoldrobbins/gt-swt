# when_cmd --- flag alternative in a case statement
#              See 'case' for more details.

   subroutine when_cmd

   call exit_case_cmd

   return
   end



# exit_case_cmd --- drop out of a case statement

   subroutine exit_case_cmd

   integer nesting
   integer getnet, equal
   character cmd (MAXLINE), arg (MAXLINE)

   nesting = 0
   while (getnet (cmd, arg) ~= EOF)
      select
         when (equal (cmd, "esac"s) ~= NO)
            if (nesting == 0)
               return
            else
               nesting -= 1
         when (equal (cmd, "case"s) ~= NO)
            nesting += 1

   call error ("missing 'esac'"p)
   end
