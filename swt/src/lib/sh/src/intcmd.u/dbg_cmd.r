# dbg_cmd --- execute a command under control of the debugger

   subroutine dbg_cmd

   integer i, len
   integer getarg, encode

   character cmd (MAXCMD), arg (MAXCMD)

   for (i = 1; getarg (i, arg, 2) ~= EOF && arg (1) == '-'c; i += 1)
      ;

   if (getarg (i, arg, MAXCMD) ~= EOF) {
      call expand (arg, cmd, MAXCMD)
      call mktr$ (cmd, arg)
      }

   call delarg (0)
   len = encode (cmd, MAXCMD, "dbg *s"s, arg)
   for (; i > 1; i -= 1) {
      if (len >= MAXCMD)
         call error ("command too long"p)
      cmd (len + 1) = ' 'c
      len += getarg (0, cmd (len + 2), MAXCMD - len - 1) + 1
      call delarg (0)
      }

   call sys$$ (cmd, ERR)

   stop
   end
