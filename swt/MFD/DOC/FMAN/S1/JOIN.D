

            join (1) --- replace newlines with an arbitrary string   02/22/82


            _U_s_a_g_e

                 join [ <delimiter> ] [ -l<nlines> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Join' reads its first standard input, replaces all NEWLINEs
                 with  the  <delimiter>  string, and writes the result on its
                 first standard output.   The  <delimiter>  argument  may  be
                 specified  as  any  arbitrary  string.   If it is omitted, a
                 single blank is assumed.  If the "-l<nlines>"  construct  is
                 specified,  a maximum of <nlines> input lines will be joined
                 into each output line.


            _E_x_a_m_p_l_e_s

                 files .r | join -l10 | change % "ar -u arch " | sh
                 file1> join "|" >file2






































            join (1)                      - 1 -                      join (1)


