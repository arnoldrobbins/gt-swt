

            vt$idf (6) --- invoke user-defined key definition        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$idf (c)
                 character c

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$idf'  is  invoked to expand the definition of a keyboard
                 macro which is encountered in user input; the definition  is
                 pushed back into the input stream.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$idf'  first  checks  for  infinite  recursive definition
                 expansion.  If it detects  too  high  a  nesting  level,  it
                 returns  ERR; otherwise, it locates the definition sequence,
                 and copies it  into  the  input  pushback  buffer.   If  the
                 definition  exceeds the capacity of the pushback buffer, ERR
                 is returned; otherwise, OK is returned.


            _C_a_l_l_s

                 vt$err


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)




















            vt$idf (6)                    - 1 -                    vt$idf (6)


