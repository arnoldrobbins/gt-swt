

            atoc (2) --- convert an address to a string              01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function atoc (ptr, str, size)
                 integer ptr (3), size
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Atoc' converts the 2 or 3 word 64V mode indirect pointer in
                 the  address  'ptr'  to a printable EOS-terminated string in
                 'str'.  No more  than  'size'  elements  of  'str'  will  be
                 modified, including the trailing EOS.

                 The pointer is converted into the format
                 
                    [f]<ring>.<segment>.<word>[.<bit>]
                 
                 <Ring>,  <segment>,  and <word> are positive octal integers.
                 The character "f" is present only if the fault  bit  in  the
                 pointer  is set, and <bit> is included only if the extension
                 bit is set.

                 The  function  return  is  the  number  characters  used  to
                 represent the address (the length of 'str').


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Bits  are removed from the indirect pointer and converted to
                 character representation with calls to 'gitoc' in a straigh-
                 tforward manner.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 gitoc, ctoc


            _S_e_e _A_l_s_o

                 atoc (2), other conversion routines (?*toc (2), cto?* (2))









            atoc (2)                      - 1 -                      atoc (2)


