

            svsave (2) --- save shell variables in a file            05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svsave (file, trace)
          |      character file (ARB)
          |      bool trace

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svsave'  takes  the  shell  variables  at lexic level 1 and
          |      writes them to 'file'.  Setting 'trace' produces a trace  of
          |      the  variables being saved on the users terminal.  The trace
          |      consists of the name of each variable being  saved  followed
          |      by  its  value.   The function returns ERR if the file could
          |      not be opened and OK otherwise.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      If the file can't be opened, then the  function  returns  an
          |      error;  otherwise,  the  current level of shell variables is
          |      traversed and written to the file.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _C_a_l_l_s

          |      close, open, print, putch, putlin, trunc


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)



















            svsave (2)                    - 1 -                    svsave (2)


