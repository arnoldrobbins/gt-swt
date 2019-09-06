

            ctoc (2) --- convert EOS-terminated string to EOS-terminated string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ctoc (from, to, len)
                 integer len
                 character from (ARB), to (len)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctoc'  copies  an  EOS-terminated  unpacked string from one
                 array to another, observing a maximum-length  constraint  on
                 the destination array.  The function return is the number of
                 characters  copied  (i.e.,  the  length of the string in the
                 parameter 'to').

                 Note that the other string copy  routine,  'scopy',  is  not
                 protected;  if  the  length of the source string exceeds the
                 space available in the destination string, some  portion  of
                 memory will be garbled.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A simple loop copies characters from 'from' to 'to' until an
                 EOS  is  encountered  or  all  the  space  available  in the
                 destination array is used up.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 to


            _S_e_e _A_l_s_o

                 scopy (2), other conversion routines ('cto?*'  and  '?*toc')
                 (2)



















            ctoc (2)                      - 1 -                      ctoc (2)


