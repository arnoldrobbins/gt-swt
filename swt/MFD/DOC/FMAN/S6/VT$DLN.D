

            vt$dln (6) --- send a delete line sequence               10/30/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$dln (dummy)
                 integer dummy

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$dln'  is  used  to  delete  a line at the current cursor
                 position on the user's screen.  The return value  is  OK  if
                 the line was deleted and ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The subsystem common block is checked for the existence of a
                 delete  line sequence.  If one exists, it is written out and
                 'vt$del' is called to print out a small delay sequence.   If
                 the  sequence existed, the function returns OK and if it did
                 not exist, the function returns ERR.


            _C_a_l_l_s

                 vt$del


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)





















            vt$dln (6)                    - 1 -                    vt$dln (6)


