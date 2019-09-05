

            svput (2) --- set the value of a shell variable          05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svput (name, value)
          |      character name (ARB), value (ARB)

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svput'  sets the value of existing shell variable 'name' or
          |      creates a new variable  with  the  specified  value  at  the
          |      current  lexic  level if 'name' does not already exist.  The
          |      function returns the lexic level of the  variable  that  was
          |      set.   If the variable controls a value kept in the SWT com-
          |      mon block, 'svput' updates the value in the common block  to
          |      reflect the new value of the variable.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      If  the variable exists at any lexic level, 'svput' replaces
          |      the previous value.  If the variable does not exist, 'svput'
          |      calls 'svmake' to create the variable at the  current  lexic
          |      level.   If the variable controls a location in the SWT com-
          |      mon block, 'svput' saves the current value in the SWT common
          |      and copies the new value in its place.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _C_a_l_l_s

          |      svmake


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)
















            svput (2)                     - 1 -                     svput (2)


