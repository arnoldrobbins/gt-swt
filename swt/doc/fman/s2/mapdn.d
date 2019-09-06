

            mapdn (2) --- fold character to lower case               03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function mapdn (c)
                 character c

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mapdn'  determines if the character passed as its parameter
                 is an upper case letter or not.  If not, the function return
                 is equal to the character; otherwise, the function return is
                 the value of the character mapped to lower case.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Mapdn' expects all upper case letters to be contiguous  and
                 arranged  in  a  collating  sequence  with capital A low and
                 capital   Z   high   (internal   ASCII    satisfies    these
                 requirements).  If the character lies between 'A'c and 'Z'c,
                 it is mapped to lower case by adding 'a'c - 'A'c.  The func-
                 tion  return  is  the  mapped  value.  The parameter is left
                 unchanged.


            _B_u_g_s

                 Depends heavily on ASCII character  code,  in  exchange  for
                 speed.


            _S_e_e _A_l_s_o

                 mapup (2), mapstr (2)






















            mapdn (2)                     - 1 -                     mapdn (2)


