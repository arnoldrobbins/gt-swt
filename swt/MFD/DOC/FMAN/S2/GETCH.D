

            getch (2) --- get a character from a file                03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function getch (c, fd)
                 character c
                 integer fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getch'  is  used to get a character from a file.  The first
                 argument is assigned the value of the character fetched; the
                 second argument is the file descriptor of  the  file  to  be
                 read.   If end-of-file occurs on the input file, the charac-
                 ter  returned  is  EOF.   The  function  return  is   always
                 identical to the first argument (character read or EOF).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getch'  calls  'getlin'  with  a  very short line buffer (1
                 character + EOS).  'Getlin' thus returns  one  character  in
                 the buffer, which becomes the value returned by 'getch'.  If
                 'getlin' returns EOF, 'getch' also returns EOF.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 c


            _C_a_l_l_s

                 getlin


            _S_e_e _A_l_s_o

                 getlin (2), putch (2)


















            getch (2)                     - 1 -                     getch (2)


