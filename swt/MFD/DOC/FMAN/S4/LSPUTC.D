

            lsputc (4) --- put character into a linked string        02/23/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function lsputc (ptr, c)
                 pointer ptr
                 character c

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  character  in 'c' is placed in the next position of the
                 string specified by 'ptr'.  'Ptr' is then updated  to  point
                 to  the  next available position.  The function value is the
                 value of 'c', unless there is no more room  in  the  string.
                 In  this  case,  EOS  is  returned  and  the  pointer is not
                 updated.  If an EOS is put in the string before the end, the
                 remaining character positions are deallocated.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Pointers in the string are followed  until  a  character  is
                 found.   If  the character is not EOS, it is replaced by the
                 value of 'c' and 'ptr' is incremented.  If the value of  'c'
                 is  EOS,  'lsfree'  is  called to deallocate the rest of the
                 string.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr, c


            _C_a_l_l_s

                 lsfree


            _B_u_g_s

                 'Lsputc' should perhaps allocate more space if the receiving
                 string overflows.

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsgetc (4)








            lsputc (4)                    - 1 -                    lsputc (4)


