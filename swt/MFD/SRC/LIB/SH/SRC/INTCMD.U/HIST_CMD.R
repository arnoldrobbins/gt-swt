#  hist_cmd --- print out the previous history

   subroutine hist_cmd

   include HIST_COMMON

   character arg(MAXPATH)
   integer status, fd, junk

   integer getarg, equal
   integer histsave, histrest

   procedure hist_print forward


   if (getarg(1, arg, MAXPATH) == EOF) {
      if (H_on ~= YES) {
         call remark("history is not enabled"p)
         return
         }

      hist_print
      return
      }

   select
   when (equal(arg, "off"s) == YES)
      H_on = NO
   when (equal(arg, "on"s) == YES) {
      call histinit
      H_on = YES
      }
   when (equal(arg, "save"s) == YES) {
      if (H_on ~= YES) {
         call remark("history is not enabled"p)
         return
         }

      if (getarg(2, arg, MAXPATH) == EOF)
         call ctoc("=histfile="s, arg, MAXPATH)

      if (histsave(arg) == ERR)
         call error("can't save command history"p)
      }
   when (equal(arg, "restore"s) == YES) {
      if (getarg(2, arg, MAXPATH) == EOF)
         call ctoc("=histfile="s, arg, MAXPATH)

      H_on = NO
      if (histrest(arg) == ERR)
         call error("can't restore command history"p)

      H_on = YES
      }
   else
      call error("Usage: hist [on | off | save [<file>] | restore [<file>]]"p)

   stop


   procedure hist_print {

      local ln, pl, i, pt
      integer ln, pl, i, pt

      pl = H_pl
      ln = H_line

      while (pl ~= H_pf) {
         call print(STDOUT, "*3i: "s, ln)

         pt = mod(pl, MAXHIST) + 1
         if (pt ~= H_pf && H_ptr(pl) < H_ptr(pt))
            call putlin(H_buf(H_ptr(pl)), STDOUT)
         elif (pt == H_pf && H_ptr(pl) < H_bf)
            call putlin(H_buf(H_ptr(pl)), STDOUT)
         else {
            for (i = H_ptr(pl); i <= HISTSIZE && H_buf(i) ~= EOS; i += 1)
               call putch(H_buf(i), STDOUT)

            if (H_buf(HISTSIZE) ~= EOS)
               call putlin(H_buf(1), STDOUT)
            }

         call putch(NEWLINE, STDOUT)

         pl = pt
         ln += 1
         }
      }


   end
