

            rtime (3) --- determine run-time of a command            01/15/83


            _U_s_a_g_e

                 rtime <command>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rtime'  is a shell program that will determine the CPU time
                 used by the execution of a particular command.  The  command
                 to  be  timed should be specified as the set of arguments to
                 'rtime'; quoting of the command to prevent premature evalua-
                 tion of any command-language metacharacters is recommended.

                 The given command is used in a function call, and its output
                 on standard output one redirected to /dev/tty  if  no  other
                 i/o  redirection for standard output one is specified.  This
                 may cause problems if the command uses  all  three  standard
                 output ports.


            _E_x_a_m_p_l_e_s

                 rtime rp rp.r
                 rtime "stuff> filter >nonsense"


            _M_e_s_s_a_g_e_s

                 "Usage:  rtime ..."  for improper command syntax.


            _B_u_g_s

                 Redirection problem mentioned above.


            _S_e_e _A_l_s_o

                 hp (1), ctime (1)



















            rtime (3)                     - 1 -                     rtime (3)


