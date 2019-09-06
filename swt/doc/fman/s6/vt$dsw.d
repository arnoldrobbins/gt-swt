

            vt$dsw (6) --- perform garbage collection on DFA tables  07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$dsw

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$dsw'  reclaims  the  space occupied by unused definition
                 tables for use in storing other definitions.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$dsw' looks  for  tables  whose  entries  have  all  been
                 undefined;  their  "in  use"  indicators  are reset, and all
                 references to them by other tables are removed.


            _C_a_l_l_s

                 vtprt


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)

























            vt$dsw (6)                    - 1 -                    vt$dsw (6)


