

            svrest (2) --- restore shell variables from a file       05/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function svrest (file, trace)
          |      character file (ARB)
          |      bool trace

          |      Library:  vshlib (shell routine library)


          | _F_u_n_c_t_i_o_n

          |      'Svrest'  takes  a  file written by 'svsave' and attempts to
          |      merge the variables in the file with those  on  the  current
          |      lexic  level.  Variables already in existence at the current
          |      level will not be replaced.  'File' is the name of the  file
          |      containing  the  'svsave'd  variables.   If  'trace' is set,
          |      'svrest' produces a trace of the restoration  consisting  of
          |      each variable followed by its value printed on the terminal.
          |      The function returns ERR if the file cannot be read or if it
          |      is misformatted; otherwise, the function returns OK.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      If  the  file  cannot  be  opened then 'svrest' returns ERR,
          |      otherwise it reads pairs of lines containing the  names  and
          |      values  of  the  variables.   For  each pair of the lines it
          |      calls 'svmake' to merge  the  variables  with  the  existing
          |      ones.   If it reads a name without a corresponding value, it
          |      closes the file and returns ERR.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _C_a_l_l_s

          |      close, open, print, svmake


          | _S_e_e _A_l_s_o

          |      other sv?* routines (2)













            svrest (2)                    - 1 -                    svrest (2)


