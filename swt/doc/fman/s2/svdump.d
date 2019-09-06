

            svdump (2) --- dump the contents of the shell variable common  05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine svdump (fd)
          |      file_des fd

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svdump'  outputs all internal shell variable information at
          |      all lexic levels on the open file descriptor 'fd'.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Svdump' scans the hash table for each lexic level from  the
          |      first  level to the current level and prints the hash chains
          |      (including the variable names, values, and locations) in the
          |      internal shell variable array.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _C_a_l_l_s

          |      print


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)























            svdump (2)                    - 1 -                    svdump (2)


