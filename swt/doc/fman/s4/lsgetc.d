

            lsgetc (4) --- get character from linked string          03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function lsgetc (ptr, c)
                 pointer ptr
                 character c

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  first  character  in  the  string specified by 'ptr' is
                 extracted and returned in 'c' and  as  the  function  value.
                 'Ptr'  is  updated  to  point  to  the next character in the
                 string, but is never advanced beyond the EOS.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Any pointers in the string are followed until a character is
                 found.  The character becomes the value of the function.  If
                 the character was not EOS, 'ptr'  is  incremented,  and  any
                 pointers in the string are followed until the next character
                 is found.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr, c


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsputc (4)



















            lsgetc (4)                    - 1 -                    lsgetc (4)


