

            take (1) --- take characters from a string (APL style)   03/20/80


            _U_s_a_g_e

                 take <length> <string>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Take'  can be used to extract substrings from the beginning
                 or end of a string.  It is essentially identical in function
                 to APL's dyadic take operator as applied to  character  vec-
                 tors.

                 The  absolute value of the first argument specifies the num-
                 ber of characters to be taken (with blank  padding,  if  the
                 source  string  is  not  long  enough.)   If it is positive,
                 characters are taken from the beginning of <string>;  other-
                 wise, characters are taken from the end of <string>.

                 Other  useful  string-handling commands are 'drop', 'index',
                 and 'substr'.


            _E_x_a_m_p_l_e_s

                 take 6 [filename]
                 take -2 [source_file]
                 take 2 [date]
                 take 3 [day]


            _S_e_e _A_l_s_o

                 drop (1), index (1), substr (1), stake (2), sdrop (2)

























            take (1)                      - 1 -                      take (1)


