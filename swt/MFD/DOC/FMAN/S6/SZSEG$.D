

            szseg$ (6) --- size an open Primos segment directory     09/18/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine szseg$ (size, fd)
          |      longint size
          |      integer fd

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Szseg$'  returns  the size of the segment directory open on
          |      the Primos file descriptor 'fd'.  If an error  occurs  while
          |      sizing  the directory, 'size' will contain ERR, otherwise it
          |      will contain the size in words of the directory.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The directory is read and each of the file entries is  chec-
          |      ked.   If  an  entry is a normal file, 'szfil$' is called to
          |      size  it.   If  the  entry  is  another  segment  directory,
          |      'szseg$' is called recursively to size the subdirectory.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      size


          | _C_a_l_l_s

          |      Primos sgdr$$, Primos srch$$, szfil$ (6)


          | _S_e_e _A_l_s_o

          |      gfdata (2), sfdata (2), szfil$ (6)




















            szseg$ (6)                    - 1 -                    szseg$ (6)


