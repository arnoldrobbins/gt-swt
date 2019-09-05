

            ttyp$r (6) --- return the terminal type from the common area  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ttyp$r (ttype)
                 character ttype (MAXTERMTYPE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ttyp$r'  retrieves  the  name of the terminal from the Sub-
                 system common area, if it has been  previously  set.   If  a
                 valid name is found, the function returns YES; otherwise, it
                 returns NO.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ttyp$r'  calls 'chkstr' to see if a valid terminal name has
                 been set in  the  Subsystem  common  area.   If  an  invalid
                 terminal  name  has been set, it clears the name and returns
                 NO; otherwise, it copies the name  to  'ttype'  and  returns
                 YES.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ttype


            _C_a_l_l_s

                 chkstr, ctoc


            _S_e_e _A_l_s_o

                 term (1), term_type (1), other ttyp$?* routines (6)




















            ttyp$r (6)                    - 1 -                    ttyp$r (6)


