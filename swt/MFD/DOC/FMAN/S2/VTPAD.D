

            vtpad (2) --- pad the rest of a field with blanks        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtpad (len)
                 integer len

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtpad'  simply  clears  the  rest  of  a field with blanks,
                 starting  at  the  current  cursor  position.   The   single
                 argument  required is the length of the field to clear, from
                 the current cursor position.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtpad' simply checks how much more room is on a  line  with
                 respect to the length to pad and the current cursor position
                 and then stores blanks into the new screen, making sure that
                 padding doesn't go past the end of the screen.


            _C_a_l_l_s

                 vt$put


            _S_e_e _A_l_s_o

                 other vt?* routines (2)


























            vtpad (2)                     - 1 -                     vtpad (2)


