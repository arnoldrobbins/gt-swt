

            cvusr (5) --- convert pre-Version 9 user list to Version 9 format  09/21/84


          | _U_s_a_g_e

          |      cvusr <old_userlist> <new_userlist>


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Cvusr'  is  a simple shell script that takes two file names
          |      as arguments, the old, pre-Version 9 user list, and the  new
          |      user list to be created.  It simply pads six-character login
          |      names  with  blanks  to be 32 characters long.  It should be
          |      run once, by the system administrator,  when  the  new  Sub-
          |      system  is installed.  It is not needed at sites whose first
          |      edition of the Subsystem was Version 9.


          | _E_x_a_m_p_l_e_s

          |      =ebin=/cvusr //old_extra/users //extra/users


          | _M_e_s_s_a_g_e_s

          |      "Usage:  ..."  if called improperly.
          |      "old user list is new user list!!"  if  both  arguments  are
          |      identical.


          | _B_u_g_s

          |      Will  create  a  strange  user  list if any of the old login
          |      names are longer than six characters.


          | _S_e_e _A_l_s_o

          |      _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _M_a_n_a_g_e_r_'_s _G_u_i_d_e





















            cvusr (5)                     - 1 -                     cvusr (5)


