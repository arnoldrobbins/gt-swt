

            ctoa (2) --- convert character to address                01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_int function ctoa (str, i)
                 character str (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctoa'  converts  the address in ASCII character representa-
                 tion at position 'i' of the given string to  binary  format.
                 'I'  is  incremented to point to the position just after the
                 integer.  If the character at position 'i'  is  not  numeric
                 when  'ctoa'  is  entered,  the  value zero is returned (the
                 exceptions are blanks and tabs; these characters are ignored
                 at the start of the number).   'Ctoa'  recognizes  a  32-bit
                 address in the following format:
                 
                       [f]<ring>.<segment>.<word>
                 
                 The  presence  of  the character "f" at the beginning of the
                 address indicates that the pointer fault bit is to  be  set.
                 <Ring>,  <segment>,  and <word> are positive octal integers.
                 A bit number following the address is ignored, if present.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctoa' scans the string,  using  the  argument  'i'  as  the
                 starting  position.   Leading  blanks  and tabs are skipped.
                 The octal integers are  collected  with  'gctol'.   As  each
                 element  of  the  address  is collected, it is placed in the
                 proper bit positions of the long integer return value.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

                 gctol


            _B_u_g_s

                 Cannot return 48 bit indirect pointers.


            _S_e_e _A_l_s_o

                 atoc (2), other conversion routines  (?*toc  (2)  and  cto?*
                 (2))


            ctoa (2)                      - 1 -                      ctoa (2)


