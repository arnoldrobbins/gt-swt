

            lsputf (4) --- write an arbitrarily long linked string   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsputf (ptr, fd)
                 pointer ptr
                 file_des fd

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  linked string specified by 'ptr' is written to the file
                 described by 'fd'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A section of the string no more than MAXLINE  characters  in
                 length  is  extracted using 'lsextr' and written to the file
                 with 'putlin'.  The section just extracted is  skipped  over
                 with a call to 'lspos' and the process is repeated until the
                 EOS is encountered.


            _C_a_l_l_s

                 lsextr, lspos, putlin


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsgetf (4)





















            lsputf (4)                    - 1 -                    lsputf (4)


