

            history (1) --- Software Tools Subsystem historian       08/27/84


          | _U_s_a_g_e

          |      history


            _D_e_s_c_r_i_p_t_i_o_n

                 'History'  is  a simple command file that keeps a history of
          |      changes to the Subsystem.  It is intended  for  use  by  the
          |      Subsystem  implementors  to  keep  a  record  of changes and
          |      additions.

          |      'History' is invoked with no arguments, since they  are  not
          |      used.   The  user  invoking  'history'  must be in the group
          |      '.guru' (users who are all  powerful  and  all  knowing)  in
          |      order  to  be able to make changes in the Subsystem history.
          |      Since most systems do not have the '.guru' group, the  local
          |      administrator  should  change =src=/std.sh/history.sh to use
          |      an appropriate test.  Essentially, one should  test  if  the
          |      user has permission to modify the history file.

          |      To see what changes have been made to the Subsystem, use the
          |      command 'phist'.


            _E_x_a_m_p_l_e_s

          |      history


            _F_i_l_e_s

                 =doc=/hist/history  for  the  history  of the Software Tools
                      Subsystem.


            _M_e_s_s_a_g_e_s

          |      "Must be a guru to issue this command" if the  user  is  not
          |           allowed to change the Subsystem history.


            _S_e_e _A_l_s_o

                 phist (1)













            history (1)                   - 1 -                   history (1)


