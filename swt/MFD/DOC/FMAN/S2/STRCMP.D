

            strcmp (2) --- compare strings and return 1 2 or 3 for < = or >  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function strcmp (str1, str2)
                 character str1 (ARB), str2 (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Strcmp'  is  a  generalized string comparison routine.  The
                 two arguments are EOS-terminated strings to be compared; the
                 function return is 1 if 'str1' is less than 'str2'  (accord-
                 ing  to  the  ordering  of ASCII characters), 2 if 'str1' is
                 equal to 'str2', and 3 if 'str1' is greater than 'str2'.

                 If one string is a proper initial substring  of  the  other,
                 the longer string is always found to be greater.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Character-at-a-time   comparison   loop.    Function  return
                 depends on which string hit EOS first, or on ASCII  ordering
                 of character codes.


            _S_e_e _A_l_s_o

                 equal (2), length (2)




























            strcmp (2)                    - 1 -                    strcmp (2)


