

            vtinfo (2) --- return VTH common block information       07/11/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtinfo (key, info)
                 integer key, info (ARB)

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtinfo'  is  used to return certain needed information from
                 the VTH common blocks.  The first argument is a key to  tell
                 'vtinfo'  what  set  of  information  to return.  The second
                 argument is an array to return the information.   The  func-
                 tion  return is OK if a correct key is given, and ERR other-
                 wise.

                 'Vtinfo'  currently  supports  the  following  value(s)  for
                 'key':

                 VT_MAXRC       returns  the  maximum  row and col values for
                                the user's terminal in the first two words of
                                'info'.

                 VT_WRAP        returns YES in 'info' if the  terminal  wraps
                                to the next line after putting a character in
                                the last column and NO otherwise.

                 VT_HWINS       returns  YES  in  'info'  if the terminal has
                                hardware insert capabilities.

                 VT_HWDEL       returns YES in 'info'  if  the  terminal  has
                                hardware delete capabilities.

                 VT_HWCEL       returns  YES  in  'info'  if the terminal has
                                hardware clear to end-of-line capabilities.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The key is checked as being legal, and  then  the  requested
                 information is simply copied from the VTH common blocks.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 info


            _S_e_e _A_l_s_o

                 other vt?* routines (2)






            vtinfo (2)                    - 1 -                    vtinfo (2)


