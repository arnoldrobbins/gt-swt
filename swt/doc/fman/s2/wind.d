

            wind (2) --- position to end of file                     03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function wind (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Wind'  (pronounced  w-eye-nd)  is the opposite of 'rewind':
                 it positions a file's pointer to the end of the file, rather
                 than the beginning.  The argument is the file descriptor  of
                 the file to be wound.  The function return is OK if the wind
                 was successful, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Wind'  calls  'seekf'  with  an  extremely  large  position
                 argument, thus setting the file pointer to EOF.  The  return
                 value is whatever 'seekf' returns.


            _C_a_l_l_s

                 seekf


            _S_e_e _A_l_s_o

                 rewind (2), trunc (2), seekf (2)


























            wind (2)                      - 1 -                      wind (2)


