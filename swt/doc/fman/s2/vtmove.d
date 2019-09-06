

            vtmove (2) --- move the user's cursor to row, col        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtmove (row, col)
                 integer row, col

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtmove' moves the cursor on the terminal to position 'row',
                 'col' with the least cost.  'Vtinit' should have been called
                 beforehand  to  set  up  the terminal characteristics in the
                 virtual terminal handler.  If the coordinates given are  off
                 of the screen, no positioning will be done.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtmove'  first checks if relative movement would be faster,
                 and if so, relatively positions  the  cursor,  otherwise  it
                 calls 'vt$pos' to absolutely position the cursor.


            _C_a_l_l_s

                 vt$pos, vt$out


            _S_e_e _A_l_s_o

                 other vt?* routines (2)


























            vtmove (2)                    - 1 -                    vtmove (2)


