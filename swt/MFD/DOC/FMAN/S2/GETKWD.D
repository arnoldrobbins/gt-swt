

            getkwd (2) --- look for keyword/value arguments          03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getkwd (keyword, value, length, default)
                 character keyword (ARB), value (ARB), default (ARB)
                 integer length

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getkwd' searches the list of arguments supplied on the com-
                 mand  line  for  a  string  that  matches  the  contents  of
                 'keyword'.  'Keyword' must contain an EOS-terminated string.
                 If a matching argument is found, the  argument  string  that
                 immediately  follows  it in the argument list is returned in
                 the  array  'value';  otherwise,  the  string  contained  in
                 'default'  is  copied  into  'value'.   In  either case, the
                 length of the string returned in 'value' (excluding EOS)  is
                 returned  as the result of the function.  'Length' gives the
                 size of the 'value' array in words; no more than  'length'-1
                 characters will be copied.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getarg'  is  called  to  access  each  successive  argument
                 string.  Each is compared to the supplied keyword, and if  a
                 match  is  found,  'getarg'  is called again to retrieve the
                 immediately following argument.  If  that  argument  doesn't
                 exist or if the keyword is not found, as much of the default
                 string  as  will  fit  is copied into the 'value' array, one
                 character at a time.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 value


            _C_a_l_l_s

                 equal, getarg


            _S_e_e _A_l_s_o

                 chkarg (2), getarg (2)










            getkwd (2)                    - 1 -                    getkwd (2)


