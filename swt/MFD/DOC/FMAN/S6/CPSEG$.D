

            cpseg$ (6) --- copy one open segment directory to another  01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine cpseg$ (ifd, ofd, rc)
                 integer ifd, ofd, rc

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Cpseg$'  expects 'ifd' to contain the Primos file unit of a
                 segment directory open for reading and 'ofd' to contain  the
                 Primos  file  unit  of  an  empty segment directory open for
                 writing.  'Cpseg$' attempts to make an  exact  copy  of  the
                 input segment directory in the output segment directory.  If
                 it  is  successful,  it  sets 'rc' to OK; otherwise, it sets
                 'rc' to ERR.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Cpseg$' scans the open segment directory  with  the  Primos
                 routine  SGDR$$, calling 'cpfil$' to copy files, and calling
                 itself recursively to copy nested segment directories.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 rc


            _C_a_l_l_s

                 cpfil$, cpseg$, Primos sgdr$$, Primos srch$$


            _S_e_e _A_l_s_o

                 cpfil$ (6), filcpy (2)



















            cpseg$ (6)                    - 1 -                    cpseg$ (6)


