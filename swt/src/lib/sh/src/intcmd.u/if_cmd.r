# if_cmd --- conditional statement for shell

   subroutine if_cmd

# Syntax:
#     if <value>
#        {<command>}
#     else
#        {<command>}
#     fi
#
# <value> zero, null, or missing implies .false.,
#     anything else implies .true.

   character arg (MAXLINE), cmd (MAXLINE)
   integer nesting
   integer cknum, getarg, getnet, equal

   if (getarg (1, arg, MAXLINE) == EOF)   # missing argument
      arg (1) = EOS

   while (cknum (arg) == 0) {
      nesting = 0
      repeat {
         if (getnet (cmd, arg) == EOF)
            call error ("missing 'fi'"p)
         select
            when (equal (cmd, "fi"s) ~= NO)
               if (nesting == 0)
                  break 2
               else
                  nesting -= 1
            when (equal (cmd, "else"s) ~= NO)
               if (nesting == 0)
                  break 2
            when (equal (cmd, "if"s) ~= NO)
               nesting += 1
            when (equal (cmd, "elif"s) ~= NO)
               next 2
         }
      }

   stop
   end



# getnet --- get command and first argument from next net in input

   integer function getnet (cmd, arg)
   character cmd (ARB), arg (ARB)

   integer status
   integer get_cl

   pointer command, c2

   if (get_cl (command) == EOF) {
      cmd (1) = EOS
      arg (1) = EOS
      return (EOF)
      }

   call eval_netsep (command, status)

   c2 = command
   repeat {       # until we get past any labels
      call get_next_token (c2, cmd)
      } until (cmd (1) ~= ':'c)

   call get_next_token (c2, arg)
   call lsfree (command, ALL)

   return (OK)
   end



# get_next_token --- get token from lsline into token

   integer function get_next_token (lsline, token)
   pointer lsline
   character token (ARB)

   integer i

   character quote, c
   character lsgetc

   repeat
      if (lsgetc (lsline, c) ~= ' 'c && c ~= TAB)
         break

   i = 1
   repeat
      if (c == "'"c || c == '"'c) {
         quote = c
         repeat {
            c = lsgetc (lsline, c)
            if (c == quote) {
               c = lsgetc (lsline, c)
               next 2
               }
            token (i) = c
            if (c == EOS)           # missing quote?
               break 2
            i += 1
            }
         }
      else {
         token (i) = c
         if (c == EOS || c == ' 'c || c == TAB)
            break
         i += 1
         c = lsgetc (lsline, c)
         }

   token (i) = EOS
   if (i == 1 && c == EOS)
      return(EOF)

   return(i - 1)
   end
