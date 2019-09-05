

            vt$alc (6) --- allocate another VTH definition table     07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$alc (tbl, c)
                 integer tbl
                 character c

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$alc'  is  used  to allocate another VTH definition table
                 for the key sequence definitions.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$alc' verifies that there is room for another  definition
                 table  and  then initializes the new table if there is room.
                 The "next table" pointer  in  the  table  'tbl'  is  set  to
                 indicate  the  index to the new table.  If no room is found,
                 then ERR is returned.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 tbl


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)





















            vt$alc (6)                    - 1 -                    vt$alc (6)


