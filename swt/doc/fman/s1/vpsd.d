

            vpsd (1) --- Subsystem interlude to SEG's vpsd           02/28/82


            _U_s_a_g_e

                 vpsd <program> { <arguments> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Vpsd'  allows the user to invoke the Primos V-mode Symbolic
                 Debugger (VPSD) on a Subsystem program.   The  program  must
                 have been linked by 'ld' with the "-d" option (i.e., it must
                 be  a  segment  directory).  The standard ports are assigned
                 and the arguments are set-up, and then a call to the  Primos
                 loader (SEG) with the "vpsd" option is made, via 'sys$$'.


            _E_x_a_m_p_l_e_s

                 vpsd bogus_program >bonzo
                 echo Test data | vpsd non_debugged_program -d -l -t 2>answers


            _B_u_g_s

                 There  is  no  protection  in either the shell or 'vpsd' for
                 user errors (such as changing  incorrect  memory  locations)
                 while in VPSD.

                 'Vpsd'  is  not  much good for debugging programs written in
                 anything other than assembly.  For  programs  written  in  a
                 higher level language, use 'dbg'.

                 The single character I/O of VPSD is not the duke's choice.


            _S_e_e _A_l_s_o

                 dbg  (1),  sys$$  (2),  _P_r_i_m_e _A_s_s_e_m_b_l_y _L_a_n_g_u_a_g_e _P_r_o_g_r_a_m_m_e_r_'_s
                 _G_u_i_d_e (Chapters 18 and 21  on  VPSD),  _P_r_i_m_e  _L_o_a_d  _a_n_d  _S_e_g
                 _R_e_f_e_r_e_n_c_e _G_u_i_d_e



















            vpsd (1)                      - 1 -                      vpsd (1)


