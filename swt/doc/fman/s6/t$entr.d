

            t$entr (6) --- profiling routine called on subprogram entry  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine t$entr (routine)
                 integer routine

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'T$entr'  records  the  real,  cpu,  and paging times of the
                 current process upon subprogram entry.  This information  is
                 later modified by 't$exit' to reflect only the time spent in
                 the  particular subprogram, which is then added to the total
                 for the subprogram.

                 'Routine' is the number of  the  subprogram  being  entered;
                 subprograms  are numbered consecutively beginning with 1 for
                 the main program.

                 'T$entr' should be called explicitly  only  by  those  users
                 profiling Fortran programs with hand-inserted code, in which
                 case  a  call  to  't$entr'  should  be the first executable
                 statement of any profiled routine.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A call to 't$time' gathers the necessary information,  which
                 is   then   stacked   in   a  stack  provided  by  the  user
                 (automatically, in the case of Ratfor programs).


            _C_a_l_l_s

                 Primos tnou, swt, t$time


            _B_u_g_s

                 Stack overflow terminates the program.


            _S_e_e _A_l_s_o

                 t$exit (6), t$clup (6), t$time (6), t$trac (6), rp (1)












            t$entr (6)                    - 1 -                    t$entr (6)


