

            parstm (2) --- convert time-of-day to seconds past midnight  03/28/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function parstm (str, i, val)
                 character str (ARB)
                 integer i
                 long_int val

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Parstm' converts a standard textual time-of-day representa-
                 tion  into  the  number  of  seconds  since  midnight.   The
                 argument 'str' starting at position 'i' is assumed to be  an
                 EOS-terminated  string  containing  the  time-of-day  in the
                 format "<hours>[:<minutes>[:<seconds>]]['am'|'pm']".   'Val'
                 is  a long integer variable which receives the result of the
                 conversion.  The function return is  OK  if  the  conversion
                 succeeded, ERR otherwise.  As with most conversion routines,
                 the  position  argument 'i' is updated to point to the first
                 character in the input string that is  not  a  part  of  the
                 time-of-day.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Parstm' simply scans the string accumulating the components
                 of  the  time  as it goes, calculating 'val' in the process.
                 Errors occur if there is no leading digit  or  if  the  time
                 specified yields more than 86,400 seconds.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

                 ctoi, mapdn


            _B_u_g_s

                 Does  not  check  the time string for legality.  Behavior at
                 midnight and noon may not be correct.


            _S_e_e _A_l_s_o

                 parsdt (2)






            parstm (2)                    - 1 -                    parstm (2)


