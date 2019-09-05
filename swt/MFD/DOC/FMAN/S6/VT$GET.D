

            vt$get (6) --- get and edit a single line from input     07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$get (row, col, start, len)
                 integer row, col, start, len

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$get'  is  responsible  for  reading  characters from the
                 terminal and interpreting the special characters.  The first
                 two arguments are the 'row' and 'column' at which  to  start
                 accepting  input.   The  third  argument is the start of the
                 input area on the current row, and the  fourth  argument  is
                 the  length of the input area.  'Vt$get' will continue read-
                 ing from the terminal until a line termination character  is
                 input    (RETURN,    KILL_RIGHT_AND_RETURN,    MOVE_UP,   or
                 MOVE_DOWN).  The function return is  the  termination  code.
                 Any macros are expanded by a call to 'vt$idf'.


            _C_a_l_l_s

                 vt$def,  vt$err,  vt$idf,  vt$ndf,  vt$out,  vt$put, vtmove,
                 vtmsg, vtupd, Primos c1in


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other  vt?*  routines  (2)  and  (6),  se   (1),   and   the
                 _I_n_t_r_o_d_u_c_t_i_o_n  _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r (Se section)
                 for a list of available special characters.




















            vt$get (6)                    - 1 -                    vt$get (6)


