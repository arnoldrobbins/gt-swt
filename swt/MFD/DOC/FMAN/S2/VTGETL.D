

            vtgetl (2) --- get a line from the VTH screen            07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtgetl (str, row, column, length)
                 character str (ARB)
                 integer row, column, length

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtgetl' transfers data from the internal screen buffer to a
                 string  supplied by the user.  'Row' and 'column' locate the
                 starting position of the input field on the screen, and  the
                 argument 'length' specifies its length.  The function return
                 is the actual length of the of the string returned in 'str'.
                 Note  that 'vtgetl' doesn't actually perform a read; it sim-
                 ply returns what is in the internal screen buffer.  'Vtread'
                 must be called beforehand to allow the user to enter data.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A check is made to see that the  'row'  argument  is  within
                 bounds,  and  if  not,  the  string  returned is EOS and the
                 length returned is  0.   If  the  'column'  and/or  'length'
                 arguments cause a request that is off the screen, the string
                 is  truncated to the edge of the screen buffer.  Then a loop
                 simply retrieves  characters  from  the  screen  buffer  and
                 places them in 'str', and the length of the retrieved string
                 returned.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 vtread (2), and other vt?* routines (2)

















            vtgetl (2)                    - 1 -                    vtgetl (2)


