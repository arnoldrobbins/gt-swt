

            bugn (5) --- process the highest bug number              01/03/83


            _U_s_a_g_e

                 bugn [-i]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Bugn'  is  not intended to be user-invoked; rather, it is a
                 utility used by the 'bug'  command  to  aid  in  bug  report
                 generation.  It determines what the highest bug number is so
                 far;   if  the  optional  argument  "-i"  is  specified,  it
                 increments the bug number and replaces the old  highest  bug
                 number  with  the  new  one.   In either case, it prints the
                 resulting bug number on standard output.


            _E_x_a_m_p_l_e_s

                 << not to be invoked by the user >>


            _F_i_l_e_s

                 =bug=/$ to store the current highest bug number; use of  the
                      "-i" option causes this file to modified.


            _M_e_s_s_a_g_e_s

                 "Usage:  bugn ..."  for improper calling sequence


            _B_u_g_s

                 Will not handle more than 999 concurrent bug reports.


            _S_e_e _A_l_s_o

                 bug (3), raid (3)


















            bugn (5)                      - 1 -                      bugn (5)


