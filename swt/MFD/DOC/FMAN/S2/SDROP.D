

            sdrop (2) --- drop characters from a string APL-style    03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function sdrop (from, to, length)
                 character from (ARB), to (ARB)
                 integer length

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Sdrop'  copies  all but 'length' characters from the 'from'
                 string into the 'to' string and returns as  its  result  the
                 number  of  characters copied.  If 'length' is positive, the
                 omitted characters are relative  to  the  beginning  of  the
                 'from'  string;  if it is negative, they are relative to the
                 end of the string.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 to


            _C_a_l_l_s

                 ctoc, length, scopy


            _S_e_e _A_l_s_o

                 stake (2), index (2), substr (2), drop (1)


























            sdrop (2)                     - 1 -                     sdrop (2)


