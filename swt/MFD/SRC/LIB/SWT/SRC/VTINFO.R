# vtinfo --- return certain information from the VTH common blocks

   integer function vtinfo (key, info)
   integer key, info (ARB)

   include SWT_COMMON

   select (key)
   when (VT_MAXRC) {    # return the max row and max col
      info (1) = Maxrow
      info (2) = Maxcol
      }
   when (VT_WRAP)       # return whether or not terminal wraps at eol
      info (1) = Tc_wrap_around
   when (VT_HWINS) {    # terminal has hardware insert
      info (1) = NO
      if (Tc_ins_line (1) ~= EOS)
         info (1) = YES
      }
   when (VT_HWDEL) {
      info (1) = NO
      if (Tc_del_line (1) ~= EOS)
         info (1) = YES
      }
   when (VT_HWCEL) {
      info (1) = NO
      if (Tc_clear_to_eol (1) ~= EOS)
         info (1) = YES
      }
   when (VT_BAUD)
      info (1) = Tc_speed
   else
      return (ERR)      # invalid key given

   return (OK)
   end
