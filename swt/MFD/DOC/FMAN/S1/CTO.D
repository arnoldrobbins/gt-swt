

            cto (1) --- copy STDIN to STDOUT up to a sentinel        03/20/80


            _U_s_a_g_e

                 cto [ <string> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cto'  copies its first standard input to its first standard
                 output, terminating either at  end  of  file  or  the  first
                 occurrence of <string>.  In order to be recognized, <string>
                 must  appear  on a line by itself.  This termination line is
                 not copied.  If no argument is specified, <string>  defaults
                 to "-EOF".

                 'Cto' is useful in shell files for terminating programs that
                 read  from  the command stream.  It is virtually a necessity
                 for generating end-of-file on terminals that cannot generate
                 a control-c character.


            _E_x_a_m_p_l_e_s

                 >> cto | x
                 paron file1 file2
                 delete file1
                 -EOF


            _S_e_e _A_l_s_o

                 cat (1), copy (1), slice (1)



























            cto (1)                       - 1 -                       cto (1)


