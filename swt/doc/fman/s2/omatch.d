

            omatch (2) --- try to match a single pattern element     01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function omatch (lin, i, pat, j)
                 character lin (ARB), pat (MAXPAT)
                 integer i, j

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Omatch'  attempts  to  match  a  single  pattern element at
                 "pat(j)" against a character at "lin(i)".  If the match suc-
                 ceeds, 'i' is incremented to point to  the  next  unexamined
                 character  in 'lin'.  The function return is YES if the pat-
                 tern element matched the text, NO otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Omatch' is essentially a case statement, treating each pat-
                 tern element specially.  Non-special characters are directly
                 compared.  The wild-card character matches  any  non-NEWLINE
                 character  in 'lin'.  Beginning-of-line is matched only when
          |      'i' is one.  End-of-line is matched only when "lin(i)" is  a
          |      NEWLINE  or  an  EOS.   'Locate'  is used to match character
                 classes.  If a character is matched, 'i' is  incremented  by
                 one.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i


            _C_a_l_l_s

          *      locate, error


            _S_e_e _A_l_s_o

                 match (2), amatch (2), locate (2)















            omatch (2)                    - 1 -                    omatch (2)


