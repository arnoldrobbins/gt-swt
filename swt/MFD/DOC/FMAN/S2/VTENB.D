

            vtenb (2) --- enable input on a particular screen line   07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtenb (row, column, length)
                 integer row, column, length

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtenb'  enables  input in a field with a particular length,
                 starting at the given (row,  column)  on  the  screen.   Any
                 areas  of  the screen that are not enabled by 'vtenb' cannot
                 be used for entry of data; therefore 'vtenb' must be  called
                 before 'vtread' can be used.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Row'  is  checked  as  being  on the screen, and if not, an
                 immediate return is executed and input  is  not  enabled  at
                 that  location.   'Column' and 'length' are checked as being
                 on the screen, and if the values  specified  "run  off"  the
                 screen, the length is truncated to the border of the screen.
                 Input is then enabled starting at (row, column) for 'length'
                 characters, or to the border of the screen.


            _B_u_g_s

                 Allows only one input area per line.


            _S_e_e _A_l_s_o

                 other vt?* routines (2)






















            vtenb (2)                     - 1 -                     vtenb (2)


