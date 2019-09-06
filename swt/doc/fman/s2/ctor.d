

            ctor (2) --- character to real conversion                03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 real function ctor (str, i)
                 character str (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctor' is similar in function to 'ctoi', except that it con-
                 verts  floating  point  numbers  as  well  as integers.  The
                 character string in 'str' is examined starting  in  position
                 'i'.   Conversion stops when a character is encountered that
                 cannot correctly appear in the number.  'I'  is  updated  to
                 point  to  the first character not included in the converted
                 number.  The value returned by  the  function  is  the  real
                 (single precision) value of the character string.

                 The  number  in  'str' may contain a leading sign, a decimal
                 point, and an exponent.  A decimal point is not required.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctod' is called to convert  the  character  string  into  a
                 double  precision  value.  This value is converted to single
                 precision format and returned as the value of 'ctor'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

                 ctod


            _S_e_e _A_l_s_o

                 input (2), other conversion routines ('cto?*'  and  '?*toc')
                 (2)













            ctor (2)                      - 1 -                      ctor (2)


