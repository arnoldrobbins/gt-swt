

            lssubs (4) --- take a substring of a linked string       03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lssubs (ptr, pos, len)
                 pointer ptr
                 integer pos, len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  value of the function is a pointer to a string contain-
                 ing 'len' characters from the  string  specified  by  'ptr',
                 starting at position 'pos'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A  new  string  of  length  'len'  is  allocated, the string
                 specified by 'ptr' is positioned to 'pos', and 'len' charac-
                 ters are then  copied  to  the  new  string  with  calls  to
                 'lsgetc' and 'lsputc'.


            _C_a_l_l_s

                 lsallo, lsgetc, lslen, lspos, lsputc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lscut (4), lsdel (4), lsdrop (4), lstake (4)





















            lssubs (4)                    - 1 -                    lssubs (4)


