

            tgetl$ (6) --- read a line from the terminal             03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function tgetl$ (buf, size, f)
                 character buf (ARB)
                 integer size
                 file_des f

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Tgetl$'  is  the device-dependent driver for terminal line-
                 image i/o.  The first argument is a string  to  receive  the
                 line  read;  the  second  argument  is the maximum number of
                 characters to be placed in the string; the third argument is
                 the file descriptor of a terminal file.  The function return
                 is either zero (when EOF is detected) or the length  of  the
                 string read in.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tgetl$'  first  checks  to  see  if  the terminal buffer is
                 empty.  If it is, then 'tcook$'  is  called  to  refill  the
                 buffer.  The characters in the terminal buffer are copied to
                 the  user  buffer  'buf' until either 'size' characters have
                 been copied or the terminal buffer has been exhausted.   The
                 return  value  is  the number of characters that were copied
                 into 'buf'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 buf


            _C_a_l_l_s

                 tcook$


            _S_e_e _A_l_s_o

                 getlin (2), tputl$ (6), tcook$ (6)













            tgetl$ (6)                    - 1 -                    tgetl$ (6)


