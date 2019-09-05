

            patsiz (2) --- return size of pattern entry              05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function patsiz (pat, n)
                 character pat (MAXPAT)
                 integer n

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Patsiz'   returns  the  size  of  the  pattern  element  at
                 "pat(n)".


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Characters,  start  tags,  and  stop  tags  have   size   2;
                 beginning-of-line, end-of-line, and wild-card character have
                 size 1; character classes have arbitrary size encoded at the
                 next word in the pattern; closures have size CLOSIZE.


            _C_a_l_l_s

                 error


            _S_e_e _A_l_s_o

                 match (2), amatch (2)



























            patsiz (2)                    - 1 -                    patsiz (2)


