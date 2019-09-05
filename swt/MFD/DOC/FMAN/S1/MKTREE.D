

            mktree (1) --- convert pathname to treename              03/25/82


            _U_s_a_g_e

                 mktree  { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mktree'  converts  Subsystem pathnames into standard Primos
                 treenames.  If arguments are supplied, each  is  interpreted
                 as a pathname and the results of conversion are printed (one
                 per line) on standard output.  If no arguments are supplied,
                 pathnames  are read (one per line) from standard input until
                 EOF, with the conversion results again being printed one per
                 line on standard output.


            _E_x_a_m_p_l_e_s

                 mktree //bozo/file
                 x spool [mktree [arg 1]]


            _S_e_e _A_l_s_o

                 mktr$ (6), mkpa$ (2)

































            mktree (1)                    - 1 -                    mktree (1)


