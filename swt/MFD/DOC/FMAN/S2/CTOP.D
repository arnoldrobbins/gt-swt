

            ctop (2) --- convert EOS-terminated string to packed string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ctop (str, i, pstr, len)
                 character str (ARB)
                 integer i, len
                 packed_char pstr (len)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctop'   converts  the  EOS-terminated  unpacked  string  in
                 argument 'str', starting at position 'i', to packed  integer
                 form  in  the  array  'pstr'.   The argument 'len' gives the
                 maximum length of the array 'pstr'; no more than 'len' words
                 of this array will be modified by 'ctop'.  After conversion,
                 'i' points to the EOS at the end of 'str', or  one  position
                 past  the  last  character  packed  if the maximum length of
                 'pstr' is exceeded.

                 The function return is the number of characters  transferred
                 from 'str' to 'pstr'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ctop'  picks  up successive characters from 'str' and packs
                 them into 'pstr' with the standard Subsystem macro 'spchar'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, pstr


            _S_e_e _A_l_s_o

                 ptoc (2), other conversion routines  ('cto?*'  and  '?*toc')
                 (2)


















            ctop (2)                      - 1 -                      ctop (2)


