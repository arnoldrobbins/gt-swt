# vpsd_cmd --- run the virtual debugger from the shell

   subroutine vpsd_cmd

   integer getarg, encode
   integer i, len
   character cmd (MAXCMD), arg (MAXCMD)


   for (i = 1; getarg (i, arg, 2) ~= EOF && arg (1) == '-'c; i += 1)
      ;

   if (getarg (i, arg, MAXCMD) ~= EOF) {
      call expand (arg, cmd, MAXCMD)
      call mktr$ (cmd, arg)
      }

   call delarg (0)
   len = encode (cmd, MAXCMD, "swtseg *s"s, arg)
   for (; i > 1; i -= 1) {
      if (len >= MAXCMD - 4)
         call error ("command too long"p)
      cmd (len + 1) = ' 'c
      len += getarg (0, cmd (len + 2), MAXCMD - len - 5) + 1
      call delarg (0)
      }

   call ctoc (" 1/1"s, cmd (len + 1), 5)     # vpsd register setting
   call sys$$ (cmd, ERR)

   stop
   end
