

            svmake (2) --- create a shell variable at the current lexic level  05/27/82


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svmake (name, value)
          |      character name (ARB), value (ARB)

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svmake'  creates  a  shell  variable  'name' at the current
          |      lexic level of the shell with the value 'value'.  The  func-
          |      tion  returns the lexic level at which the variable has been
          |      created.  If the variable controls a value kept in  the  SWT
          |      common  block,  the  value in the common block is updated to
          |      reflect the new value of the variable.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      First, 'svmake' checks the existence of the variable at  the
          |      current  lexic  level.   If  it  exists,  then  the function
          |      returns immediately; otherwise it  allocates  space  in  the
          |      variable  area  for  the  name  and  value.  If the variable
          |      controls a location in the SWT common block, 'svmake'  saves
          |      the current value in the SWT common and copies the new value
          |      in its place.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _C_a_l_l_s

          |      length, ctoc


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)
















            svmake (2)                    - 1 -                    svmake (2)


