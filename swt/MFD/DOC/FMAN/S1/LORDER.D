

            lorder (1) --- order libraries for one-pass loading      07/18/82


            _U_s_a_g_e

                 lorder <object_file>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lorder' takes the given object code file and rearranges the
                 object modules to allow loading in one pass by the loader.


            _E_x_a_m_p_l_e_s

                 lorder =lib=/vthlib
                 lorder mylib


            _F_i_l_e_s

                 <object_file>.lib is generated


            _M_e_s_s_a_g_e_s

                 "Usage:  lorder ..."  for no object code file arguments


            _B_u_g_s

                 Does  not  complain  if  more  than  one object code file is
                 specified, but will only process the first one specified.


            _S_e_e _A_l_s_o

                 bmerge (5), brefs (5), tsort (1)






















            lorder (1)                    - 1 -                    lorder (1)


