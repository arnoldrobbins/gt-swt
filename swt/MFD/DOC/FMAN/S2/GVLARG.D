

            gvlarg (2) --- obtain the value of a key-letter argument  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gvlarg (str, state)
                 character str (ARB)
                 integer state (4)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gvlarg'  returns  the  next  argument and updates the state
                 vector; it is normally used in conjunction with 'gklarg' and
                 'gfnarg'.  If  the  next  argument  begins  with  a  hyphen,
                 'gvlarg'  returns  an empty string.  'Gvlarg' returns EOF if
                 the argument list has been exhausted; otherwise  it  returns
                 OK.

                 'Gvlarg'  exists  solely  to hide the structure of the state
                 vector when an argument must be  fetched  between  calls  to
                 'gklarg' and 'gfnarg'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Trivial.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str, state


            _C_a_l_l_s

                 error, getarg


            _S_e_e _A_l_s_o

                 gfnarg (2), gklarg (2)

















            gvlarg (2)                    - 1 -                    gvlarg (2)


