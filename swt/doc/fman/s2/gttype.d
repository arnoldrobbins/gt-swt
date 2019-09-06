

            gttype (2) --- return the user's terminal type           03/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gttype (ttype)
                 character ttype (MAXTERMTYPE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gttype'   obtains  the  user's  terminal  type  by  calling
                 routines to (1) look in the Subsystem common area, (2)  look
                 in  the =termlist= file, and (3) ask the user.  The terminal
                 type is checked in each case, and if it is  invalid,  it  is
                 ignored.   The  function returns YES if the character string
                 representing the terminal type is returned in 'ttype' and NO
                 otherwise.  Since 'gttype' will return NO only if  the  user
                 refuses  to  give a terminal type (by entering end-of-file),
                 most programs just terminate  with  a  call  to  'error'  if
                 'gttype' returns NO.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gttype' calls 'ttyp$r' to obtain the terminal type from the
                 common area.  If the string is empty or if the terminal type
                 in  the  common area is invalid, it calls 'ttyp$f' to obtain
                 the terminal type in the "=termlist="  file.   If  no  valid
                 type  is  present  in =termlist=, 'gttype' calls 'ttyp$q' to
                 request the terminal type from the user.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ttype


            _C_a_l_l_s

                 ttyp$f, ttyp$q, ttyp$r


            _S_e_e _A_l_s_o

                 gtattr (2), ttyp$v (6)













            gttype (2)                    - 1 -                    gttype (2)


