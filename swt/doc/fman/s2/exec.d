

            exec (2) --- execute pathname                            02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine exec (path_name)
                 character path_name (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Exec'  is a means of chaining execution to another program.
                 The argument is a pathname specifying the Primos run file of
                 the program to be executed.  'Exec' returns if an error  was
                 encountered,  otherwise  control  is  passed  to  the called
                 program and no return is possible.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Exec' calls the Subsystem routine 'getto' to get to the UFD
                 in which the file to be executed exists.  The  existence  of
                 the  file is checked with the function 'findf$'; if the file
                 exists, it is executed via a  call  to  the  Primos  routine
                 RESU$$.   If  the file is not found, or could not be reached
                 by 'getto', 'exec' returns to  the  calling  program.   Note
                 that  since  a call to RESU$$ is used, 'exec' can be used to
                 execute P300 run-file format programs only.


            _C_a_l_l_s

                 getto, findf$, Primos resu$$


            _B_u_g_s

                 Since Primos provides no way to tell if a file is executable
                 object code, there  is  always  a  strong  possibility  that
                 resuming  a file of unknown type will cause an unrecoverable
                 error.


            _S_e_e _A_l_s_o

                 execn (2), getto (2), findf$ (2)













            exec (2)                      - 1 -                      exec (2)


