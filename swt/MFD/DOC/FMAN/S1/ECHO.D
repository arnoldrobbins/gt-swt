

            echo (1) --- echo arguments                              03/20/80


            _U_s_a_g_e

                 echo { <arbitrary string> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Echo'  simply prints its arguments, separated by blanks, on
                 standard  output.    It   is   frequently   used   to   make
                 announcements from shell programs or to quickly produce very
                 short  data  files.   If  no arguments are specified, 'echo'
                 produces no output whatsoever.

                 Before printing them, 'echo' scans its  arguments  for  "@t"
                 and  "@n"  character sequences and converts them to tabs and
                 newlines, respectively.


            _E_x_a_m_p_l_e_s

                 echo "split@nthis@nline"
                 echo "Good morning"


            _S_e_e _A_l_s_o

                 error (1)































            echo (1)                      - 1 -                      echo (1)


