

            ltoc (2) --- convert long integer to character string    03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ltoc (int, str, size)
                 long_int int
                 integer size
                 character str (size)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ltoc' is used to convert long integers to decimal character
                 representation.

                 'Int'  is  the  long  integer  to be converted; 'str' is the
                 string to receive the ASCII representation;  'size'  is  the
                 size of 'str'.  The function return is the number of charac-
                 ters required to represent 'int'.

                 'Ltoc' duplicates the function of 'itoc' for long integers.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Standard  modular-arithmetic  conversion.   See  'itoc'  for
                 details.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 other conversion routines ('cto?*' and '?*toc') (2)





















            ltoc (2)                      - 1 -                      ltoc (2)


