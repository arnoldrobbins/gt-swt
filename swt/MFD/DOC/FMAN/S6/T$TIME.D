

            t$time (6) --- obtain clock readings for profiling       03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine t$time (reel, cpu, diskio)
                 long_int reel, cpu, diskio

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'T$time'  is  called  by  't$entr' and 't$exit' to fetch the
                 amounts  of  real  time,  cpu  time,  and  disk   I/O   time
                 accumulated so far during this run.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The   Primos   routine   TIMDAT   is  called  to  fetch  the
                 information, which is converted uniformly to timer ticks.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 reel, cpu, diskio


            _C_a_l_l_s

                 Primos timdat


            _B_u_g_s

                 Timer resolution is not good.


            _S_e_e _A_l_s_o

                 t$entr (6), t$exit (6), t$clup (6), rp (1)



















            t$time (6)                    - 1 -                    t$time (6)


