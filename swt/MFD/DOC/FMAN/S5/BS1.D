

            bs1 (5) --- shell backstop program                       01/03/83


            _U_s_a_g_e

                 bs1


            _D_e_s_c_r_i_p_t_i_o_n

                 'Bs1' is a shell file that executes the program 'guess' when
                 a  command  is  not  found  in  a  user's search rule.  This
                 program is identical to 'bs' except that  it  calls  'guess'
                 with  an  argument of "1" for <maxcost>.  This significantly
                 reduces the search time, but restricts the set  of  commands
                 that 'guess' will consider.


            _E_x_a_m_p_l_e_s

                 <<'bs1' should not normally be run from command level>>


            _B_u_g_s

                 Because  of  search rule problems, 'bs1' will fail if a user
                 does not have the current directory in his search rule.

                 Locally supported.


            _S_e_e _A_l_s_o

                 bs (5), guess (5), mkclist (3)



























            bs1 (5)                       - 1 -                       bs1 (5)


