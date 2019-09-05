

            rewind (2) --- rewind a file                             02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function rewind (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rewind'  positions the file specified by 'fd' to its begin-
                 ning.  All internal Subsystem status indicators are reset to
                 indicate the new condition of the file.  If the  attempt  to
                 rewind  was  successful,  'rewind' returns OK; otherwise, it
                 returns ERR.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rewind' calls 'seekf' to set the current  position  of  the
                 file to zero.


            _C_a_l_l_s

                 seekf


            _B_u_g_s

                 Terminal  file behavior is somewhat unpredictable, since the
                 user may have typed ahead of any requests for input.


            _S_e_e _A_l_s_o

                 wind (2), seekf (2), markf (2)





















            rewind (2)                    - 1 -                    rewind (2)


