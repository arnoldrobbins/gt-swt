

            lfo (3) --- list files opened for a specified user       10/21/83


          | _U_s_a_g_e

          |      lfo {<process id> | <user name>}


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Lfo'  prints  the  following information on STDOUT for each
          |      process number and for all processes owned by each user name
          |      specified:

          |           1. the user name and process-id;
          |           2. his accumulated cpu and io times;
          |           3. his initial, current, and home directories;
          |           4. every open file unit and its associated pathname.

          |      If no arguments are specified, 'lfo' lists  the  information
          |      for as many processes as possible.  The normal user may list
          |      only  his  own  processes,  while a system administrator may
          |      list any process on the system.


          | _E_x_a_m_p_l_e_s

          |      lfo 1 15 16 23
          |      lfo snodgrass silverlips
          |      lfo 3 upi 8
          |      lfo


          | _M_e_s_s_a_g_e_s

          |      "pathname not obtainable"  for  files  opened  on  a  remote
          |      system.


          | _B_u_g_s

          |      Locally supported.

          |      Requires Georgia Tech modified Primos.

















            lfo (3)                       - 1 -                       lfo (3)


