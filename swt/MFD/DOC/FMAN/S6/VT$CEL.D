

            vt$cel (6) --- send a clear to end-of-line sequence      10/30/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$cel (dummy)
                 integer dummy

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$cel'  is used to clear the line from where the cursor is
                 currently positioned to the end of  the  line.   The  return
                 value is OK if the line was cleared, and ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The VTH common block is checked for the existence of a clear
                 to  eol  sequence.  If one exists, it is written out and the
                 function return is OK.  If there is no sequence,  the  func-
                 tion return is ERR.


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)



























            vt$cel (6)                    - 1 -                    vt$cel (6)


