

            svget (2) --- return the value of a shell variable       05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svget (name, value, maxval)
          |      character name (ARB), value (maxval)
          |      integer maxval

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svget'  looks  up  and returns the value of the most recent
          |      declaration of the shell variable 'name'.   'Value'  is  the
          |      array  to  receive  the  value  and  'maxval' is the maximum
          |      amount of space (including the EOS) in the receiving string.
          |      The function returns  the  length  of  the  returned  string
          |      'value' if the variable is found and EOF otherwise.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Svget'  searches  for  'name'  from the current lexic level
          |      back to the first lexic level, stopping when it locates  the
          |      first  (most  recent) definition.  Any previous declarations
          |      are ignored.  If the variable is not located then the  func-
          |      tion  returns  EOF;  otherwise, as much of the value as pos-
          |      sible is copied into the receiving buffer and the number  of
          |      characters transferred is returned.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      value


          | _C_a_l_l_s

          |      ctoc


          | _B_u_g_s

          |      Should  probably  return  the  lexic  level  of the variable
          |      located.


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)









            svget (2)                     - 1 -                     svget (2)


