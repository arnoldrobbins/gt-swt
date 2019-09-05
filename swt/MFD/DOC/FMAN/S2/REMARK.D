

            remark (2) --- print diagnostic message                  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine remark (message)
                 packed_char message (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Remark'  is  a  routine from _S_o_f_t_w_a_r_e _T_o_o_l_s that is used to
                 print messages on  the  error  output  file  (ERROUT).   The
                 single   argument  is  either  a  packed,  period-terminated
                 character string (e.g.  a Fortran Hollerith literal), or  an
                 unpacked,  EOS-terminated  string  (the  standard  Subsystem
                 variety).  In either case, the given string  is  printed  on
                 ERROUT, followed by a NEWLINE.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If  the  high-order  byte of the first word of the string is
                 non-zero, then the string  must  be  packed;  'remark'  uses
                 'putlit' to write the string to ERROUT.  Otherwise, 'remark'
                 uses 'putlin' to write the string.  Finally, 'putch' is cal-
                 led to print the trailing NEWLINE.


            _C_a_l_l_s

                 putlit, putch, putlin


            _S_e_e _A_l_s_o

                 putlit (2), putch (2), error (2), putlin (2)






















            remark (2)                    - 1 -                    remark (2)


