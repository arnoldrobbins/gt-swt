

            vt$ier (6) --- report error in VTH initialization file   07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$ier (msg, name, line, fd)
                 character msg (ARB), name (ARB), line (ARB)
                 file_des fd

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$ier'  is  used to report an error in the contents of the
                 terminal characteristics file  (=vth=/?*).   The  file  name
                 'name',  a  message 'msg' explaining the error, and the line
                 'line' from the file which caused the error are  printed  to
                 ERROUT.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$ier'  calls  'print'  to output the file name, the error
                 message, and the erroneous line from  the  file  to  ERROUT.
                 The VTH initialization file indicated by 'fd' is closed, and
                 the function returns ERR.


            _C_a_l_l_s

                 close, print


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)



















            vt$ier (6)                    - 1 -                    vt$ier (6)


