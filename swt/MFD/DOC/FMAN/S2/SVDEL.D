

            svdel (2) --- delete a shell variable at the current level  05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine svdel (name)
          |      character name (ARB)

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svdel'  deletes a shell variable at the current lexic level
          |      of the shell.  'Name' contains the name of the  variable  to
          |      delete.   'Svdel'  cannot  delete  a  variable global to the
          |      current scope.  Changes  to  shell  variables  that  control
          |      values  in  the  SWT common block ("_eof" for example) occur
          |      immediately.  If one of these values is deleted,  the  value
          |      in the common block reverts to the value it contained in the
          |      previous scope.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      If  the  variable does not exist at the current lexic level,
          |      the subroutine returns; otherwise, it deallocates the  space
          |      in the internal variable common block for the name and value
          |      and  then  returns.   If  the  variable is used to control a
          |      location in the SWT  common  block,  the  current  value  is
          |      replaced  by  the  value  it  had when the current scope was
          |      invoked.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)



















            svdel (2)                     - 1 -                     svdel (2)


