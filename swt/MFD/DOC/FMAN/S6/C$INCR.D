

            c$incr (6) --- increment count for a given statement     03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine c$incr (stmt)
                 integer stmt

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'C$incr'  is  called  from  Ratfor  programs  that have been
                 processed with the "-c" (statement count) option.  Calls  to
                 'c$incr' are planted before each executable statement in the
                 program to keep track of the number of times the correspond-
                 ing statement was executed.

                 The  sole  argument is the line number (in the Ratfor source
                 code) of the line containing the statement  being  executed.
                 Each  call  to 'c$incr' with a given line number as argument
                 causes the count for that line to be incremented by one.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A common block ('c$stc'), created  by  Ratfor,  contains  an
                 array  of statement counts indexed by line number.  'C$incr'
                 simply increments the appropriate element of the array.


            _S_e_e _A_l_s_o

                 c$end (6), rp (1)


























            c$incr (6)                    - 1 -                    c$incr (6)


