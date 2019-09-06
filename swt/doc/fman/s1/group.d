

            group (1) --- test or list a users group identities      07/22/83


          | _U_s_a_g_e

          |      group [-a | -o] {<group_list>}


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Group'  lists a user's currently active groups or tests for
          |      combinations of groups.  With no  arguments,  'group'  lists
          |      all  of  a  users  currently active groups.  The "-a" option
          |      causes 'group' to return a "1" if all the groups listed  are
          |      active  (i.e.   returns  the logical AND) and '0' otherwise.
          |      The "-o" option causes 'group' to return "1" if any  of  the
          |      listed  groups  are  currently  active  (i.e.   returns  the
          |      logical OR) and a '0' otherwise.   If  a  "<group_list>"  is
          |      specified with no flag argument then 'group' assumes "-a".


          | _E_x_a_m_p_l_e_s

          |      group
          |      group .guru
          |      group -a .demo .system
          |      group -o .test .strange


          | _M_e_s_s_a_g_e_s

          |      "can't  retrieve  group  names"  if  an error in the call to
          |      GETID$ occurs.


          | _S_e_e _A_l_s_o

          |      Primos List_Group command























            group (1)                     - 1 -                     group (1)


