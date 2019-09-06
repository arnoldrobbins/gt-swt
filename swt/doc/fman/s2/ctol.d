

            ctol (2) --- convert ascii string to long integer        03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_int function ctol (str, i)
                 character str (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctol'  converts  the integer in ASCII character representa-
                 tion at position 'i' of the given string to  binary  format.
                 'I'  is  incremented to point to the position just after the
                 integer.  If the character at position 'i'  is  not  numeric
                 when  'ctol'  is  entered,  the  value zero is returned (the
                 exceptions are blanks and tabs; these characters are ignored
                 at the start of the number).  'Ctol' does  not  recognize  a
                 leading plus or minus sign.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctol'  scans  the  string,  using  the  argument 'i' as the
                 starting position.  Leading blanks and tabs are skipped.  If
                 a numeric is encountered, it  is  added  to  ten  times  the
                 current value of the integer, and the scan continues; other-
                 wise, 'ctol' exits with the desired value.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _S_e_e _A_l_s_o

                 ltoc  (2),  gltoc  (2), gctol (2), other conversion routines
                 ('cto?*' and '?*toc') (2)



















            ctol (2)                      - 1 -                      ctol (2)


