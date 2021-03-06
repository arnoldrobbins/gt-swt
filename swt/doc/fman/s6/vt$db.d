

            vt$db (6) --- dump terminal characteristics              07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$db

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$db'  is used to print out the values of terminal charac-
                 teristics in the VTH common  block.   'Vtinit'  should  have
                 been  called  beforehand  to  set  up these terminal charac-
                 teristics.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$db1' is called to print the  mnemonics  for  the  cursor
                 movement  control  sequences.   Then  the numerical terminal
                 characteristics (such as  cursor  movement  delay  time  and
                 screen dimensions) are output by calls to 'print'.  All out-
                 put is to ERROUT.


            _C_a_l_l_s

                 ctomn, print, vt$db1


            _B_u_g_s

                 Not meant to be called by the normal user.

                 Used mainly for debugging of the VTH package.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)



















            vt$db (6)                     - 1 -                     vt$db (6)


