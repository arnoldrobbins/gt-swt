

            vt$db2 (6) --- dump terminal input tables                07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$db2

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$db2'  dumps  out  the  key sequence definitions from the
                 terminal input tables in semi-formatted form.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 For each  key  sequence  definition  table,  'vt$db2'  first
                 checks  to see if the table is being used.  If so, it prints
                 out all the entries in the  table,  with  the  format  being
                 based  on  what  the  information  type  is.   The  types of
                 information stored include the pointer to the  next  defini-
                 tion table, a pointer to a definition sequence, or character
                 values.   Unprintable  character  values  are  converted  to
                 mnemonics before being output.


            _C_a_l_l_s

                 ctomn, print


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)




















            vt$db2 (6)                    - 1 -                    vt$db2 (6)


