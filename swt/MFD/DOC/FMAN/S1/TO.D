

            to (1) --- send messages to a logged-in user             09/16/82


            _U_s_a_g_e

                 to (<login-name> | <user-number>) [<message>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'To'  is  used  to  send messages to another logged-in user.
                 The first argument is the login name or user number  of  the
                 user  to  whom  the  message  is  to  be sent.  If any other
                 arguments are present, they are assumed to be  message  text
                 and  are sent to the named user.  If the login name, or user
                 number, is the only argument specified, 'to' copies the text
                 of the message from standard input.

                 The message, preceded by the sender's name and  user  number
                 and  the  current  day  and  time,  will appear on the named
                 user's terminal when he is next prompted for  a  command  by
                 the Subsystem command interpreter.


            _E_x_a_m_p_l_e_s

                 to jack There seems to be a problem with se on the tvt...
                 to 16 Why is the system so slow?
                 message> to perry


            _F_i_l_e_s

                 =gossip=/<login-name> to hold the message
                 =gossip=/*<user-number> to hold the message


            _M_e_s_s_a_g_e_s

                 "Usage:  to ..."  if no arguments are specified.
                 "bad  user  number"  if  the user number is not in the range
                      1..128.
                 "bad user name" if the user name is  not  that  of  a  valid
                      user.
                 "User is busy.  Try later."  if message file is in use.


            _B_u_g_s

                 Gossip messages are neither secure nor private.


            _S_e_e _A_l_s_o

                 mail (1)






            to (1)                        - 1 -                        to (1)


