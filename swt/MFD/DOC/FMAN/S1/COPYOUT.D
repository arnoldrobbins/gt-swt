

            copyout (1) --- copy user's terminal session to printer  02/22/82


            _U_s_a_g_e

                 copyout


            _D_e_s_c_r_i_p_t_i_o_n

                 'Copyout'  opens  a  file in the spool queue and diverts the
                 user's command output into the file.  This diversion can  be
                 stopped by logging out or issuing a 'como' command.

                 'Copyout'  is intended for use by 'batch' to produce a batch
                 job listing, but it  may  accidentally  find  use  in  other
                 situations.


            _E_x_a_m_p_l_e_s

                 copyout


            _F_i_l_e_s

                 //spoolq/prt???  for spool output


            _B_u_g_s

                 Diverting  a  screen  editor  session to the line printer is
                 very messy.


            _S_e_e _A_l_s_o

                 batch (1), como (1)























            copyout (1)                   - 1 -                   copyout (1)


