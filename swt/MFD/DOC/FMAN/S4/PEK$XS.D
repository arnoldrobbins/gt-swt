

            pek$xs (4) --- look at a location in memory              06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine pek$xs (ptr_to_word, contents)
                 shortcall pek$xs (4)

                 pointer ptr_to_word
                 untyped contents

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 The  subroutine  returns  the  contents  of  the word at the
                 address 'ptr_to_word'.  Effectively,

                            call pek$xs (loc(word), contents)

                 is equivalent to

                                     contents = word


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 contents


            _B_u_g_s

                 No validity check is done on the pointer.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), pok$xs (4)










            pek$xs (4)                    - 1 -                    pek$xs (4)


