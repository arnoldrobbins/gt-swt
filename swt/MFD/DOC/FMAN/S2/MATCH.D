

            match (2) --- match pattern anywhere on a line           05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function match (lin, pat)
                 character lin (ARB), pat (MAXPAT)

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Match'  attempts  to  find a match for a regular expression
                 anywhere in a  given  line  of  text.   The  first  argument
                 contains  the  text line; the second contains the pattern to
                 be matched.  The function return is YES if the  pattern  was
                 found anywhere in the line, NO otherwise.

                 The pattern in 'pat' is a standard Subsystem encoded regular
                 expression.   'Pat'  can be generated most conveniently by a
                 call to the routine 'makpat'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Match' calls 'amatch' at each position in 'lin',  returning
                 YES  whenever  'amatch'  indicates it found a match.  If the
                 test fails at all positions, 'match' returns NO.


            _C_a_l_l_s

                 amatch


            _B_u_g_s

                 Not exactly blindingly fast.


            _S_e_e _A_l_s_o

                 amatch (2), makpat (2), maksub (2), catsub  (2),  find  (1),
                 change  (1),  ed  (1),  se (1), _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e
                 _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r, _S_o_f_t_w_a_r_e _T_o_o_l_s















            match (2)                     - 1 -                     match (2)


