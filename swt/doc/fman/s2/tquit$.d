

            tquit$ (2) --- check for pending terminal interrupt      02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function tquit$ (flag)
                 logical flag

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Tquit$'  checks  to  see  if  there  is  a  pending program
                 interrupt as a result of the user having entered a BREAK  or
                 CTRL-P.   If  there  is,  a  value of .true.  is returned in
                 'flag' and as the function's result; otherwise, a  value  of
                 .false.  is returned.

                 Before  'tquit$'  can be used, the Primos system call BREAK$
                 must have been called with an argument of .true..  Before  a
                 program  exits,  BREAK$ should be called with an argument of
                 .false..


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tquit$' calls  the  Primos  routine  QUIT$  to  detect  the
                 interrupt.   If  one  has occurred, it also calls the Primos
                 routine TTY$RS to clear the terminal output buffer and  T1OU
                 to echo a NEWLINE.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 flag


            _C_a_l_l_s

                 Primos quit$, Primos tty$rs, Primos t1ou




















            tquit$ (2)                    - 1 -                    tquit$ (2)


