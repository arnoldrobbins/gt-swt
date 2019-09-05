

            tsq$xs (4) --- return the number of entries in a queue   06/28/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function tsq$xs (qu, count)
                 shortcall tsq$xs (4)

                 queue_control_block qu
                 integer count

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 This  function  sets  the  variable 'count' to the number of
                 entries in the queue at 'qu'.  The function value is TRUE if
                 the queue is non-empty, FALSE if the queue has no entries.

                 The  declaration   'queue_control_block'   is   defined   in
                 =incl=/shortlb.r.i;  this  file  should  be included if this
                 routine is used.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).   The  hardware TSTQ instruction is executed on
                 the arguments.

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 count


            _B_u_g_s

                 The routine makes no attempt to validate the argument passed
                 as a queue control block.

                 Locally supported.


            _S_e_e _A_l_s_o

                 abq$xs (4), atq$xs (4), fc  (1),  mkq$xs  (4),  rtq$xs  (4),
                 rbq$xs  (4), _S_y_s_t_e_m _A_r_c_h_i_t_e_c_t_u_r_e _R_e_f_e_r_e_n_c_e _G_u_i_d_e, (Prime PDR
                 3060)







            tsq$xs (4)                    - 1 -                    tsq$xs (4)


