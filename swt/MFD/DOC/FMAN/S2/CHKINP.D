

            chkinp (2) --- check for terminal input availability     03/24/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function chkinp (flag)
                 logical flag

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Chkinp' returns the value ".true."  if there are characters
                 waiting  to  be  read in the user's terminal buffer.  Other-
                 wise, 'chkinp' returns ".false.".


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Chkinp'  enters  64R  addressing  mode  and  executes   the
                 instruction
                 
                       SKS '704
                 
                 (which  is  trapped  and  interpreted  by  Primos).   If the
                 instruction skips, 'chkinp' reenters 64V  mode  and  returns
                 ".true.".   Otherwise,  it  reenters  64V  mode  and returns
                 ".false.".


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 flag



























            chkinp (2)                    - 1 -                    chkinp (2)


