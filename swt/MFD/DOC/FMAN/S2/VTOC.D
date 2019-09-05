

            vtoc (2) --- convert PL/I varying string to EOS-terminated string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtoc (var, str, len)
                 integer var (ARB), len
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtoc'  is  used  to convert a PL/I character-varying string
                 into a standard Subsystem EOS-terminated string.  The  first
                 argument  is  the  character-varying string to be converted;
                 the second is a string to receive the result; the  third  is
                 the  maximum  length  of  the  result  string.  The function
                 return is the number of  characters  in  the  result  string
                 after the conversion.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtoc'  uses  the  standard Subsystem macro 'fpchar' to pull
                 characters from the PL/I string one at  a  time,  and  place
                 them in the result string.  Conversion stops when the result
                 string  fills  or when all the characters in the PL/I string
                 have been moved.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 other conversion routines ('cto?*' and '?*toc') (2)





















            vtoc (2)                      - 1 -                      vtoc (2)


