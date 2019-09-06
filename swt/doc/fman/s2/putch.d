

            putch (2) --- put a character on a file                  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function putch (c, fd)
                 character c
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Putch'  places  the  character 'c' on the file specified by
                 file descriptor 'fd'.   If  the  attempt  succeeds,  'putch'
                 returns OK; otherwise, it returns ERR.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Putch'  creates  an  internal buffer of two characters, the
                 first being the argument 'c' and the second  being  an  EOS.
                 This  buffer  is  written on the specified file by a call to
                 'putlin'.


            _C_a_l_l_s

                 putlin


            _S_e_e _A_l_s_o

                 putlin (2), getch (2)


























            putch (2)                     - 1 -                     putch (2)


