

            mkclist (3) --- create a list of commands for backstop   08/28/84


          | _U_s_a_g_e

                 mkclist [ -s ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mkclist' lists the commands in "=lbin=", "=bin=", "=ubin=",
                 and  the internal shell commands, sorts them into order, and
                 places them in "=ubin=/clist".  This file  is  used  by  the
                 backstop program as the file of commands to search through.

                 The template "=ubin=" must refer to the user's personal com-
                 mand   directory.   By  default,  the  system-wide  template
                 "=ubin=" refers to "//=user=/bin".

                 The "-s" option causes 'mkclist' to omit "=ubin="  from  the
                 list   of   commands   and   place  the  resulting  list  in
                 "=extra=/clist", thus creating the  system  default  command
          |      list.


          | _E_x_a_m_p_l_e_s

          |      mkclist


            _M_e_s_s_a_g_e_s

          |      "Usage ..."  for improper arguments


          | _B_u_g_s

          |      Bombs if =ubin= does not exist.


            _S_e_e _A_l_s_o

                 bs (5), bs1 (5), guess (5)


















            mkclist (3)                   - 1 -                   mkclist (3)


