

            ctod (2) --- convert string to double precision real     01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_real function ctod (str, i)
                 character str (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctod'  converts  the  character  string in the array 'str',
                 starting at position 'i', to double precision floating point
                 representation and returns this value as the result  of  the
                 function.   The  variable  'i' is incremented to a point one
                 character beyond the string that was  converted;  the  array
                 'str'  is  not  modified.   'Str'  must be an EOS-terminated
                 unpacked character string.

                 'Ctod' recognizes any valid Fortran constant; in particular,
                 leading signs are handled.   Leading  blanks  and  tabs  are
                 ignored.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctod'  accumulates  the integer and fractional parts of the
                 number, throwing away leading zeros and insignificant digits
                 and computing scaling factors if necessary.  A  straightfor-
                 ward  Horner's  method conversion translates each portion of
                 the constant to binary, and finally all  portions  are  com-
                 bined  and  appropriately scaled.  Scaling is aided by using
                 tables of  powers-of-two  exponents,  to  preserve  as  much
                 accuracy as possible.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

                 gctoi


            _S_e_e _A_l_s_o

                 dtoc  (2),  ctor  (2),  rtoc  (2), other conversion routines
                 ('cto?*' and '?*toc') (2)








            ctod (2)                      - 1 -                      ctod (2)


