

            getto (2) --- get to the last file in a pathname         08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getto (path, name, pwd, attach)
                 character path (ARB)
          |      packedchar name (MAXPACKEDFNAME), pwd (3)
                 integer attach

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      'Getto' attaches to the UFD containing the file specified in
          |      the  last  node  of  the  pathname 'path.'  In order to make
          |      further operations on the file convenient, it packs the name
          |      of the last node in the  path  (usually  a  file  name)  two
          |      characters  per  word, left justified, blank filled into the
          |      argument 'name', and similarly packs the password  (if  any)
          |      into  the  argument  'pwd'.   Passwords are always mapped to
                 upper case.

                 'Getto' returns ERR if the UFD containing the file could not
          |      be attached; OK otherwise.  If 'getto' returns with 'attach'
          |      set to NO, the current UFD was not changed; if YES, then the
          |      parent directory of the last file in  the  path  became  the
          |      current directory.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Getto' sets up an on-unit for the "BAD_PASSWORD$" condition
          |      to  handle  errors  during  the  attaching process.  Then it
          |      expands any pathname templates  in  'path',  converting  the
          |      _S_o_f_t_w_a_r_e _T_o_o_l_s-style pathname into a Primos treename by cal-
          |      ling  'mktr$'.   If  the pathname supplied is empty, 'getto'
          |      attaches back to the home directory by  calling  the  Primos
          |      routine  AT$HOM.   Otherwise,  it loops through the nodes in
          |      the treename until it has attached to the  parent  directory
          |      of  the  last node.  If the treename refers to a primary UFD
          |      (one in the master file directory  of  some  disk),  'getto'
          |      uses  the  Primos routine AT$ANY to attach to the named UFD,
          |      and then attaches to the MFD on  the  same  disk  using  the
          |      Primos routine AT$ABS.  If the treename is a fully specified
          |      path  including packname, 'getto' checks see to if the pack-
          |      name specifies a logical  disk  number.   If  it  does,  the
          |      Primos routine AT$ is called to attach to the primary UFD on
          |      the  specified  disk pack; otherwise the AT$ABS is called to
          |      do the attach.  Then 'getto' attaches to the MFD on the same
          |      disk using AT$ABS.  If the last node of the treename has not
          |      been reached, 'getto' attaches down the path by calling  the
          |      Primos  routine  AT$REL.   If  any  errors  occur during the
          |      attaching process, 'getto' attaches back to the home  direc-
          |      tory and returns ERR.





            getto (2)                     - 1 -                     getto (2)




            getto (2) --- get to the last file in a pathname         08/28/84


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 name, pwd, attach


            _C_a_l_l_s

          |      bponu$,  ctov,  expand,  mapstr,  mktr$,  Primos at$, Primos
          |      at$abs, Primos at$any, Primos at$hom, Primos at$rel,  Primos
          |      break$, Primos mklb$f, Primos mkonu$


            _S_e_e _A_l_s_o

                 follow (2), open (2), remove (2)











































            getto (2)                     - 2 -                     getto (2)


