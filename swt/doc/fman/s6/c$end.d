

            c$end (6) --- clean up after statement count run         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine c$end

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'C$end'  is  called  from  Ratfor  programs  that  have been
                 processed with the "-c" (statement count) option.  Calls  to
                 'c$end'  are  planted  before  each  'stop' statement in the
                 program.

                 'C$end' simply writes out the statement count array  to  the
                 file "_st_count" for later processing.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The statement count array in common block 'c$stc' is written
                 (by repeated calls to 'print') to the file "_st_count".


            _C_a_l_l_s

                 create, cant, print, close


            _S_e_e _A_l_s_o

                 c$incr (6), rp (1)


























            c$end (6)                     - 1 -                     c$end (6)


