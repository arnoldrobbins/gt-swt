

            iota (1) --- generate vector of integers                 03/20/80


            _U_s_a_g_e

                 iota [<lower_limit>] <upper_limit> [-f <format>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Iota'  is derived from the monadic APL operator of the same
                 name; it prints a series of consecutive integers on standard
                 output.   The  <upper_limit>  and   optional   <lower_limit>
                 arguments  specify the range of integers to be printed.  The
                 default <lower_limit> is one.

                 The <format> argument is a standard format string, identical
                 to that accepted  by  'encode'  or  'print'.   Its  presence
                 allows  the user to select fill characters, field width, and
                 other parameters associated with the printing of integers.


            _E_x_a_m_p_l_e_s

                 iota 10
                 stack(i)
                 iota [most_recent] 1
                 iota -5 5 -f "*4,-16,0i"


            _M_e_s_s_a_g_e_s

                 "Usage:  iota ..."  for invalid argument syntax.


            _B_u_g_s

                 If sharp signs ("#") are  included  in  the  format  string,
                 'iota' will die of a pointer fault in 'encode'.


            _S_e_e _A_l_s_o

                 parscl (2), encode (2), print (2)

















            iota (1)                      - 1 -                      iota (1)


