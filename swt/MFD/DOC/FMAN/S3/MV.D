

            mv (3) --- move a file from one place to another         01/15/83


            _U_s_a_g_e

                 mv <source> <destination>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mv'  moves  a file from one location or name to another, by
                 copying it and then deleting  the  original.   The  deletion
                 action  is not performed if the copy was not successful; the
                 copy is left untouched if the deletion  could  not  be  per-
                 formed.


            _E_x_a_m_p_l_e_s

                 mv //my/file //your/file
                 mv old current


            _M_e_s_s_a_g_e_s

                 "Usage:  mv ..."  for improper command syntax.
                 "Can't copy ..."  if the copy operation was unsuccessful.


            _B_u_g_s

                 'Mv'  can not move whole directories, use 'cp' with the "-s"
                 option.


            _S_e_e _A_l_s_o

                 cp (1), del (1), if (1)























            mv (3)                        - 1 -                        mv (3)


