

            lscmpk (4) --- compare linked string with contiguous string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function lscmpk (ptr, str)
                 pointer ptr
                 character str (ARB)

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  linked  string  specified  by  'ptr' and the contiguous
                 string in 'str' are compared on the basis of ASCII collating
                 sequence.  Depending upon the relation that the first string
                 has to the second, a function value of '>'c, '='c,  or  '<'c
                 is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Characters  are  extracted  from  the  linked  string  using
                 'lsgetc' and compared with their corresponding  elements  in
                 'str'  until  two  unequal  characters  are  seen  or an EOS
                 character  is  encountered.   The  value  returned  is  then
                 decided from these two characters:  if one of the characters
                 is  EOS, the longer string is considered greater; if both of
                 the characters are EOS, the strings are considered equal; if
                 neither character  is  EOS,  the  string  with  the  largest
                 character is considered greater.


            _C_a_l_l_s

                 lsgetc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lscomp (4)














            lscmpk (4)                    - 1 -                    lscmpk (4)


