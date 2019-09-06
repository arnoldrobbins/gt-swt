

            szfil$ (6) --- size an open Primos file descriptor       09/18/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longint function szfil$ (fd)
          |      integer fd

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Szfil$'  returns the size of the file (in words) associated
          |      with the open Primos file unit 'fd'.  If there is some error
          |      on the file, the function return is ERR.  The file  is  left
          |      positioned at the end of file.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Primos PRWF$$ is called to relatively position the file to a
          |      large  position  until  the  file reaches end of file.  Then
          |      PRWF$$ is called to read the current position of  the  file.
          |      If any error occurs, the function returns ERR, otherwise the
          |      size of the file is returned as the function return.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _S_e_e _A_l_s_o

          |      gfdata (2), sfdata (2), szseg$ (6)

























            szfil$ (6)                    - 1 -                    szfil$ (6)


