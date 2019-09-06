

            shell (2) --- run the Subsystem command interpreter      09/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function shell (fd)
          |      file_des fd

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Shell'  takes an open file descriptor as its only argument.
          |      The shell reads command lines from this file descriptor, and
          |      attempts to execute the commands.

          |      This is the main routine for the user level shell  as  well.
          |      For  details  on  how to use the shell, see _T_h_e _U_s_e_r_'_s _G_u_i_d_e
          |      _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r.

          |      Having the shell as a subroutine opens up many possibilities
          |      not previously available to the programmer.   However,  care
          |      must  be  exercised  when  using  the shell.  In particular,
          |      since EPF's are not currently supported, it  is  quite  pos-
          |      sible   for   two   user   programs  called  from  different
          |      invocations of the shell to destroy each other's code and/or
          |      data.  For example, if you run 'se' on one  file,  and  then
          |      from  'se' you run the shell, and from the new shell you run
          |      'se' on a second file, the second 'se'  will  overwrite  the
          |      data  of  the  first 'se' (effectively destroying your first
          |      editing  session).   This  is  because  the  data  for  both
          |      instances of 'se' are loaded into the same area of (virtual)
          |      memory.   There is currently no safe way to get around this,
          |      other than to be careful about what programs  you  run  from
          |      subsidiary  invocations  of  the  shell.  (The screen editor
          |      should  be  relatively  safe  from  most  programs  (besides
          |      another 'se'), since its data is not loaded into the default
          |      segment  (segment  4000),  and  the code is in a shared seg-
          |      ment.)

          |      When EPF's are supported, it is recommended that  everything
          |      then  be  reloaded  in  EPF  format.  This will allow you to
          |      invoke programs from subsidiary  shells  without  having  to
          |      worry about what segment a program loads in.  Until then, it
          |      is  recommended  that  you  do  not  use this subroutine for
          |      programs that will be loaded in segment 4000, since as  soon
          |      as  you  run  another  external  program which also loads in
          |      4000, the first program will be destroyed.  (When the second
          |      program exits, you will end up back in the lowest  level  of
          |      the shell.)

          |      'Shell'  returns  OK  if  everything went well, otherwise it
          |      returns ERR.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Too complicated to describe here.


            shell (2)                     - 1 -                     shell (2)




            shell (2) --- run the Subsystem command interpreter      09/11/84


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      None


          | _S_e_e _A_l_s_o

          |      _T_h_e _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _C_o_m_m_a_n_d
          |      _I_n_t_e_r_p_r_e_t_e_r, sh (1), subsys (2)

















































            shell (2)                     - 2 -                     shell (2)


