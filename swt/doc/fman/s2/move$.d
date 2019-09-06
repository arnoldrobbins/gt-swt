

            move$ (2) --- move blocks of memory around quickly       03/28/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine move$ (from, to, count)
                 integer from (ARB), to (ARB), count

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Move$'  is  the  fastest way known to move a block of words
                 from one place to another in memory.  The argument 'from' is
                 an array of words to be moved; 'to' is an array to receive a
                 copy of the words in 'from'; 'count' is the number of  words
                 to be moved.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Move$'  is  written  in  PMA,  and uses multi-word load and
                 store instructions to move as much data as  possible  during
                 each iteration of a loop.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 to


            _S_e_e _A_l_s_o

                 scopy (2)


























            move$ (2)                     - 1 -                     move$ (2)


