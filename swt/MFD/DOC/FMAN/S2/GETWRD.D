

            getwrd (2) --- get a word from a line buffer             02/04/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getwrd (in, i, out)
                 integer in (ARB), out (ARB)
                 integer i

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getwrd'  retrieves  the next word from the line buffer 'in'
                 at current position 'i', and places it in 'out'.  A word  is
                 a string of characters delimited by blanks or newlines (also
                 EOS,  if  the  word occurs at the end of the line).  The new
                 current position is updated in 'i', and the  length  of  the
                 word is returned as the function value.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Any  blanks,  starting  at  the  current position 'i' in the
                 string, are skipped.  Characters from 'in' are  then  copied
                 to 'out', starting at position 'i', until the next character
                 to  be copied is either an EOS, a blank, or a NEWLINE.  When
                 this happens, the count of characters is returned.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, out


            _S_e_e _A_l_s_o

                 ctoc (2)






















            getwrd (2)                    - 1 -                    getwrd (2)


