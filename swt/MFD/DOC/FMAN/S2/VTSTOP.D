

            vtstop (2) --- reset a user's terminal attributes        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtstop


          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtstop' resets terminal attributes when terminating the VTH
                 portion of a program.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtstop' first positions to the first column of the last row
                 on   the  user's  terminal.   'Vtstop'  then  retrieves  the
                 previous terminal  attributes  from  the  VTH  common  block
                 (where   they  are  saved  by  'vtinit')  and  restores  the
                 attributes by a call to the Primos routine DUPLX$.


            _C_a_l_l_s

                 vtmove, Primos duplx$


            _S_e_e _A_l_s_o

                 other vt?* routines (2)



























            vtstop (2)                    - 1 -                    vtstop (2)


