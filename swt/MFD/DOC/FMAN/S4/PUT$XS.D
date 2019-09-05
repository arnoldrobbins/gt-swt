

            put$xs (4) --- put a character (byte) into an array      06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine put$xs (array, position, char)
                 shortcall put$xs (4)

                 untyped array (ARB)
                 integer position
                 character char

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 This  routine  inserts  a  byte  quantity  into  'array'  at
                 'position', using highly efficient indexing and  byte  swap-
                 ping  operations.   The  byte  is  assumed  to  be the least
                 significant byte of 'char'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 array


            _B_u_g_s

                 Does no bounds checking on the array (standard FTN problem),
                 but this may also be seen as a good point.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), get$xs (4)












            put$xs (4)                    - 1 -                    put$xs (4)


