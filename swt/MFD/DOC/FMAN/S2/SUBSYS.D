

            subsys (2) --- call the Subsystem command interpreter    08/27/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function subsys (command)
          |      character command (ARB)

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Subsys'   takes  an  EOS  terminated  string  as  its  only
          |      argument.  It then passes this string on to the shell to  be
          |      executed.

          |      'Subsys'  returns  ERR if it could not put the command where
          |      the shell can get to it.  Otherwise, it passes on the return
          |      code from the shell's execution of the command.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Subsys' first create a temporary file  with  'mktemp'.   It
          |      writes  the  command to be executed to the file, rewinds the
          |      open file descriptor, and then calls the 'shell'  subroutine
          |      on that descriptor.  Finally, it calls 'rmtemp' to close the
          |      temporary file.


          | _C_a_l_l_s

          |      mktemp, shell, rmtemp


          | _S_e_e _A_l_s_o

          |      mktemp (2), shell (2), rmtemp (2)






















            subsys (2)                    - 1 -                    subsys (2)


