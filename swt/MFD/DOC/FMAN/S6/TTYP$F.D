

            ttyp$f (6) --- obtain the user's terminal type           03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ttyp$f (ttype)
                 character ttype (MAXTERMTYPE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ttyp$f' looks in the file "=termlist=" to see if a terminal
                 type  is  defined  for  the  user's terminal line.  'Ttyp$f'
                 returns a character string which is the name of  the  user's
                 terminal  type  in  'ttype'.   It  returns  YES  if it could
                 determine the terminal type, and NO otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ttyp$f' tries to find the terminal name from  the  terminal
                 list file in "=termlist=" (nominally "//extra/terms"); if it
                 can  find it, it returns the name found, sets the associated
                 terminal attribute values in the Subsystem common area,  and
                 returns  YES.   If the terminal name could not be determined
                 from the "=termlist=" file, it returns NO.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ttype


            _C_a_l_l_s

                 ctoi, close, date, getlin, open, ttyp$v


            _S_e_e _A_l_s_o

                 term_type (1), other ttyp$?* routines (6)


















            ttyp$f (6)                    - 1 -                    ttyp$f (6)


