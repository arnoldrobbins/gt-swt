

            vt$rel (6) --- position relatively to row, col           11/06/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$rel (row, col, crow, ccol)
                 integer row, col, crow, ccol

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$rel'  positions  the  cursor  on  the terminal screen to
                 'row',  'col'  from  position  'crow',  'ccol'  using   only
                 relative  cursor  positioning.   'Vtinit' or 'vtterm' should
                 have been called previously to set up the  terminal  charac-
                 teristics.   'Vt$rel' is called as a last resort to position
                 the cursor by 'vt$pos'.  If it is impossible to position the
                 cursor with what knowlege it has, 'vtterm' will have already
                 returned an error.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$rel' uses whatever capabilities are available  to  posi-
                 tion   the  cursor.   If  the  terminal  lacks  a  cursor_up
                 sequence, the cursor is homed to the upper left hand side of
                 the screen and moved down using the cursor_down sequence, or
                 issuing LF characters (which is relatively  universal).   It
                 moves  the  cursor  to the right my issuing the cursor_right
                 sequence  and  to  the  left  by  issuing  the   cursor_left
                 sequence,  or  by  issuing  a  CR  character and issuing the
                 cursor_right sequence.


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)

















            vt$rel (6)                    - 1 -                    vt$rel (6)


