

            catsub (2) --- add replacement text to end of string     05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine catsub (lin, from, to, sub, new, k, maxnew)
                 character lin (MAXLINE), new (maxnew), sub (MAXPAT)
                 integer from(10), to(10), k, maxnew

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Catsub' adds replacement text onto a string after a pattern
                 match  and  substitution  operation.   'Lin' is the original
                 text string matched by 'amatch'.  'From' and 'to'  are  ten-
                 entry  arrays specifying the beginning and end of all tagged
                 subpatterns; the N'th element refers  to  the  N-1th  tagged
                 pattern,  and element 1 refers to the entire string matched.
                 'Sub' is  the  substitution  pattern  created  by  'maksub'.
                 'New'  is  the  string  to receive the replacement text; its
                 maximum length is  'maxnew'  and  the  index  at  which  the
                 replacement text is to be inserted is 'k'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  substitution  string  is  copied into 'new' starting at
                 'k'.  Whenever a DITTO ("&" or "@<digit>") is encountered, a
                 portion of the original text string is also copied.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 new, k


            _C_a_l_l_s

                 addset


            _S_e_e _A_l_s_o

                 maksub (2), makpat (2), change (1), ed (1), se (1)















            catsub (2)                    - 1 -                    catsub (2)


