

            vtupd (2) --- update the terminal screen with VTH screen  07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtupd (clr)
                 integer clr

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtupd'  is  used  to update the changes from the last (old)
                 VTH screen buffer to the new screen buffer on  the  terminal
                 screen.   The  argument is a flag which tells whether or not
                 to clear the screen and redraw, or only  update  the  screen
                 with  the  changes.   If  'clr' is YES, the entire screen is
                 cleared and completely redrawn.  If 'clr' is  NO,  only  the
                 changes needed are made on the screen.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After  making  the  changes  to  the  screen, the new screen
                 buffer image is copied into the old screen buffer image  for
                 the  next  time  around.  'Vtupd' is reasonably efficient in
                 updating the screen and copying the old screen  to  the  new
                 screen.


            _C_a_l_l_s

                 vt$clr, vt$out, date, vtmove, vtmsg


            _S_e_e _A_l_s_o

                 other vt?* routines (2)






















            vtupd (2)                     - 1 -                     vtupd (2)


