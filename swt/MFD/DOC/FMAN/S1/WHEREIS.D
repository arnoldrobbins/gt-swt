

            whereis (1) --- find the location of a terminal          03/20/80


            _U_s_a_g_e

                 whereis [ - | <terminal number> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Whereis'  is  a  shell program that may be used to find the
                 location of a specific terminal.  The argument  may  be  the
                 line  number  of the terminal to be located or a single dash
                 (meaning "all terminals").

                 Terminal numbers appear under the column heading  "LINE"  in
                 the  output produced by the Subsystem's 'us' command (Primos
                 STATUS USERS command).


            _E_x_a_m_p_l_e_s

                 whereis 10
                 whereis -


            _F_i_l_e_s

                 =termlist= for terminal list


            _B_u_g_s

                 Dependence on the  fixed  terminal  list  means  that  inac-
                 curacies  will  occur  as  terminals  get  changed  or moved
                 around.


            _S_e_e _A_l_s_o

                 whois (1), us (1), term_type (1)




















            whereis (1)                   - 1 -                   whereis (1)


