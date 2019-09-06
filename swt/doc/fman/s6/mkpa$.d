

            mkpa$ (6) --- convert a treename into a pathname         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mkpa$ (tree, path, default)
                 character path (MAXPATH), tree (ARB)
                 integer default

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mkpa$'  is  used  to  convert  a  Primos  treename  into an
                 equivalent Subsystem pathname.  The first  argument  is  the
                 treename  to  be converted.  The second argument is a string
                 to receive the equivalent pathname.  The  last  argument  is
                 used  to  resolve  an  ambiguity  in Primos treenames; if it
                 equals YES, then simple names are interpreted  as  top-level
                 user   file   directories,   otherwise   simple   names  are
                 interpreted as files in the current directory.

                 The function return is the length of the  pathname  returned
                 in 'path'.

                 The following conversions are performed:

                      <name>dir>subdir>file -> /name/dir/subdir/file
                      dir>subdir>file       -> //dir/subdir/file
                      *>subdir>file         -> subdir/file
                      simplename            -> simplename
                                                  (if 'default' == NO)
                                            -> //simplename
                                                  (if 'default' == YES)



            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Simple  checks  determine  which of the above cases applies,
                 then translation is straightforward.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 path


            _C_a_l_l_s

                 scopy, mapdn, index


            _S_e_e _A_l_s_o

                 mktr$ (6)




            mkpa$ (6)                     - 1 -                     mkpa$ (6)


