

            first$ (6) --- check for first call                      02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function first$ (flag)
                 integer flag

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'First$'  checks to see if this is the first call to itself.
                 If it is being called for the first time,  then  it  returns
                 YES;  otherwise, it returns NO.  'Flag' is set to the return
                 value, in either case.

                 'First$' is used by the 'swt'  command  to  prevent  further
                 calls to itself when a previous invocation is still active.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'First$'   checks   the   Subsystem   common  area  variable
                 'first_use' to see if it contains a  special  value;  if  it
                 doesn't,  then  a  YES is returned and this special value is
                 set.  If it finds the special value, then it returns NO.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 flag




























            first$ (6)                    - 1 -                    first$ (6)


