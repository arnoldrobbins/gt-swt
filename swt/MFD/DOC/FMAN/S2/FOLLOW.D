

            follow (2) --- path name follower                        07/08/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function follow (path, sethome)
                 character path (ARB)
                 integer sethome

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      'Follow' changes the current working directory.  'Path' is a
          |      pathname assumed to be composed of nodes that are only UFDs,
          |      with   no  data  files  or  segment  directories.   'Follow'
          |      "attaches" (Primos terminology) to each of  the  directories
          |      and  subdirectories  named in the pathname in sequence, thus
          |      "following" a path through  the  file  system  to  the  last
          |      directory  named.  'Sethome' is a set-home key; if zero, the
          |      home directory remains unchanged, and the pathname specifies
          |      a new working directory; if 'sethome' equals one, the  path-
          |      name specifies a new home directory.

          |      'Follow'  returns  ERR  if  there  was a syntax error in the
          |      pathname or if a directory could not be attached, and OK  if
          |      the attach was successful.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Follow'  sets  up an on-unit for the "BAD_PASSWORD$" condi-
          |      tion in order to handle errors during the attaching process.
          |      If the pathname supplied is empty, 'follow' attaches back to
          |      the home directory by calling  the  Primos  routine  AT$HOM.
                 Otherwise,  'follow'  calls the routine 'getto' to reach the
          |      parent directory of the last directory in the path, and then
          |      calls the Primos routine AT$REL to take the  final  step  in
                 the  path.   If 'getto' fails to parse the pathname or reach
          |      the parent directory or if AT$REL encounters an error, 'fol-
          |      low' attaches back to the home directory and returns ERR; if
          |      successful it returns OK.


            _C_a_l_l_s

          |      bponu$, ctov, ptoc, getto,  Primos  at$hom,  Primos  at$rel,
          |      Primos break$, Primos mklb$f, Primos mkonu$


            _S_e_e _A_l_s_o

                 getto (2), cd (1)







            follow (2)                    - 1 -                    follow (2)


