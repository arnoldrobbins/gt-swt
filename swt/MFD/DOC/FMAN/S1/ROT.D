

            rot (1) --- rotate or reverse strings from STDIN to STDOUT  03/20/80


            _U_s_a_g_e

                 rot [ [+ | -] <rotation> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rot' circularly rotates character strings found on standard
                 input  the number of positions specified by <rotation>, in a
                 manner  similar  to  the  APL  function   "reversal/rotate".
                 Specification  of  a  positive  <rotation>  will  rotate the
                 string  from  left  to  right  the  number   of   characters
                 specified.   If  <rotation>  is negative, the string will be
                 rotated from right-to-left.  When a  string  is  encountered
                 that is not as long as the absolute value of <rotation>, the
                 string  is  rotated  circularly  until the rotation count is
                 exhausted.

                 If <rotation> is not  specified,  the  strings  on  standard
                 input are reversed, as with the APL monadic function.


            _E_x_a_m_p_l_e_s

                 palindromes> rot
                 ar -t archive | rot -40 | sort | rot 40
                 rot 5


            _S_e_e _A_l_s_o

                 take (1), drop (1), iota (1), stake (2), sdrop (2)


























            rot (1)                       - 1 -                       rot (1)


