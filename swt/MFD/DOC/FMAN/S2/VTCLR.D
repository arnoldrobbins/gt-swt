

            vtclr (2) --- clear a rectangle on the screen            07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtclr (srow, scol, erow, ecol)
                 integer srow, scol, erow, ecol

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtclr'  is used to clear a rectangle on the users terminal.
                 The arguments are the starting row 'srow',  starting  column
                 'scol', ending row 'erow', and ending column 'ecol'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After  boundaries are checked and truncated (to 1 for values
                 less than 1, and MAXCOL and MAXROW for values  greater  than
                 their  respective  dimension)  a  small  loop  simply writes
                 sequences of blanks on the screen using 'vt$put'.


            _C_a_l_l_s

                 vt$put


            _S_e_e _A_l_s_o

                 other vt?* routines (2)



























            vtclr (2)                     - 1 -                     vtclr (2)


