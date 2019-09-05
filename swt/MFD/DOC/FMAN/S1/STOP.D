

            stop (1) --- exit from subsystem                         03/20/80


            _U_s_a_g_e

                 stop [- | <pathname>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Stop'  is  used  to exit from the Software Tools Subsystem.
                 If no option is specified, the user's profile is saved and a
                 normal  exit  to  Primos  occurs.   If  the  "-"  option  is
                 specified,  the  user's profile is saved and logout from the
                 Prime is forced.  If a pathname is  given,  then  the  given
                 file  is  deleted  before  logout  is  forced and the user's
                 profile is not saved.  This is used in conjunction with  the
                 'ph' command to log out phantoms.


            _E_x_a_m_p_l_e_s

                 stop
                 stop -
                 stop =varsdir=/ph00301


            _S_e_e _A_l_s_o

                 bye (1), ph (1), Primos logo$$































            stop (1)                      - 1 -                      stop (1)


