

            ttyp$l (6) --- list the available terminal types         08/30/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine ttyp$l

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ttyp$l'  will  list all of the terminal types that are sup-
                 ported by the Subsystem and its associated software packages
                 (such as VTH).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ttyp$l' opens the  "=ttypes="  (nominally  "//extra/terms")
                 file, if it can, and lists the terminal types available in a
                 readable format to the terminal.


            _C_a_l_l_s

          |      close, input, length, open, print


          | _B_u_g_s

          |      Some might consider it a bug that the output is always writ-
          |      ten to the terminal.


            _S_e_e _A_l_s_o

                 se (1), term (1), term_type (1), other ttyp$?* routines (6)























            ttyp$l (6)                    - 1 -                    ttyp$l (6)


