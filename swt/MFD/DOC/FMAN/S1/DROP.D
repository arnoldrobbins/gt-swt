

            drop (1) --- drop characters from a string (APL-style)   03/20/80


            _U_s_a_g_e

                 drop ( <length> | -<length> )  <string>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Drop'   performs  the  function  of  the  APL  dyadic  drop
                 operator.  The absolute value of the first argument  is  the
                 number  of  characters  to  be  dropped.   If  the number is
                 positive, they are dropped from the front of the string;  if
                 negative,  they are dropped from the end of the string.  The
                 result is printed on standard output one.

                 If more characters are dropped than exist in the  string,  a
                 null string is printed.


            _E_x_a_m_p_l_e_s

                 drop 2 [filename]
                 cat [drop -2 source]


            _S_e_e _A_l_s_o

                 take (1), substr (1), stake (2), sdrop (2), substr (2)































            drop (1)                      - 1 -                      drop (1)


