

            t$exit (6) --- profiling routine called on subprogram exit  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine t$exit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'T$exit'  is  called  from  profiled  programs just before a
                 "return" statement is  executed.   It  records  the  current
                 amount  of  real,  cpu, and paging time used, and determines
                 from these the amount of time  spent  in  the  current  sub-
                 program.   This  information  is  added  to  the  total time
                 figures maintained for each subprogram.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'T$time' is called to fetch the pertinent information, which
                 is then subtracted from the values on the  stack  to  obtain
                 the time spent in the current routine.  Adjustments are made
                 to  items remaining on the stack so that they do not reflect
                 time spent in subordinate subprograms.


            _C_a_l_l_s

                 t$time


            _S_e_e _A_l_s_o

                 t$entr (6), t$clup (6), t$time (6), t$trac (6), rp (1)
























            t$exit (6)                    - 1 -                    t$exit (6)


