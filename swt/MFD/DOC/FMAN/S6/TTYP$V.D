

            ttyp$v (6) --- set terminal attributes                   01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ttyp$v (ttype)
                 character ttype (MAXTERMTYPE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ttyp$v'  takes  the terminal type name given in 'ttype' and
                 tries to set the values of that terminal's attributes in the
                 Subsystem common area.  If the terminal type is not a  legal
                 one,  then  'ttyp$v' returns NO and leaves the values of the
                 terminal attributes undisturbed; otherwise, it sets  up  the
                 appropriate values and returns YES.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ttyp$v'  takes the terminal type given in 'ttype' and tries
                 to   find   it   in   the   file    "=ttypes="    (nominally
                 "//extra/terms").  If the file could not be opened or if the
                 terminal type wasn't found in the file, 'ttyp$v' returns NO;
                 otherwise,  it  sets  the value of the terminal's attributes
                 from values given in the file and returns a value of YES.


            _C_a_l_l_s

                 close, ctoc, equal, input, open, Primos break$


            _S_e_e _A_l_s_o

                 other ttyp$?* routines (2)






















            ttyp$v (6)                    - 1 -                    ttyp$v (6)


