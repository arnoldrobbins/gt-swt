

            isadsk (2) --- test if a file is a disk file             09/10/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function isadsk (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Isadsk'  returns  YES  if  the  file referenced by the file
                 descriptor in 'fd' is a disk file; otherwise it returns  NO.
                 All  file  descriptors,  including  standard  ports,  can be
                 tested.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Isadsk' simply looks in the Subsystem common  area  at  the
                 device  type  in  the  file descriptor and returns YES or NO
                 accordingly.


            _C_a_l_l_s

                 mapsu


            _S_e_e _A_l_s_o

                 isatty (2), isnull (2)



























            isadsk (2)                    - 1 -                    isadsk (2)


