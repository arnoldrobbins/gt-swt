

            length (1) --- compute length of strings                 02/22/82


            _U_s_a_g_e

                 length  [ <string> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Length' may be used to determine the length (in characters)
                 of  a  string  or of all the lines in standard input.  If an
                 argument is specified on the command  line,  its  length  is
                 printed  on 'length's first standard output port; otherwise,
                 lines are read from the first standard input port until end-
                 of-file,  with  the  length  of  each  being  printed  after
                 reading.   When  lines  are  taken  from standard input, the
                 NEWLINE at the end of each  line  is  not  included  in  the
                 printed length.


            _E_x_a_m_p_l_e_s

                 length [login_name]
                 lf -c | length | stats -hlq


            _S_e_e _A_l_s_o

                 substr  (1), take (1), drop (1), rot (1), length (2), substr
                 (2), stake (2), sdrop (2)






























            length (1)                    - 1 -                    length (1)


