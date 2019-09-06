

            dodash (2) --- expand subrange of a set of characters    01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dodash (valid, array, i, set, j, maxset)
                 character valid (ARB), array (ARB), set (maxset)
                 integer i, j, maxset

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dodash'  expands  character ranges given in regular expres-
                 sions.  'Valid' is  the  set  of  valid  characters  in  the
                 expansion  range  (e.g.  A-Z for upper case letters, 0-9 for
                 digits, etc.).  'Array' contains the character range string,
                 starting at position 'i'-1.  'Set' not only is the recipient
                 of the expansion, but element  'j'-1  contains  the  initial
                 character  of the range.  'Maxset' is the maximum size 'set'
                 may attain.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The indices of the first and last characters  in  the  range
                 are  determined,  and the substring of 'valid' thus selected
                 is copied into 'set'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, set, j


            _C_a_l_l_s

                 addset, esc, index


            _S_e_e _A_l_s_o

                 makpat (2), tlit (1), ed (1), se (1)

















            dodash (2)                    - 1 -                    dodash (2)


