

            vt$put (6) --- copy string into terminal buffer          07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$put (str, row, col, len)
                 character str (ARB)
                 integer row, col, len

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$put'  takes  the  string given in 'str' and copies it to
                 the screen buffers so that when the screen is next  updated,
                 the  string  appears starting at row 'row' and column 'col'.
                 'Len' indicates how long the string is.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$put' first verifies that a legal location on the  screen
                 is  given by the coordinates ('row', 'col'); if they are off
                 the screen,  then  internal  buffer  variables  are  set  to
                 defaults  which will prevent strange updating of the screen.
                 Otherwise, the line is "fitted" to the screen; as much of it
                 as possible  will  be  displayed  without  overstepping  the
                 screen  boundaries.  The string in 'str' is then packed into
                 the screen buffer, ready  for  the  next  screen  update  to
                 occur.


            _C_a_l_l_s

                 print


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)















            vt$put (6)                    - 1 -                    vt$put (6)


