

            gcdir$ (6) --- get current directory pathname            01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gcdir$ (path)
                 character path (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gcdir$'  is  used  to  determine  the  full pathname of the
                 current working directory.  The sole argument is a character
                 array to receive the pathname.  The function return is OK if
                 the name could be found, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gcdir$' first obtains the treename of the current directory
                 using the Primos routine  GPATH$.   This  treename  is  then
                 unpacked  by 'ptoc' and passed to 'mkpa$', which converts it
                 into a SWT pathname.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 path


            _C_a_l_l_s

                 mkpa$, ptoc, Primos gpath$


            _B_u_g_s

                 Be  warned  that  because  of  Prime's  password  protection
                 scheme,  it is not always possible to obtain a pathname that
                 can later be used to attach to the home directory  with  the
                 same access rights.


            _S_e_e _A_l_s_o

                 mktr$ (6), mkpa$ (6), follow (2), getto (2)













            gcdir$ (6)                    - 1 -                    gcdir$ (6)


