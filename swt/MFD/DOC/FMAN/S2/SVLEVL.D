

            svlevl (2) --- return the current shell variable lexic level  05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svlevl (level)
          |      integer level

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svlevl'  returns  the  current  lexic level of the shell in
          |      'level'.  The function return is also the lexic level.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The lexic level information is retrieved from  the  internal
          |      shell variable common block and returned.  The value will be
          |      in the range from one to some maximum value (currently ten).


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      level


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)





























            svlevl (2)                    - 1 -                    svlevl (2)


