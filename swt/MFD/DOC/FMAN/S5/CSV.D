

            csv (5) --- convert shell variables to new format        09/18/84


          | _U_s_a_g_e

          |      csv


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Csv'  is  a  command  for system administrators to ease the
          |      change when bringing up revision 9  of  the  Software  Tools
          |      Subsystem.  The shell variables save file format has changed
          |      at  this  revision  and this command attempts to convert the
          |      variables files mechanically.  'Csv' accepts a list of  user
          |      names on its first standard input port, attempts to open the
          |      corresponding        variables        file        (hopefully
          |      "=vars=/<user_name>/.vars"), and changes  the  special  Sub-
          |      system   character   mnemonics  for  the  variables  "_eof",
          |      "_erase", "_escape",  "_kill",  "_newline",  and  "_retype".
          |      The  new  shell  variables are copied into a temporary file,
          |      which  is  then  used  to  overwrite  the  user's  permanent
          |      variables file.

          |      This  command  is  best  run  on an empty system because any
          |      users who are logged in  during  this  execution  will  have
          |      their  variables  changed,  but  when they log out they will
          |      overwrite any changes that have been made.  Also, the system
          |      administrator will have to  change  his  variables  manually
          |      because  when  he  logs  out  he  will overwrite any changes
          |      already made.  The easiest way to execute  this  command  is
          |      probably  to  list the files under "=vars=", remove any non-
          |      user files, and pipe the resulting list into 'csv'.


          | _E_x_a_m_p_l_e_s

          |      valid_users> csv
          |      lf -c =vars= | =ebin=/csv


          | _M_e_s_s_a_g_e_s

          |      Self explanatory.


          | _F_i_l_e_s

          |      =temp=/?* =vars=/<user_name>/.vars


          | _B_u_g_s

          |      Could probably be a little more intelligent.


          | _S_e_e _A_l_s_o

          |      _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _C_o_m_m_a_n_d


            csv (5)                       - 1 -                       csv (5)




            csv (5) --- convert shell variables to new format        09/18/84


          |      _I_n_t_e_r_p_r_e_t_e_r, _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _M_a_n_a_g_e_r_'_s _G_u_i_d_e

























































            csv (5)                       - 2 -                       csv (5)


