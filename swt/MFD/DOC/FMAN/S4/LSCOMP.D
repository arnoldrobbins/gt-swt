

            lscomp (4) --- compare two linked strings                02/23/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function lscomp (ptr1, ptr2)
                 pointer ptr1, ptr2

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  linked  strings specified by 'ptr1' and 'ptr2' are com-
          |      pared on the basis of ASCII collating sequence.   The  value
          |      of  the  function is '>'c, '='c, or '<'c, depending upon the
                 relation that the first string has to the second.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Characters are extracted from  the  strings  using  'lsgetc'
                 until  two  unequal characters are found or an EOS character
                 is seen.  The returned value is then decided from these  two
                 characters:   if  one  of  the characters is EOS, the longer
                 string is considered greater; if both of the characters  are
                 EOS,  the strings are considered equal; if neither character
                 is EOS, the string with the larger character  is  considered
                 greater.


            _C_a_l_l_s

                 lsgetc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lscmpk (4)

















            lscomp (4)                    - 1 -                    lscomp (4)


