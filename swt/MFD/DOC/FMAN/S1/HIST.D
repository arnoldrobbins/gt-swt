

            hist (1) --- manipulate the subsystem history mechanism  09/05/84


          | _U_s_a_g_e

          |      hist [ on | off | save [ <file> ] | restore [ <file> ]]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      The  Shell  contains a mechanism (similar to Berkeley Unix's
          |      C-Shell) called  a  history  mechanism.   This  is  sort  of
          |      dynamic  macro  facility  that allows the user to specifiy a
          |      unique substring of a previous command and have the  command
          |      recalled  and  re-executed  or  have portions of the command
          |      edited and inserted into the current command.

          |      Up to 128 commands are saved in a  circular  command  queue.
          |      Commands are seached for and retrieved from this queue.

          |      The possible options to 'hist' do the following

          |           on   Turn the history mechanism on and reset the queue.
          |                If history is already enabled then this will clear
          |                whatever command history exists in the queue.

          |           off  Turn  the  history  mechanism  off.   Any  command
          |                history in the queue is lost.

          |           save Save the current command history in the  specified
          |                file.   If  no  file  is  specified,  the  command
          |                history is saved in the file "=histfile=".

          |           restore Restore the command  history  from  a  previous
          |                session  from  the  specified file.  If no file is
          |                specified, the command history  is  restored  from
          |                the file "=histfile=".

          |      'Hist'  with  no options produces a list of the current com-
          |      mand history on STDOUT.

          |      See the  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m
          |      _C_o_m_m_a_n_d  _I_n_t_e_r_p_r_e_t_e_r  for a more detailed explanation of the
          |      history mechanism, and examples of its use.


          | _E_x_a_m_p_l_e_s

          |      hist
          |      hist on
          |      hist off
          |      hist save
          |      hist restore //jeff/bin/scum


          | _S_e_e _A_l_s_o

          |      _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _C_o_m_m_a_n_d
          |      _I_n_t_e_r_p_r_e_t_e_r


            hist (1)                      - 1 -                      hist (1)


