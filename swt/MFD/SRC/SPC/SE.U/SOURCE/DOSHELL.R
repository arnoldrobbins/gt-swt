# doshell --- escape to the shell to run one or more SWT commands

#  emulate vi: if running just a shell, redraw the screen as
#  soon as the shell exits.  if running a program, let the user
#  redraw the screen when he/she is ready.

#  also emulate USG Unix 5.0 ed: a ! as the first character is
#  replaced by the previaos shell command; an unescaped % is replaced
#  by the saved file name.  The expanded command is echoed.

   integer function doshell (lin, in_i)
   character lin (ARB)
   integer in_i

   include SE_COMMON

   character c
   integer i, j, k
   integer auto_redraw, expanded
   character new_command (MAXLINE)
   integer return_code, shell, subsys

   expanded = NO

   if (Nlines == 0) {   # use normal 'ed' behavior
      call position_cursor (Nrows, 1)

      if (lin (in_i) == NEWLINE)
         auto_redraw = YES
      else
         auto_redraw = NO

      # build command, checking for leading !, and % anywhere
      if (lin (in_i) == '!'c) {
         if (Sav_com (1) ~= EOS) {
            for (j = 1; Sav_com (j) ~= EOS; j += 1)
               new_command (j) = Sav_com (j)
            if (new_command (j-1) == NEWLINE)
               j -= 1
            in_i += 1
            expanded = YES
            }
         else {
            Errcode = ENOCMD
            return (ERR)
            }
         }
      else
         j = 1

      for (i = in_i; lin (i) ~= EOS; i += 1) {
         if (lin (i) == ESCAPE) {
            if (lin (i+1) ~= '%'c) {
               new_command (j) = ESCAPE
               new_command (j+1) = lin (i+1)
               j += 2
               i += 1      # will be incremented again by for loop
               }
            else {
               i += 1
               new_command (j) = lin (i)
               j += 1
               }
            }
         else if (lin (i) == '%'c) {
            for (k = 1; Savfil (k) ~= EOS; k += 1) {
               new_command (j) = Savfil (k)
               j += 1
               }
            expanded = YES
            }
         else {
            new_command (j) = lin (i)
            j += 1
            }
         }

      if (new_command (j-1) == NEWLINE)
         j -= 1
      new_command (j) = EOS

      call scopy (new_command, 1, Sav_com, 1)   # save it

      # reset tty to normal
      call duplx$ (Tty_state)    # restore normal modes
      call break$ (ENABLE)

      call print (STDOUT, "*n*n"s)  # clear out a new line

      if (auto_redraw == YES)    # no command line supplied
         return_code = shell (STDIN)
      else {
         if (expanded == YES)
            call print (STDOUT, "*s*n"s, new_command) # echo it
         return_code = subsys (new_command)
         }

      # a la vi:
      if (auto_redraw == NO && return_code == OK) {
         call print (STDOUT, "type return to continue: "s)
         repeat
            call t1in (c)
         until (c == NEWLINE || c == EOF)
         }

      # reset tty for editing
      call duplx$ (NOECHO)
      call break$ (DISABLE)

      call restorescreen
      if (return_code == ERR) {
        Errcode = ENOSHELL
        return (ERR)
        }
      else
        return (OK)
      }
   else
      call remark ("Not implemented"p)

   if (return_code ~= OK) {
     Errcode = ENOSHELL
     return (ERR)
     }
   else
     return (OK)

   end
