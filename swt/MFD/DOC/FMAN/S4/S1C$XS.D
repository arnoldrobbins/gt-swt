

            s1c$xs (4) --- protected single-word store operation     06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function s1c$xs (ptr_to_variable, old_value, new_value)
                 shortcall s1c$xs (4)

                 pointer ptr_to_variable
                 untyped old_value, new_value

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 The function implements an uninterruptable form of test-and-
                 set  operation.  The parameter 'ptr_to_variable' is a 2 word
                 virtual memory pointer to a 1 word location in memory to  be
                 tested and possibly modified.

                 If  the  variable  contains  the  same  value as provided in
                 'old_value' then the variable is updated to 'new_value'  and
                 the  function returns TRUE.  If the variable is not equal to
                 'old_value' then the function returns FALSE and no change is
                 made to the variable.  Effectively,

                             if (variable == old_value) {
                                variable = new_value
                                return (TRUE)
                                }

                             else
                                return (FALSE)


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).   The  function uses the STAC instruction which
                 is guaranteed to be atomic (non-interruptable).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _B_u_g_s

                 The pointer supplied is not checked for validity.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), s2c$xs  (4),  _S_y_s_t_e_m  _A_r_c_h_i_t_e_c_t_u_r_e  _R_e_f_e_r_e_n_c_e  _G_u_i_d_e
                 (Prime PDR 3060)



            s1c$xs (4)                    - 1 -                    s1c$xs (4)


