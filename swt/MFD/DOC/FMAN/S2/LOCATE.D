

            locate (2) --- look for character in character class     05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function locate (c, pat, offset)
                 character c, pat (MAXPAT)
                 integer offset

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Locate'  returns  YES  if  'c' is a member of the character
                 class at 'pat(offset)', NO otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A character class is stored as a size, followed by a  vector
                 of  characters in the class.  'Locate' simply checks all the
                 characters in the vector;  if  'c'  matches  one,  then  the
                 return value is YES.


            _S_e_e _A_l_s_o

                 makpat (2), omatch (2), amatch (2)
































            locate (2)                    - 1 -                    locate (2)


