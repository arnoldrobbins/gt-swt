

            bponu$ (6) --- on-unit for BAD_PASSWORD$ condition       03/22/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine bponu$ (cp)
                 longint cp

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Bponu$'  is an on-unit handler for the "BAD_PASSWORD$" con-
                 dition.  It is used by 'getto' to catch  directory  attaches
                 which fail because of a bad password.

                 'Bponu$'  should  never be called by the user as such; it is
                 invoked   when   the   on-unit   mechanism    detects    the
                 "BAD_PASSWORD$" condition.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Bponu$' calls the Primos PL1$NL routine with the "bad pass-
                 word label"  (i.e.,  address  of  the  password error return
                 location) to execute a "nonlocal goto" to that routine.


            _C_a_l_l_s

                 Primos pl1$nl


            _S_e_e _A_l_s_o

                 getto (2), Primos mkonu$
























            bponu$ (6)                    - 1 -                    bponu$ (6)


