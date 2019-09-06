

            strbsr (2) --- perform a binary search of a string table  08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function strbsr (pos, tab, offs, object)
                 integer pos (ARB), offs
                 character tab (ARB), object (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Strbsr'  is  used  to  perform  a  binary search on a table
                 created by the Ratfor 'string_table' declaration.  The first
                 argument is the position array, the second is the  array  of
                 string  text  and  additional  information, the third is the
                 offset of the string text in the 'tab' array (i.e., the num-
                 ber of words of additional data associated with each entry),
                 and the last argument is a string containing the text to  be
                 sought.

                 The function return is the index of the element in the 'pos'
                 array  that  indexes  the  appropriate  entry  in  'tab'  if
                 'object' was found; EOF otherwise.

          |      See the _U_s_e_r_'_s _G_u_i_d_e  _f_o_r  _t_h_e  _R_a_t_f_o_r  _P_r_e_p_r_o_c_e_s_s_o_r  for  a
                 description of the 'string_table' declaration.

                 WARNING:   the  string  table  passed  to  'strbsr'  must be
                 _s_o_r_t_e_d, otherwise the binary search will fail.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Strbsr' is a straightforward binary search  routine,  using
                 'strcmp' to determine lexical ordering of strings.


            _C_a_l_l_s

                 strcmp


            _B_u_g_s

                 Opaquely documented.


            _S_e_e _A_l_s_o

          |      strlsr (2), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _R_a_t_f_o_r _P_r_e_p_r_o_c_e_s_s_o_r








            strbsr (2)                    - 1 -                    strbsr (2)


