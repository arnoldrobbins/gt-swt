

            vt$rdf (6) --- remove macro definition of a DFA entry    07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$rdf (c, tbl)
                 character c
                 integer tbl

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$rdf'  removes  a keyboard macro definition sequence from
                 the definition tables.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$rdf' locates the definition sequence in  the  definition
                 tables and "packs" the table to remove the definition.


            _C_a_l_l_s

                 length


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)
























            vt$rdf (6)                    - 1 -                    vt$rdf (6)


