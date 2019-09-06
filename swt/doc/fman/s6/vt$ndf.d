

            vt$ndf (6) --- remove VTH macro definition               07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$ndf (ch)
                 character ch

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$ndf'   removes   keyboard  macro  definitions  from  the
                 appropriate tables.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$ndf' prompts the user for the sequence which  is  to  be
                 removed  from  the  definition  tables.   If the sequence is
                 found, then its definition is  removed  and  its  associated
                 definition  tables  are garbage collected; otherwise, ERR is
                 returned.


            _C_a_l_l_s

                 vtmsg, vtupd, vt$dsw, vt$err, vt$gsq, vt$rdf, Primos c1in


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)






















            vt$ndf (6)                    - 1 -                    vt$ndf (6)


