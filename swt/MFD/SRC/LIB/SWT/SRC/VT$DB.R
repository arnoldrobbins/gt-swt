# vt$db --- dump terminal characteristics

   subroutine vt$db

   include SWT_COMMON

   character str (MAXLINE)

   call print (ERROUT, "Maxrow=*i, Maxcol=*i*n"s, Maxrow, Maxcol)

   call vt$db1 ("clear_screen"s, Tc_clear_screen)
   call vt$db1 ("clear_to_eol"s, Tc_clear_to_eol)
   call vt$db1 ("clear_to_eos"s, Tc_clear_to_eos)
   call vt$db1 ("cursor_home"s, Tc_cursor_home)
   call vt$db1 ("cursor_left"s, Tc_cursor_left)
   call vt$db1 ("cursor_right"s, Tc_cursor_right)
   call vt$db1 ("cursor_up"s, Tc_cursor_up)
   call vt$db1 ("cursor_down"s, Tc_cursor_down)
   call vt$db1 ("abs_pos"s, Tc_abs_pos)
   call vt$db1 ("vert_pos"s, Tc_vert_pos)
   call vt$db1 ("hor_pos"s, Tc_hor_pos)

   call ctomn (Tc_coord_char, str)
   call print (ERROUT, "coord_char=*s*n"s, str)

   call print (ERROUT, "coord_type=*i*n"s, Tc_coord_type)
   call print (ERROUT, "seq_type=*i*n"s, Tc_seq_type)
   call print (ERROUT, "delay_time=*i*n"s, Tc_delay_time)
   call print (ERROUT, "wrap_around=*y*n"s, Tc_wrap_around)
   call print (ERROUT, "clr_len=*i*n"s, Tc_clr_len)
   call print (ERROUT, "ceos_len=*i*n"s, Tc_ceos_len)
   call print (ERROUT, "ceol_len=*i*n"s, Tc_ceol_len)
   call print (ERROUT, "abs_len=*i*n"s, Tc_abs_len)
   call print (ERROUT, "vert_len=*i*n"s, Tc_vert_len)
   call print (ERROUT, "hor_len=*i*n"s, Tc_hor_len)

   return
   end
