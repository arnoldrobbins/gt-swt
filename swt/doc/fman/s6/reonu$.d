

            reonu$ (6) --- on-unit for the REENTER$ condition        02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine reonu$ (ptr)
                 pointer ptr

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Reonu$'  is called from the Primos condition mechanism when
                 the Primos internal command REN is given.  'Reonu$'  returns
                 to the caller who most recently declared 'reonu$' as its on-
                 unit for the "REENTER$" condition.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Using   information   passed  by  the  condition  mechanism,
                 'reonu$' finds the stack frame of the declarer  of  its  on-
                 unit and unwinds the stack with a call to the Primos routine
                 PL1$NL.


            _C_a_l_l_s

                 Primos pl1$nl


            _S_e_e _A_l_s_o

                 sys$$ (2)


























            reonu$ (6)                    - 1 -                    reonu$ (6)


