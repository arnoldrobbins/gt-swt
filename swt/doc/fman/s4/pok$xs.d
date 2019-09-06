

            pok$xs (4) --- change a location in memory               06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine pok$xs (ptr_to_word, contents)
                 shortcall pok$xs (4)

                 pointer ptr_to_word
                 untyped contents

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 The  subroutine  changes  the  contents  of  the word at the
                 address 'ptr_to_word'.  Effectively,

                            call pok$xs (loc(word), contents)

                 is equivalent to

                                     word = contents


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _B_u_g_s

                 No validity check is done on the pointer.

                 The  user may do very peculiar things to his/her environment
                 if the call is not used with care.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), pek$xs (4), s1c$xs (4), s2c$xs (4)












            pok$xs (4)                    - 1 -                    pok$xs (4)


