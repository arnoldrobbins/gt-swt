

            lsjoin (4) --- join two linked strings                   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lsjoin (ptr1, ptr2)
                 pointer ptr1, ptr2

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The string specified by 'ptr2' is concatenated to the end of
                 the  string specified by 'ptr1'.  A pointer to the resulting
                 string is returned in 'ptr1'  and  as  the  function  value.
                 'Ptr2' ceases to be a valid pointer.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  string  specified  by  'ptr1' is positioned to its end.
                 Then the EOS character in the first string  is  replaced  by
                 'ptr2' + 300, thus linking the second string to the first.


            _C_a_l_l_s

                 lspos


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lscut (4), lsins (4)






















            lsjoin (4)                    - 1 -                    lsjoin (4)


