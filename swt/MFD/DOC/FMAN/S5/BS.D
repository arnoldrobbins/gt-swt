

            bs (5) --- shell backstop program                        02/25/82


            _U_s_a_g_e

                 bs


            _D_e_s_c_r_i_p_t_i_o_n

                 'Bs'  is a shell file that executes the program 'guess' when
                 a command is not found in a user's search rule.  'Guess'  is
                 a  program  that tries to find a command "close" to one that
                 was mistyped.  This shell file may be added to the end of  a
                 user's  search  rule  so  that  it can aid a fumble-fingered
                 typist.


            _E_x_a_m_p_l_e_s

                 <<'bs' should not normally be run from command level>>


            _B_u_g_s

                 Because of search rule problems, 'bs' will fail  if  a  user
                 does not have the current directory in his search rule.

                 Locally supported.


            _S_e_e _A_l_s_o

                 bs1 (5), guess (5), mkclist (3)



























            bs (5)                        - 1 -                        bs (5)


