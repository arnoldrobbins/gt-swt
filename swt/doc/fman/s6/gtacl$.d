

            gtacl$ (6) --- get acl protection into ACL common block  09/04/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function gtacl$ (path, key, at)
          |      character path(ARB)
          |      integer key, at

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      If  'key'  is 1, 'gtacl$' retrieves the standard ACL protec-
          |      tion for the file 'path' into the ACL common  block,  or  if
          |      'key'  is 2, it returns the priority ACL protection into the
          |      ACL common block.  'At' is set to YES if the current  attach
          |      was moved to get to the specified file.  The function return
          |      is  OK  if  the information was was retrieved and ERR other-
          |      wise.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Gtacl$' attempts to attach to the directory containing  the
          |      file  and then procedes to retrieve the acl information.  It
          |      then scans through the returned information and  formats  it
          |      for  further  use  in  the  common  blocks.  If any error is
          |      encountered it attaches home if the attach point has changed
          |      and returns an error, otherwise it returns OK.


          | _C_a_l_l_s

          |      ctov (2), equal (2), follow (2), getto (2), mkpa$ (2), mktr$
          |      (2), mapstr (2), vtoc (2), Primos pa$lst, Primos ac$lst


          | _S_e_e _A_l_s_o

          |      gfdata (2), sfdata (2)



















            gtacl$ (6)                    - 1 -                    gtacl$ (6)


