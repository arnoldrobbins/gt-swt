# case --- case-statement command for Shell

   subroutine case_cmd

# Syntax:
#     case [<value>]
#        when <string>
#           { <stmt> }
#        when <string>
#           { <stmt> }
#        ...
#        out
#           { <stmt> }
#     esac

   character cmd (MAXLINE), arg (MAXLINE), val (MAXLINE)
   integer nesting
   integer getnet, equal, getarg

   if (getarg (1, val, MAXLINE) == EOF)
      val (1) = EOS

   nesting = 0
   repeat {
      if (getnet (cmd, arg) == EOF)
         call error ("missing 'esac'"p)
      select
         when (equal (cmd, "esac"s) ~= NO)
            if (nesting == 0)
               break
            else
               nesting -= 1
         when (equal (cmd, "case"s) ~= NO)
            nesting += 1
         when (equal (cmd, "when"s) ~= NO)
            if (nesting == 0 && equal (arg, val) ~= NO)
               break
         when (equal (cmd, "out"s) ~= NO)
            if (nesting == 0)
               break
      }

   stop
   end
