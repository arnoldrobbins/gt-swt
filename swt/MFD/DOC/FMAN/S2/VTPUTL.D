

            vtputl (2) --- put line into terminal screen buffer      07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtputl (str, row, col)
                 integer row, col
                 character str (ARB)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtputl'  is  used  to place a string of characters into the
                 screen  buffer,  in  the  specified  position.   The   first
                 argument  is  the  EOS-terminated string of characters to be
                 displayed; the second and  third  arguments  are  the  (row,
                 column)  position on the screen where the first character of
                 the string is to be displayed.   'Vtputl'  only  places  the
                 string into the screen buffer; 'vtupd' must be called before
                 any  changes  to  the  internal  buffer are reflected on the
                 screen.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtputl' simply calls 'vt$put' with the same arguments, plus
                 the length of the string, and then returns.


            _C_a_l_l_s

                 vt$put, length


            _S_e_e _A_l_s_o

                 length (2), and other vt?* routines (2)






















            vtputl (2)                    - 1 -                    vtputl (2)


