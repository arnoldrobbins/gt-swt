

            lscut (4) --- divide a linked string into two linked strings  02/25/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lscut (ptr1, pos, ptr2)
                 pointer ptr1, ptr2
                 integer pos

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The string specified by 'ptr1' is divided following position
                 'pos'.   The first half of the string is returned in 'ptr1',
                 and the second half is returned in 'ptr2' and as  the  value
                 of the function.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The string specified by 'ptr1' is positioned with 'lspos' to
                 position  'pos'.  A new string of length 1 is allocated, and
                 the character at position 'pos' is placed in the new string.
                 A pointer is placed in position 'pos'  to  the  new  string.
                 'Ptr2'  and  the  function are given the value of the string
                 position after position 'pos'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr1, ptr2


            _C_a_l_l_s

                 lsallo, lsgetc, lspos, lsputc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsjoin (4), lssubs (4)













            lscut (4)                     - 1 -                     lscut (4)


