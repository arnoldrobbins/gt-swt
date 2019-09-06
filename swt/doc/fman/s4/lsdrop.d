

            lsdrop (4) --- drop characters from a linked string      01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lsdrop (ptr, len)
                 pointer ptr
                 integer len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  value of the function is a pointer to a string contain-
                 ing all  but  the  first  'len'  characters  of  the  string
                 specified by 'ptr'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Lspos' is called to position the string to position 'len' +
                 1.   'Lscopy'  is  then  called to copy the remainder into a
                 newly allocated string, a pointer to which  is  returned  as
                 the function value.


            _C_a_l_l_s

                 lscopy


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsdel (4), lssubs (4), lstake (4)





















            lsdrop (4)                    - 1 -                    lsdrop (4)


