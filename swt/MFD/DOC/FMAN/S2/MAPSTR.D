

            mapstr (2) --- map case of a string                      01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mapstr (str, case)
                 character str (ARB)
                 integer case

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mapstr'  is  used  to  map the case of all the letters in a
                 string.  'Str' is the string to be mapped; 'case'  is  UPPER
                 if letters are to be mapped to upper case, anything else for
                 lower case (usually LOWER).

                 The  length  of  the  string  is  returned as the function's
                 value.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A loop is used to examine each character in the string;  the
                 actual   mapping  is  done  by  adding  or  subtracting  the
                 difference between ASCII 'a' and ASCII 'A'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 mapup (2), mapdn (2), tlit (1)























            mapstr (2)                    - 1 -                    mapstr (2)


