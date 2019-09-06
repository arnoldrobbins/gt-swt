

            cd (1) --- change home directory                         03/25/82


            _U_s_a_g_e

                 cd [-p] [ <pathname> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cd'  changes  the  current  working  directory.  <Pathname>
                 gives the pathname of the target directory; if no  arguments
                 are present, the user's login directory is assumed.

                 If "-p" is given as the first argument, 'cd' prints on stan-
                 dard  output the full pathname of the directory specified as
                 the second argument.  If there is no  second  argument,  the
                 full  pathname  of  the  current  directory  is printed.  In
                 neither case is the current working directory changed.


            _E_x_a_m_p_l_e_s

                 cd
                 cd =extra=/fmacro
                 cd subdir
                 cd -p
                 cd -p =src=


            _M_e_s_s_a_g_e_s

                 "bad pathname" when an invalid pathname is specified.


            _S_e_e _A_l_s_o

                 mkdir (1), Primos atch$$, Primos gpath$, gcdir$ (6)























            cd (1)                        - 1 -                        cd (1)


