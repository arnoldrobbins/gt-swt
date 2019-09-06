

            then (1) --- introduce the then-part of a conditional    03/20/80


            _U_s_a_g_e

                 if [ <value> ]
                    then
                       { <command> }
                    else
                       { <command> }
                 fi


            _D_e_s_c_r_i_p_t_i_o_n

                 'Then' is a do-nothing command that may be used to introduce
                 the  "affirmative"  or  "asserted"  part  of  a  conditional
                 statement.  It  is  available  solely  for  the  purpose  of
                 improving  the  appearance of conditional statements in com-
                 mand files, and is always optional.


            _E_x_a_m_p_l_e_s

                 if [nargs]
                    then
                       set file = [arg 1 | quote]
                 fi


            _S_e_e _A_l_s_o

                 if (1), else (1), fi (1), case (1)




























            then (1)                      - 1 -                      then (1)


