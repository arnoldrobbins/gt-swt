

            mkdir (1) --- make a directory                           03/25/82


            _U_s_a_g_e

                 mkdir <pathname> [-o <owner>] [-n <non_owner>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mkdir'  is  used  to  create a new directory.  The pathname
                 given as the first argument is the pathname  of  the  direc-
                 tory; all nodes but the last must exist prior to the invoca-
                 tion of 'mkdir'.  The "-o" and "-n" keyword arguments may be
                 used  to  specify  the  owner  and non-owner passwords to be
                 given to the new directory.  If they  are  omitted,  default
                 values are assumed as follows:  at installations running the
                 Georgia  Tech  version  of  Primos, the user's login name is
                 used for the owner password and the  non-owner  password  is
                 set to zero; at installations running unmodified Primos, the
                 owner  password  is set to blanks and the non-owner password
                 is set to zero.


            _E_x_a_m_p_l_e_s

                 mkdir subsys
                 mkdir subdir -o allen
                 mkdir //may-78/twob -n secret


            _M_e_s_s_a_g_e_s

                 "Usage:  mkdir ..."   for  missing  directory  name  or  bad
                      arguments
                 "<pathname>:   can't  create" if directory already exists or
                      the path to it cannot be followed


            _S_e_e _A_l_s_o

                 lf (1), passwd (3), del (1)



















            mkdir (1)                     - 1 -                     mkdir (1)


