

            tputl$ (6) --- put a line on the terminal                01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function tputl$ (line, fd)
                 character line (ARB)
                 integer fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Tputl$'  is  the device-dependent driver called by 'putlin'
                 to write a string on a terminal file.  The first argument is
                 the string to be written; the second is the file  descriptor
                 of  a terminal file.  The function return is OK if the write
                 was successful, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tputl$' buffers each character in the string into  a  local
                 buffer,  and  outputs the string in chunks (via calls to the
                 Primos routine  TNOUA).   If  case  mapping  is  in  effect,
                 characters not on a KSR 33 keyboard are converted to escaped
                 representations which are printable on a KSR 33.


            _C_a_l_l_s

                 Primos tnoua


            _S_e_e _A_l_s_o

                 tgetl$ (6), dputl$ (6), putlin (2)























            tputl$ (6)                    - 1 -                    tputl$ (6)


