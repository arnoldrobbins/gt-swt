

            vt$err (6) --- display a VTH error message               07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$err (msg)
                 character msg (ARB)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$err'  prints the specified message, 'msg', in the status
                 line (if one exists), and resets the VTH pushback buffer  to
                 0.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A call to 'vtmsg' is made to print the message on the status
                 line  (if one is enabled).  Then the pushback pointer in the
                 VTH common block is set to 0 and a BEL character is printed.


            _C_a_l_l_s

                 vtmsg, vtupd, Primos t1ou


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)























            vt$err (6)                    - 1 -                    vt$err (6)


